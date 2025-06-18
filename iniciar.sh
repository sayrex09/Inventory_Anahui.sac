#!/bin/bash

# ========================
# CONFIGURADOR ROBUSTO DE SERVIDOR LOCAL - SAYREX
# ========================

# Colores
verde="\e[32m"
rojo="\e[31m"
amarillo="\e[33m"
azul="\e[34m"
normal="\e[0m"

# Funciones de log
log_info() { echo -e "${azul}[INFO]${normal} $1"; }
log_ok()   { echo -e "${verde}[OK]${normal} $1"; }
log_warn() { echo -e "${amarillo}[WARN]${normal} $1"; }
log_err()  { echo -e "${rojo}[ERROR]${normal} $1"; }

# Verificar si es root
if [[ $EUID -ne 0 ]]; then
    log_err "Este script debe ejecutarse con permisos de superusuario (sudo)."
    exit 1
fi

# Cabecera
clear
echo -e "${verde}=============================================="
echo "     CONFIGURADOR DE DOMINIO LOCAL - SAYREX"
echo -e "==============================================${normal}"

# Solicitar nuevo dominio
read -p "🔧 Ingresa el nuevo dominio (ej: miweb.local): " dominio

# Validar dominio
if [[ -z "$dominio" || ! "$dominio" =~ ^[a-zA-Z0-9.-]+$ ]]; then
    log_err "Dominio inválido. Usa un formato como 'miweb.local'."
    exit 1
fi

# Solicitar puerto
read -p "🛠️  Puerto para el servidor PHP (default 3000): " puerto
puerto=${puerto:-3000}

# Detectar IP local
ip_lan=$(hostname -I | awk '{print $1}')
log_info "IP LAN detectada: ${amarillo}$ip_lan${normal}"

# ==========================
# 1. LIMPIEZA ANTERIOR
# ==========================
log_info "Eliminando configuraciones anteriores de dominios *.local..."
timestamp=$(date +%Y%m%d%H%M%S)
sudo cp /etc/hosts "/etc/hosts.bak.$timestamp"
sudo sed -i '/[[:space:]]\+.*\.local$/d' /etc/hosts

sudo sed -i '/^address=\/.*/d' /etc/dnsmasq.conf 2>/dev/null || true
sudo rm -f /etc/nginx/sites-enabled/*.local
sudo rm -f /etc/nginx/sites-available/*.local
log_ok "Configuraciones anteriores eliminadas."

# ==========================
# 2. CONFIGURAR NUEVO DOMINIO
# ==========================

# Configurar dnsmasq
log_info "Configurando dnsmasq para $dominio..."
if ! dpkg -s dnsmasq &>/dev/null; then
    sudo apt update && sudo apt install -y dnsmasq
else
    log_info "dnsmasq ya está instalado."
fi

echo "address=/$dominio/$ip_lan" | sudo tee -a /etc/dnsmasq.conf > /dev/null
if sudo systemctl restart dnsmasq; then
    log_ok "dnsmasq configurado y en funcionamiento."
else
    log_err "Error al reiniciar dnsmasq. Revisa con 'journalctl -xe'."
    exit 1
fi

# Activar Avahi si es .local
if [[ "$dominio" =~ \.local$ ]]; then
    log_info "Dominio .local detectado. Configurando Avahi..."

    if ! dpkg -s avahi-daemon &>/dev/null; then
        log_info "Instalando avahi-daemon..."
        sudo apt install -y avahi-daemon
    fi

    sudo systemctl enable avahi-daemon
    sudo systemctl restart avahi-daemon

    if systemctl is-active --quiet avahi-daemon; then
        log_ok "Avahi está activo."
    else
        log_err "Error: Avahi no se pudo iniciar correctamente."
    fi
fi

# Configurar Nginx
log_info "Configurando Nginx..."
sudo apt install -y nginx
cat <<EOF | sudo tee /etc/nginx/sites-available/$dominio > /dev/null
server {
    listen 80;
    server_name $dominio;

    location / {
        proxy_pass http://$ip_lan:$puerto;
        proxy_http_version 1.1;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF
sudo ln -sf /etc/nginx/sites-available/$dominio /etc/nginx/sites-enabled/$dominio
if sudo nginx -t && sudo systemctl reload nginx; then
    log_ok "Nginx configurado y recargado."
else
    log_err "Nginx tiene errores de configuración. Revisa con 'nginx -t'."
    exit 1
fi

# ==========================
# 3. INICIAR SERVIDOR PHP
# ==========================
if lsof -i :$puerto &>/dev/null; then
    log_warn "Ya hay un proceso usando el puerto $puerto. No se iniciará PHP."
else
    php -S 0.0.0.0:$puerto > /dev/null 2>&1 &
    php_pid=$!
    log_ok "Servidor PHP iniciado (PID: $php_pid) en puerto $puerto."
fi

# ==========================
# 4. MOSTRAR ACCESOS
# ==========================
sleep 1
echo -e "\n${azul}🌐 ACCESOS DISPONIBLES:${normal}"
echo -e "   ▸ Por dominio : ${amarillo}http://$dominio${normal}"
echo -e "   ▸ Por LAN     : ${amarillo}http://$ip_lan:$puerto${normal}"
echo -e "   ▸ Por localhost: ${amarillo}http://localhost:$puerto${normal}"

if command -v qrencode &>/dev/null; then
    echo -e "\n📱 Escanea para acceder desde otro dispositivo:"
    qrencode -t ANSIUTF8 "http://$dominio"
else
    log_info "Puedes instalar qrencode con: sudo apt install qrencode"
fi

echo -e "\n${verde}🎉 Configuración finalizada. Tu servidor está listo para usar.${normal}"
exit 0
