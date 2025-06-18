# 📦 Sistema de Gestión de Inventarios - Anahui S.A.C.

Este sistema ha sido diseñado para facilitar la gestión integral de inventarios de la empresa **Textil Anahui S.A.C.**, permitiendo un control preciso sobre productos, proveedores y movimientos de almacén en entornos de red local.

---

## 🚀 Inicio Rápido

### 📋 Requisitos mínimos

* PHP 7.4 o superior
* Distribución Linux (Debian, Ubuntu, Arch, etc.)
* Servidor Nginx
* `avahi-daemon` para resolución de dominios `.local`
* Navegador web moderno (Chrome, Firefox, Brave, etc.)

---

## 📂 Instalación y configuración automatizada

### 1. Clonar el repositorio del sistema

```bash
git clone https://github.com/tuusuario/sistema-inventario-anahui.git
cd sistema-inventario-anahui
```

---

### 2. Ejecutar el script de configuración

Para realizar una instalación limpia, configurar el entorno de red y poner en marcha el sistema, ejecuta el script incluido:

```bash
chmod +x configurar_servidor.sh
./configurar_servidor.sh
```

Este script realiza automáticamente:

* Eliminación de configuraciones previas en `/etc/hosts`, `dnsmasq` y `nginx`
* Registro del dominio `miweb.local` apuntando a tu IP de red local
* Instalación y configuración de `dnsmasq` para la resolución DNS en LAN
* Activación y configuración del servicio `avahi-daemon` para compatibilidad `.local`
* Generación del virtual host en Nginx apuntando al backend PHP
* Inicio automático del servidor PHP en `0.0.0.0:3000`
* Muestra un código QR para acceso rápido desde dispositivos móviles conectados a la red

---

## 🌐 Acceso al sistema

Una vez configurado, puedes acceder al sistema desde cualquier dispositivo conectado a la red local mediante:

* En tu PC: `http://miweb.local`
* Desde otros dispositivos: `http://miweb.local`
* Alternativamente (si falla Avahi): `http://<tu-ip-local>:3000`

> 💡 El uso de `dnsmasq` o `avahi-daemon` elimina la necesidad de recordar IPs o puertos.

---

## ✅ Verificaciones recomendadas

* Verificar que el servicio Avahi está activo:

```bash
systemctl status avahi-daemon
```

* Comprobar que el backend responde correctamente:

```bash
curl http://127.0.0.1:3000
```

* Validar la configuración de Nginx:

```bash
sudo nginx -t
```

---

## 📚 Recursos adicionales

* Documentación técnica del sistema: \[en construcción]
* Reporte detallado de implementación y arquitectura: \[en construcción]

---

## 👨‍💻 Autoría y créditos

Desarrollado por **Sayrex**
Proyecto académico de implementación para la empresa **Textil Anahui S.A.C.**
