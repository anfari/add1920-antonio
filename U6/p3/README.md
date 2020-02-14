
# P3: Docker

## 1. Contenedores con Docker

### 1.1 Requisitos

Usaremos una MV OpenSuse, asegurándonos de que su versión de Kernel es 3.10 o superior. (*uname -a*)

![kernel--v](img/1.png)

### 1.2 Habilitar el acceso a la red externa a los contenedores

Para conseguir esto, debemos activar la opción **IP_FORWARD** (*net.ipv4.ip_forward*). Para esto vamos a *Yast -> Ajuster de red -> Encaminamiento -> Habilitar reenvío de IPv4*.

![ip_forward](img/2.png)

Tras esto reiniciamos el equipo para aplicar los cambios.

## 2. Instalación y primeras pruebas

Ejecutamos todos los comandos con permisos de superusuario.

### 2.1 Instalación

Lo primero es instalar docker: **zyper in docker**

![inst_docker](img/3.png)

Una vez instalado iniciamos el servicio: **systemctl tart docker**

![ctl_start](img/4.png)

Para ver información mas detallada ejecutamos: **docker version**

![dock_v](img/5.png)

### 2.2 Primera prueba

Para ver que todo funciona comprobamos las imágenes descargadas (ninguna) con: **docker images**

![](img/6.png)

Y lo mismo para los contenedores: **docker ps -a**

![](img/7.png)

Para la primera prueba descargaremos y ejecutaremos un contenedor con la imagen "hello-world".

![](img/8.png)

* Vemos la nueva imagen: **docker images**

![](img/9.png)

* El contenedor está en estado "Exited"

![](img/10.png)

* Paramos el contenedor: **docker stop IDContainer**

![](img/11.png)

* Y lo eliminamos: **docker rm IDContainer**

![](img/12.png)


## 3. Creación manual

### 3.1 Crear una imagen manualmente

* Vemos las imágenes disponibles localmente: **docker images**

![](img/13.png)

* Buscamos en los repositorios de Docker Hub contenedores con la etiqueta 'debian': **docker search debian**

![](img/14.png)

* Descargamos una imagen 'debian' en local: **docker pull debian**

![](img/15.png)

* Comprobamos que esta en la lista:

![](img/16.png)

* Para ver todos los contenedores: **docker ps -a**
* Para ver sólo los contenedores en ejecución: **docker ps**

Ahora vamos a crear un contenedor con nombre *con_debian* a partir de la imagen *debian*, y ejecutaremos */bin/bash*:
**docker run --name=con_debian -i -t debian:9 /bin/bash**

![](img/17.png)

### 3.2 Personalizar el contenedor

Ahora que estamos dentro del contenedor vamos a personalizarlo:

**Instalar aplicaciones dentro del contenedor**

* Comprobamos que estamos en Debian:

![](img/18.png)

* Actualizamos los repositorios: **apt-get update**

* Instalamos nginx:

![](img/19.png)

* Instalamos editor vi:

![](img/20.png)

**Crear un fichero HTML**  holamundo.html

* Creamos el fichero:

![](img/21.png)

* Ejecutamos el servicio nginx:

![](img/22.png)

**Crear un script**

* Creamos el script */root/server.sh* con el contenido:

![](img/23.png)

* Y le damos permisos de ejecución.


### 3.3 Crear una imagen a partir del contenedor

Abrimos una terminal y creamos la nueva imagen a partir del CONTAINERID con el comando **docker commit con_debian nombre-del-alumno/nginx**

![](img/24.png)

Comprobamos que se ha creado.

![](img/25.png)


### 3.4 Limpiamos

Eliminamos el contenedor:

* Paramos el contenedor: **docker stop con_debian**

![](img/26.png)

* Eliminamos el contenedor: **docker rm con_debian**

![](img/27.png)

* Comprobamos: **docker ps -a**

![](img/28.png)


## 4.Crear contenedor a partir de nuestra imagen

### 4.1 Crear contenedor con Nginx

Iniciamos el contenedor a partir de la imagen creada anteriormente.

![](img/29.png)

### 4.2 Comprobamos

En otra terminal ejecutamos **docker ps** para ver los contenedores en ejecución, y el puerto que utiliza.

![](img/30.png)

Ahora abrimos un navegador y ponemos la URL 0.0.0.0:32768 para conectarnos el Nginx que el contenedor está ejecutando.

![](img/31.png)

Comprobamos el acceso a *holamundo.html*

![](img/32.png)

Con esto hemos terminado esta parte, así que paramos el contenedor y lo eliminamos.

![](img/33.png)

### 4.3 Migrar la imagen a otra máquina

Exportamos la imagen Docker a fichero tar:

![](img/34.png)

Intercambiamos la imagen con un compañero de clase y la importamos:

![](img/35.png)

Y comprobamos que la imagen está disponible.

![](img/36.png)

## 5. Crear un contenedor a partir de un Dockerfile

Vamos a conseguir lo mismo que en el apartado anterior pero usando un fichero de configuración.

### 5.1 Preparar ficheros

Creamos el directorio */home/antonio/docker24* y dentro ponemos los fichero *holamundo.html* y *server.sh* creados anteriormente.

![](img/37.png)

También creamos el fichero *Dockerfile* con el contenido:

![](img/38.png)

### 5.2 Crear imagen a partir del Dockerfile

El fichero Dockerfile contiene toda la información necesaria para construir el contenedor, así que creamos una nueva imagen a partir de este:

![](img/39.png)

Una vez termine, aparecerá en la lista de imágenes.

![](img/40.png)

### 5.3 Crear contenedor y comprobar

Ahora crearemos un contenedor con el nombre **con_nginx2** a partir de la imagen que acabamos de crear, forzando el puerto de escucha al 8080.

* docker run --name=con_nginx2 -p 8080:80 -t antonio/nginx2

![](img/41.png)

Comprobamos que el puerto efectivmente es 8080.

![](img/42.png)

Y accedemos a través del navegador.

![](img/43.png)

También comprobamos que carga nuestro html.

![](img/44.png)

### 5.4 Usar imágenes ya creadas

Creamos un directorio **docker24b**, copiamos el fichero *holamundo.html* y creamos el siguiente *Dockerfile* en su interior:

![](img/45.png)

Creamos la imagen.

![](img/46.png)

![](img/47.png)

Y creamos el contenedor.

![](img/48.png)

Ya podemos acceder.

![](img/49.png)

![](img/50.png)


## 6. Limpiar contenedores e imágenes

Ya que hemos terminado con los contenedores es buena idea pararlos y/o eliminarlos.

![](img/51.png)

Lo mismo para las imágenes.

![](img/52.png)
