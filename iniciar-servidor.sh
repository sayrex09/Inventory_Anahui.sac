#!/bin/bash

clear
echo "======================================="
echo "     SISTEMA INVENTARIO - SAYREX"
echo "======================================="
echo "1. Iniciar en localhost:3000"
echo "2. Iniciar en red local (LAN)"
read -p "Seleccione una opción [1/2]: " opcion

if [ "$opcion" == "1" ]; then
    php -S localhost:3000
elif [ "$opcion" == "2" ]; then
    ip_local=$(hostname -I | awk '{print $1}')
    php -S "$ip_local:3000"
else
    echo "Opción inválida"
    exit 1
fi
