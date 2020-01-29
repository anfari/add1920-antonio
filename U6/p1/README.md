
# P1: Vagrant con VirtualBox

| Sección               |
| --------------------- |
| (3.3) Comprobar proyecto 1    |
| (5.2) Comprobar proyecto 2    |
| (6.1) Suministro Shell Script |
| (6.2) Suministro Puppet       |
| (7.2) Crear Box Vagrant       |


## 3.3 Comprobar proyecto 1

Dentro de la carpeta *vagrant24-proyecto1* ejecutamos *vagrant up*.

```
asir@marte24:~/Vagrant/vagrant24-proyecto1> vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'ubuntu/bionic64'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'ubuntu/bionic64' version '20200121.0.0' is up to date...
==> default: Setting the name of the VM: vagrant24-proyecto1_default_1579689036407_94229
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
==> default: Forwarding ports...
    default: 22 (guest) => 2222 (host) (adapter 1)
==> default: Running 'pre-boot' VM customizations...
==> default: Booting VM...
==> default: Waiting for machine to boot. This may take a few minutes...
    default: SSH address: 127.0.0.1:2222
    default: SSH username: vagrant
    default: SSH auth method: private key
    default: Warning: Connection reset. Retrying...
    default: Warning: Remote connection disconnect. Retrying...
    default:
    default: Vagrant insecure key detected. Vagrant will automatically replace
    default: this with a newly generated keypair for better security.
    default:
    default: Inserting generated public key within guest...
    default: Removing insecure key from the guest if it's present...
    default: Key inserted! Disconnecting and reconnecting using new SSH key...
==> default: Machine booted and ready!
==> default: Checking for guest additions in VM...
    default: The guest additions on this VM do not match the installed version of
    default: VirtualBox! In most cases this is fine, but in rare cases it can
    default: prevent things such as shared folders from working properly. If you see
    default: shared folder errors, please make sure the guest additions within the
    default: virtual machine match the version of VirtualBox you have installed on
    default: your host and reload your VM.
    default:
    default: Guest Additions Version: 5.2.34
    default: VirtualBox Version: 6.0
==> default: Mounting shared folders...
    default: /vagrant => /home/asir/Vagrant/vagrant24-proyecto1
asir@marte24:~/Vagrant/vagrant24-proyecto1>
```

Una vez se ha iniciado la máquina, nos conectamos a ella mediante SSH utilizando el comando **vagrant ssh**.

![vagrant_ssh](img/1.png)


## 5.2 Comprobar proyecto 2

Para comprobar que hay un servicio a la escucha en el puerto 4567, abrimos una consola en la máquina real y ejecutamos **vagrant port**.

![vagrant_pot](img/2.png)

También podemos abrir la URL http://127.0.0.1:4567 en el navegador, accediendo así al puerto 80 y comprobando que el servicio **apache** funciona.

![it_works](img/3.png)


## 6.1 Suministro Shell Script

Creamos el directorio *vagrant24-proyecto3* y dentro un proyecto Vagrant.

![proyecto3](img/4.png)

Creamos el script *install_apache.sh* y añadimos lo siguiente:

![touch_install](img/5.png)


![install_apache](img/6.png)

Le damos al script permisos de ejecución.

![sh +x](img/7.png)

Indicamos a Vagrant que debe ejecutar el script dentro del entorno virtual, para esto añadimos a Vagrantfile las siguientes lineas.

![vagrantfile](img/8.png)

Creamos la máquina.

![vagrant up](img/9.png)

Si nos fijamos, durante la instalación veremos como se instalan los paquetes necesarios.

![](img/10.png)

Debido al funcionamiento del script, es fichero **index.html** es creado en */var/www/index.html* y debería de estar en */var/www/html/index.html*, por lo que de manera provisional moveremos el archivo a esta ruta y todo funcionará correctamente

![web_check](img/11.png)


## 6.2 Suministro Puppet

Creamos el directorio *vagrant24-proyecto4* y un nuevo proyecto.

![create_p4](img/12.png)

Modificamos el fichero Vagrantfile de la siguiente forma.

![vagrantfile](img/13.png)

Y creamos el fichero *manifests/default.pp* con las órdenes puppet para instalar el programa deseado.

![default.pp](img/14.png)

Levantamos la máquina y nos conectamos a ella para instalar el paquete **Puppet**.

![install_puppet](img/16.png)

Luego recargamos la configuración con ***vagrant reload*** y volvemos a ejecutar la provisión ***vagrant provision***, con esto ya se habrá instalado el paquete.

![whereis_nmap](img/15.png)


## 7.2 Crear Box Vagrant

Creamos una carpeta *vagrant24-bulls* para el proyecto.

![mkdir_bulls](img/17.png)

Elegimos la máquina que queremos para crear nuestra propia caja, para ello podemos ver los nombres de estas con el comando: *VBoxManage list vms*.

![vboxs_list](img/18.png)

Nos aseguramos de que la máquina está apagada y ejecutamos *vagrant package --base VMNAME package.box* para crear nuestra caja.

![create_box](img/19.png)

Comprobamos que se ha creado el fichero *package.box*

![pack_box](img/20.png)

Añadimos la caja que hemos creado al repositorio local de cajas de vagrant con *vagrant box add nombre-alumnoXX/bulls package.box*.

![add_box](img/21.png)

Y consultamos la lista de cajas para comprobar que ha sido añadida.

![box_chack](img/22.png)
