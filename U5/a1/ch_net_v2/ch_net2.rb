#!/usr/bin/env ruby

def menu
	puts"	=================================
	CHange NETwork configuration (v2)
	=================================
	r. Reset
	1. nc-classroom109
	2. nc-myhome"

	option = gets.chop

	if option == "r"
		reset
	elsif option == "1"
		classroom109
	elsif option == "2"
		myhome
	else
	  puts"No existe la opción"
	end
end

def reset
	system("cp dhcp /etc/sysconfig/network/ifcfg-eth0")
	system("ifdown eth0")
	system("ifup eth0")
end

def classroom109
	system("cp classroom109 /etc/sysconfig/network/ifcfg-eth0")
	system("ifdown eth0")
	system("ifup eth0")
end

def myhome
	system("cp myhome /etc/sysconfig/network/ifcfg-eth0")
	system("ifdown eth0")
	system("ifup eth0")
end

menu