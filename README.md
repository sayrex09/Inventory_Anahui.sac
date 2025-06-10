# 📦 Sistema de Gestión de Inventarios - Anahui S.A.C.

Este sistema permite controlar y gestionar eficientemente los inventarios de la empresa **Textil Anahui S.A.C.**, optimizando el seguimiento de productos, proveedores y movimientos de almacén.

---

## 🚀 Inicio Rápido

### 📋 Requisitos

- PHP 7.4 o superior
- Linux (Debian, Ubuntu, Arch, etc.)
- Nginx instalado
- `avahi-daemon` para resolver dominios `.local` en la red
- Navegador web moderno (Chrome, Firefox, Brave, etc.)

---

## 📂 Instalación y configuración

### 1. Clonar el repositorio

```bash
git clone https://github.com/tuusuario/sistema-inventario-anahui.git
cd sistema-inventario-anahui
```

---

### 2. Configurar el dominio local `miweb.local`

Edita el archivo `/etc/hosts`:

```bash
sudo nano /etc/hosts
```

Agrega o modifica las siguientes líneas:

```
127.0.0.1       localhost miweb.local
192.168.1.10    miweb.local   # Reemplaza con tu IP local si es distinta
127.0.1.1       miweb
```

---

### 3. Instalar y activar Avahi

Esto permite que otros dispositivos en tu red resuelvan `miweb.local`.

```bash
sudo apt update
sudo apt install avahi-daemon -y
sudo systemctl enable avahi-daemon
sudo systemctl start avahi-daemon
```

---

### 4. Configurar Nginx como proxy inverso

Crea un nuevo archivo de configuración:

```bash
sudo nano /etc/nginx/sites-available/miweb
```

Contenido:

```nginx
server {
    listen 80;
    server_name miweb.local;

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

Activa el sitio:

```bash
sudo ln -s /etc/nginx/sites-available/miweb /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
```

---

## ▶️ Ejecutar el servidor

Puedes iniciar el servidor ejecutando el script:

```bash
./iniciar-servidor.sh
```

Este script te permite elegir entre iniciar en `localhost` o en la red LAN.

---

## 🌍 Acceder al sistema

* Desde tu PC: `http://miweb.local`
* Desde otros dispositivos conectados a la misma red: `http://miweb.local`
* Alternativamente (si falla Avahi): `http://<tu-ip-local>:3000`

---

## ✅ Verificación

* Verifica que Avahi está activo:

```bash
systemctl status avahi-daemon
```

* Verifica que el backend responde:

```bash
curl http://127.0.0.1:3000
```

* Verifica que Nginx está correctamente configurado:

```bash
sudo nginx -t
```

---

## 🧰 Recursos adicionales

* Documentación del sistema: [en construcción]
* Reporte técnico de implementación: [en construcción]

---

## 🧑‍💻 Autor

Desarrollado por **Sayrex**  
Proyecto académico para la empresa **Textil Anahui S.A.C.**
