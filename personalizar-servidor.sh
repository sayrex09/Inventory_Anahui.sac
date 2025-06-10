#!/bin/bash

# ========= CONFIGURADOR LAN Y LOCAL =========

# Colores
verde="\e[32m"
rojo="\e[31m"
amarillo="\e[33m"
normal="\e[0m"

clear
echo -e "${verde}=============================================="
echo "     CONFIGURADOR DE SERVIDOR EN RED LOCAL"
echo -e "==============================================${normal}"

# Solicitar dominios personalizados
read -p "🔧 Ingresa dominios separados por espacio (ej: miweb.local): " dominios

# Detectar IP local LAN
ip_lan=$(hostname -I | awk '{print $1}')
echo -e "🌐 IP LAN detectada: ${amarillo}$ip_lan${normal}"

# Modificar /etc/hosts (solo para el equipo actual)
echo -e "🛠 Modificando /etc/hosts localmente..."
sudo cp /etc/hosts /etc/hosts.bak

for dom in $dominios; do
    sudo sed -i "/[[:space:]]$dom/d" /etc/hosts
    echo "$ip_lan   $dom" | sudo tee -a /etc/hosts > /dev/null
done
echo -e "${verde}✅ /etc/hosts actualizado.${normal}"

# Verificar Avahi
echo -e "\n📦 Verificando Avahi..."
if ! dpkg -s avahi-daemon &>/dev/null; then
    echo -e "🔄 Instalando avahi-daemon..."
    sudo apt update
    sudo apt install avahi-daemon -y
fi
sudo systemctl enable avahi-daemon
sudo systemctl restart avahi-daemon
echo -e "${verde}✅ Avahi está activo (para dominios .local).${normal}"

# Configurar Nginx como proxy para IP LAN
echo -e "\n🧩 Configurando Nginx..."
for dom in $dominios; do
    config_path="/etc/nginx/sites-available/$dom"
    if [ ! -f "$config_path" ]; then
        sudo tee "$config_path" > /dev/null <<EOF
server {
    listen 80;
    server_name $dom;

    location / {
        proxy_pass http://$ip_lan:3000;
        proxy_http_version 1.1;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF
        sudo ln -sf "$config_path" "/etc/nginx/sites-enabled/$dom"
    fi
done

# Verificar configuración y recargar Nginx
sudo nginx -t && sudo systemctl reload nginx
echo -e "${verde}✅ Nginx recargado.${normal}"

# Mostrar acceso
echo -e "\n🌍 Acceso al sistema desde otros dispositivos:"
for dom in $dominios; do
    echo -e "   ▸ http://${amarillo}$dom${normal} (requiere soporte mDNS)"
done
echo -e "   ▸ http://${amarillo}$ip_lan:3000${normal} (compatible con todos)"

echo -e "\n${verde}🎉 Configuración completada exitosamente.${normal}"
