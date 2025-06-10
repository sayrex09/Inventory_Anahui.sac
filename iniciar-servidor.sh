#!/bin/bash

# ========================
# SISTEMA DE INVENTARIO - SAYREX
# Script de inicio dinámico con soporte para LAN + dominio
# ========================

# Colores
verde="\e[32m"
rojo="\e[31m"
azul="\e[34m"
amarillo="\e[33m"
normal="\e[0m"

clear

# Variables de red
ip_local=$(hostname -I | awk '{print $1}')
dominio="miweb.local"  # Debes tenerlo configurado en Nginx y Avahi

# Menú
echo -e "${azul}======================================="
echo "     SISTEMA DE INVENTARIO - SAYREX"
echo -e "=======================================${normal}"
echo "1. Iniciar en localhost:3000"
echo "2. Iniciar en red LAN (http://$ip_local:3000)"
echo "3. Iniciar con dominio ($dominio)"
echo "4. Mostrar URLs disponibles"
echo "5. Salir"
echo -e "${azul}=======================================${normal}"
read -p "Seleccione una opción [1-5]: " opcion

case "$opcion" in
    1)
        echo -e "${verde}[✓] Iniciando en ${amarillo}http://localhost:3000${normal}"
        php -S localhost:3000
        ;;
    2)
        echo -e "${verde}[✓] Iniciando en ${amarillo}http://$ip_local:3000${normal}"
        php -S 0.0.0.0:3000
        ;;
    3)
        echo -e "${verde}[✓] Usando Nginx para servir ${amarillo}http://$dominio${normal}"
        echo -e "${amarillo}↪ Asegúrate que Nginx esté corriendo y configurado para ese dominio.${normal}"
        sudo systemctl restart nginx
        echo -e "${verde}Nginx reiniciado. Puedes acceder a http://$dominio desde dispositivos compatibles en la red.${normal}"
        ;;
    4)
        echo -e "\n${azul}🌐 Accesos disponibles:${normal}"
        echo -e "   ▸ Localhost : ${amarillo}http://localhost:3000${normal}"
        echo -e "   ▸ LAN       : ${amarillo}http://$ip_local:3000${normal}"
        echo -e "   ▸ Dominio   : ${amarillo}http://$dominio${normal} ${rojo}(requiere Nginx + Avahi o DNS)${normal}"
        ;;
    5)
        echo -e "${rojo}👋 Saliendo...${normal}"
        exit 0
        ;;
    *)
        echo -e "${rojo}❌ Opción inválida.${normal}"
        exit 1
        ;;
esac
