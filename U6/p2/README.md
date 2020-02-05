
# P2: Salt stack

## 1. Preparativos

| Config   | MV1           | MV2          |
| -------- | ------------- | ------------ |
| Alias    | Master        | Minion       |
| Hostname | master24g     | minion24g    |
| SO       | OpenSUSE      | OpenSUSE     |
| IP       | 172.19.24.31  | 172.19.24.32 |

Configuramos también el fichero */etc/hosts* con "IP nombre" de ambas máquinas.

![](img/1.png)

![](img/2.png)

## 2. Master: instalar y configurar

Instalamos el software master ejecutando *zypper install salt-master*.

![](img/3.png)

Modificamos el fichero */etc/salt/master* para configurarlo de la siguiente manera:

![](img/4.png)

Activamos el servicio en el arranque del sistema.

![](img/5.png)

Y lo iniciamos.

![](img/6.png)

Por último consultamos los minions aceptados, por ahora ninguno.

![](img/7.png)

## 3. Minion

### 3.1 Instalación y configuración

Instalamos el software del agente ejecutando *zypper install salt-minion*.

![](img/8.png)

Modificamos el fichero */etc/salt/minion* para definir quien será nuestro master.

![](img/9.png)

Activamos el servicio en el arranque del sistema y lo iniciamos.

![](img/10.png)

Comprobamos que **apache2** no está instalado.

![](img/11.png)


### 3.2 Aceptación desde el Master

Vemos que el Master a recibido la petición.

![](img/12.png)

La aceptamos con *salt-key -a minion*.

![](img/13.png)

Y comprobamos que ha sido aceptado.

![](img/14.png)


### 3.3 Comprobar conectividad

Comprobamos la conectividad desde el Master.

![](img/15.png)


## 4. Salt States

### 4.1 Preparar el directorio para los estados

Creamos los siguientes directorios y ficheros.

![](img/16.png)

El contenido del fichero será:

![](img/17.png)

Y reiniciamos el servicio.

![](img/18.png)


### 4.2 Crear un nuevo estado

Creamos el fichero */srv/salt/base/apache/init.sls*:

![](img/19.png)


### 4.3 Asociar Minions a estados

Creamos el fichero */srv/salt/base/top.sls* donde asociamos a todos los Minions con el estado que hemos creado.

![](img/20.png)


### 4.4 Comprobar: estados definidos

Consultamos los estados con el comando:

![](img/21.png)


### 4.5 Aplicar el nuevo estado

Consultamos los estados en detalle y verificamos que no hay errores.

![](img/22.png)

![](img/23.png)

Aplicamos el estado en todos los minions.

![](img/24.png)

Y comprobamos en el Minion que apache ha sido instalado.

![](img/25.png)


## 5. Crear más estados

### 5.1 Crear estado "users"

Creamos el directorio */srv/salt/base/users* y el fichero */srv/salt/base/users/init.sls* con el siguiente contenido:

![](img/26.png)

Y aplicamos el estado.

![](img/27.png)

![](img/28.png)

Como podemos ver en el cliente, se han creado correctamente.

![](img/29.png)

### 5.2 Crear estado "directories"

Creamos el directorio */srv/salt/base/directories* y el fichero */srv/salt/base/directries/init.sls* con el siguiente contenido:

![](img/30.png)

Y aplicamos el estado.

![](img/31.png)

Comprobamos en el cliente que las carpetas se han creado adecuadamente.

![](img/32.png)


## 6. Añadir Minion de otro SO

Instalamos *salt-minion* en una máquina Windows, introduciendo los campos requeridos durante la instalación.

![](img/33.png)

Al acabar de instalar nos da la opcion de iniciar el servicio, pero también podemos iniciarlo desde una consola como administrador ejecutando *sc start salt-minion*.

![](img/34.png)

Ahora comprobamos en el servidor las peticiones pendientes.

![](img/35.png)

Aceptamos al nuevo minion.

![](img/36.png)

Y comprobamos que ha sido aceptado.

![](img/37.png)
