#!/bin/bash

# ========================
# CONFIGURADOR LIMPIO DE SERVIDOR LOCAL - SAYREX
# ========================

verde="\e[32m"
rojo="\e[31m"
amarillo="\e[33m"
azul="\e[34m"
normal="\e[0m"

clear
echo -e "${verde}=============================================="
echo "     CONFIGURADOR DE DOMINIO LOCAL - SAYREX"
echo -e "==============================================${normal}"

# Solicitar nuevo dominio
read -p "🔧 Ingresa el nuevo dominio (ej: miweb.local): " dominio

# Detectar IP local
ip_lan=$(hostname -I | awk '{print $1}')
echo -e "🌐 IP LAN detectada: ${amarillo}$ip_lan${normal}"

# ==========================
# 1. LIMPIEZA ANTERIOR
# ==========================
echo -e "${amarillo}🧹 Limpiando configuraciones anteriores...${normal}"

# Limpiar /etc/hosts
sudo cp /etc/hosts /etc/hosts.bak
sudo sed -i '/\.local$/d' /etc/hosts
echo "$ip_lan   $dominio" | sudo tee -a /etc/hosts > /dev/null

# Limpiar dnsmasq
sudo sed -i '/address=\/.*\.local\//d' /etc/dnsmasq.conf 2>/dev/null || true

# Limpiar configuraciones Nginx
sudo rm -f /etc/nginx/sites-enabled/*.local
sudo rm -f /etc/nginx/sites-available/*.local

echo -e "${verde}✅ Configuraciones anteriores eliminadas.${normal}"

# ==========================
# 2. CONFIGURAR NUEVO DOMINIO
# ==========================

# Configurar dnsmasq
echo -e "\n📦 Configurando dnsmasq para $dominio..."
sudo apt install -y dnsmasq
echo "address=/$dominio/$ip_lan" | sudo tee -a /etc/dnsmasq.conf > /dev/null
sudo systemctl restart dnsmasq
echo -e "${verde}✅ dnsmasq configurado.${normal}"

# Configurar Avahi si es .local
if [[ "$dominio" =~ \.local$ ]]; then
    echo -e "📡 Activando Avahi para dominios .local..."
    sudo apt install -y avahi-daemon
    sudo systemctl enable avahi-daemon
    sudo systemctl restart avahi-daemon
    echo -e "${verde}✅ Avahi activo.${normal}"
fi

# Configurar Nginx
echo -e "🧩 Configurando Nginx..."
sudo apt install -y nginx
cat <<EOF | sudo tee /etc/nginx/sites-available/$dominio > /dev/null
server {
    listen 80;
    server_name $dominio;

    location / {
        proxy_pass http://$ip_lan:3000;
        proxy_http_version 1.1;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF
sudo ln -sf /etc/nginx/sites-available/$dominio /etc/nginx/sites-enabled/$dominio
sudo nginx -t && sudo systemctl reload nginx
echo -e "${verde}✅ Nginx configurado y recargado.${normal}"

# ==========================
# 3. INICIAR SERVIDOR PHP
# ==========================
echo -e "\n🚀 Iniciando servidor PHP en ${amarillo}http://0.0.0.0:3000${normal}"
php -S 0.0.0.0:3000 &

# ==========================
# 4. MOSTRAR ACCESOS
# ==========================
sleep 1
echo -e "\n${azul}🌐 ACCESOS DISPONIBLES:${normal}"
echo -e "   ▸ Por dominio : ${amarillo}http://$dominio${normal}"
echo -e "   ▸ Por LAN     : ${amarillo}http://$ip_lan:3000${normal}"
echo -e "   ▸ Por localhost: ${amarillo}http://localhost:3000${normal}"

# Mostrar QR
if command -v qrencode &>/dev/null; then
    echo -e "\n📱 Escanea para acceder desde otro dispositivo:"
    qrencode -t ANSIUTF8 "http://$dominio"
else
    echo -e "\n📦 Puedes instalar qrencode con: ${amarillo}sudo apt install qrencode${normal}"
fi

echo -e "\n${verde}🎉 Configuración finalizada. Tu servidor está listo para usar.${normal}"
