#!/usr/bin/env ruby

option = ARGV[0]
filename = ARGV[1]

def check(package)
  status = `whereis #{package[0]} | grep bin | wc -l`.chop

  if status == "0"
    puts "#{package[0]} - (U) uninstalled"
  elsif status == "1"
    puts "#{package[0]} - (I) installed"
  end
end

def install(package)
  status = `whereis #{package[0]} | grep bin | wc -l`.chop

  if package[1] == "install"
    if status == "0"
      `apt-get install -y #{package[0]}`
      puts "#{package[0]} instalado."
    elsif status == "1"
      puts "#{package[0]} ya instalado"
    end

  elsif package[1] == "remove"
    if status == "0"
      puts "#{package[0]} no está instalado"
    elsif status == "1"
      `apt-get remove -y #{package[0]}`
      puts "#{package[0]} desinstalado"
    end
  end
end


if option.nil?
  puts 'Ejecute con el parámetro "--help" para ver la ayuda.'

elsif option == '--help'
  puts 'Usage:
        systemctml [OPTIONS] [FILENAME]
Options:
        --help, mostrar esta ayuda.
        --version, mostrar información sobre el autor del script
                   y fecha de creacion.
        --status FILENAME, comprueba si puede instalar/desintalar.
        --run FILENAME, instala/desinstala el software indicado.
Description:

        Este script se encarga de instalar/desinstalar
        el software indicado en el fichero FILENAME.
        Ejemplo de FILENAME:
        tree:install
        nmap:install
        atomix:remove'

elsif option == '--version'
  puts 'Antonio Fariña Ortiz - 08/01/2020'

elsif option == '--status'
  lines = `cat #{filename}`.split("\n")
  lines.each do |p|
    package = p.split(":")
    check(package)
  end

elsif option == '--run'
  user = `id -u`.chop
  if user == "0"
    lines = `cat #{filename}`.split("\n")
    lines.each do |p|
      package = p.split(":")
      install(package)
    end

  else
    puts "Son necesarios permisos de administrador..."
    exit 1
  end
end
