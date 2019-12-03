# Ssamba (con OpenSUSE y Windows)

| Secciones |
|-----------|
| **(1.4 y 1.5) Fichero smb.conf** |
| **(2.1 y 2.2) Conexión SMB desde Windows** |
| **(3.1 y 3.2) Conexión SMB desde GNU/Linux** |
| **(3.3) Montaje automático** |

---

### 1.4 Configurar el servidor Samba

Realizamos una copia de seguridad del fichero de configuración existente.

![](img/1.png)

Y desde *Yast -> Servidor Samba* asignamos el grupo de trabajo.

![](img/2.png)

En la siguiente ventana marcamos el inicio del servicio durante el arranque de la máquina y abrimos los puertos en el cortafuegos.

![](img/3.png)

### 1.5 Crear los recursos compartidos de Samba

Desde *Yast -> Servidor Samba -> Recursos compartidos* añadimos las secciones global, cdrom, public, barco y castillo.

![](img/4.png)

![](img/5.png)

![](img/6.png)

![](img/7.png)

### 2.1
