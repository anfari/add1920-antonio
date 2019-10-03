# A2: Acceso remoto con SSH

| Función | Sistema Operativo | IP | Nombre |
| ------- |------------------ | -- | ------ |
| Un servidor SSH| GNU/Linux OpenSUSE | 172.19.24.31 | ssh-server24g |
| Un cliente SSH | GNU/Linux OpenSUSE | 172.19.24.32 | ssh-client24g |
| Un servidor SSH | Windows Server| 172.19.24.11 | ssh-server24s |
| Un cliente SSH | Windows7 | 172.19.24.12 | ssh-cliente4w |


## 2.2 Primera conexión SSH GNU/Linux

Desde el cliente *ssh-client24g* comprobamos la conectividad con el servidor *ssh-server24g* mediante un ping.

![2.2.1](img/2.2.2.png)

Y también comprobamos que el servidor tiene el puerto 22 (puerto del ssh) abierto.

![2.2.2](img/2.2.1.png)

Tras esto nos conectamos mediante ssh al servidor desde nuestro cliente.

![2.2.3](img/2.2.3.png)

En el fichero *$HOME/.ssh/known_hosts* podemos ver la clave de identificación del servidor.

![](img/2.2.4.png)

## 3.2 Comprobamos (Cambiar la identidad del servidor)

Después de definir que solo utilizaremos las claves RSA y regenerar las claves públicas/privadas de nuestro servidor, comprobamos que sucede si nos conectamos desde nuestros dos clientes.

![warning_linux](img/3.1.1.png)

![warning_windows](img/3.1.3.png)

Como resultado nos da un **WARNING** avisando de que la identificación del host ha cambiado y que podemos ser víctimas de algún ataque.

Para solucionar esto y que nos deje conectar al servidor:

* En Windows simplemente clickamos en ***Sí***, aceptando la nueva clave.

* En Linux debemos utilizar el siguiente comando para borrar la clave antigua y poder acceder de nuevo.
> ssh-keygen -R ssh-server24g -f $HOME/username/.ssh/known_hosts

![sol_linux](img/3.1.2.png)

## 5. Autenticación mediante claves públicas

Lo primero será generar un nuevo par de claves para nuestro usuario con el comando:
> ssh-keygen -t rsa

Estas claves se generarán en los ficheros:
* */home/username/.ssh/id_rsa*
* */home/username/.ssh/id_rsa.pub*

![rsa_gen](img/5.1.png)

Ahora copiaremos la clave pública (*id_rsa.pub*) al fichero "*authorized_keys*" del usuario remoto *farina4* en el servidor con el comando:
>ssh-copy-id farina4@ssh-server24g

![5.2](img/5.2.png)

Si ahora tratamos de acceder con este usuario desde ambos clientes veremos que:

* Desde *ssh-client24g* no pide contraseña.

![5.3](img/5.3.png)

* Desde *ssh-client4w* pide contraseña.

![5.4](img/5.4.png)

## 6. Uso de SSH como túnel para X

Instalamos una aplicación de entorno gráfico que no este en los clientes, en mi caso *Geany*.

Modificamos el servidor para premitir ejecuta aplicaciones gráficas, esto se hace descomentando la linea *X11Forwarding yes* en el fichero */etc/ssh/sshd_config*.

![6.1](img/6.1.png)

Ahora en el cliente, comprobamos que no tenemos el *Geany* instalado.

![6.2](img/6.2.png)

Para terminar nos conectamos vía ssh al servidor con el parámetro ***-X*** para poder ejecutar la aplicación desde el servidor.

![6.3](img/6.3.png)

## 8.1 Restricción sobre un usuario

Lo siguiente será crear una restricción de uso del SSH para el usuario *farina2*.

Modificamos el fichero ***/etc/ssh/sshd_config*** añadiendo la linea *DenyUsers* seguida del nombre de los usuarios a denegar.

![8.1](img/8.1.png)

Si probamos a entrar al servidor vía SSH con el usuario *farina2* nos denegará el permiso.

![8.2](img/8.2.png)


## 9. Servidor SSH en Windows

Configuramos un Windows Server y añadimos los clientes en el fichero ***C:\Windows\System32\drivers\etc\hosts***.

![9.1](img/9.1.png)

Comprobamos la conexión con ambos equipos median un ping.

![9.2](img/9.2.png)

Ahora instalamos el servidor SSH en windows utilizando en la *powershell* (como administrador) el comando:
> Falta comando del campus

![](img/9.3.png)

Comprobamos el acceso SSH desde los clientes.

* Linux

![](img/9.4.png)

![](img/9.5.png)

* Windows

![](img/9.6.png)

![](img/9.7.png)
