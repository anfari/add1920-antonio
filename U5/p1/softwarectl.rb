#!/usr/bin/env ruby

option = ARGV[0]
filename = ARGV[1]



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
  for lines.each do |line|
    p = line.split(":")
    puts p[0]
  end



end
