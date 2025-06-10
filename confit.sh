#!/bin/bash

# ========= CONFIGURADOR LAN Y LOCAL =========

verde="\e[32m"
rojo="\e[31m"
amarillo="\e[33m"
normal="\e[0m"

clear
echo -e "${verde}=============================================="
echo "     CONFIGURADOR DE SERVIDOR EN RED LOCAL"
echo -e "==============================================${normal}"

# Solicitar dominios personalizados
read -p "🔧 Ingresa dominios separados por espacio (ej: miweb.lan anahui.lan): " dominios

# Detectar IP LAN
ip_lan=$(hostname -I | awk '{print $1}')
echo -e "🌐 IP LAN detectada: ${amarillo}$ip_lan${normal}"

# Modificar /etc/hosts (localmente)
echo -e "🛠 Modificando /etc/hosts..."
sudo cp /etc/hosts /etc/hosts.bak

for dom in $dominios; do
    sudo sed -i "/[[:space:]]$dom/d" /etc/hosts
    echo "$ip_lan   $dom" | sudo tee -a /etc/hosts > /dev/null
done
echo -e "${verde}✅ /etc/hosts actualizado.${normal}"

# Preguntar si desea configurar dnsmasq
read -p "🧩 ¿Deseas configurar dnsmasq para que todos los dispositivos usen los dominios? [s/n]: " dnsopt

if [[ "$dnsopt" == "s" || "$dnsopt" == "S" ]]; then
    echo -e "${amarillo}📦 Instalando y configurando dnsmasq...${normal}"
    sudo apt install dnsmasq -y
    for dom in $dominios; do
        echo "address=/$dom/$ip_lan" | sudo tee -a /etc/dnsmasq.conf > /dev/null
    done
    sudo systemctl restart dnsmasq
    echo -e "${verde}✅ dnsmasq configurado. Usa esta IP como DNS en otros dispositivos: $ip_lan${normal}"
fi

# Nginx
echo -e "\n🧩 Configurando Nginx..."
for dom in $dominios; do
    ruta="/etc/nginx/sites-available/$dom"
    if [ ! -f "$ruta" ]; then
        sudo tee "$ruta" > /dev/null <<EOF
server {
    listen 80;
    server_name $dom;

    location / {
        proxy_pass http://$ip_lan:3000;
        proxy_http_version 1.1;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF
        sudo ln -sf "$ruta" "/etc/nginx/sites-enabled/$dom"
    fi
done
sudo nginx -t && sudo systemctl reload nginx
echo -e "${verde}✅ Nginx listo.${normal}"

# Mostrar acceso
echo -e "\n🌍 Accede al sistema desde:"
for dom in $dominios; do
    echo -e "   ▸ http://${amarillo}$dom${normal}"
done
echo -e "   ▸ http://${amarillo}$ip_lan:3000${normal} (por IP directa)"

echo -e "\n📤 Si no usas dnsmasq, agrega esta línea en otros dispositivos:"
for dom in $dominios; do
    echo -e "${amarillo}$ip_lan   $dom${normal}"
done

echo -e "\n${verde}🎉 Configuración completada exitosamente.${normal}"
