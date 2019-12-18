#!/usr/bin/env ruby

def menu
	puts"	=================================
	CHange NETwork configuration (v2)
	=================================
	r. Reset
	1. Classroom 109
	2. My Home
	3. DHCP"

	puts""
	print "Select option [Enter=exit]:"
	option = gets.chop

	if option == "r"
		reset
	elsif option == "1"
		classroom109
	elsif option == "2"
		myhome
	elsif option == "3"
		dhcp
	end
end

def reset
	system("ifdown eth0")
	system("ifup eth0")
end

def classroom109
	system("rm /etc/sysconfig/network/ifcfg-eth0")
	out_file = File.new("/etc/sysconfig/network/ifcfg-eth0", "w")
	out_file.puts("BOOTPROTO='static'
BROADCAST=''
ETHTOOL_OPTIONS=''
IPADDR='172.19.24.31/16'
MTU=''
NAME=''
NETMASK=''
NETWORK=''
REMOTE_IPADDR=''
STARTMODE='auto'
DHCLIENT_SET_DEFAULT_ROUTE='yes'
ZONE='public'
")
	out_file.close
	system("ifdown eth0")
	system("ifup eth0")
end

def myhome
	system("rm /etc/sysconfig/network/ifcfg-eth0")
	out_file = File.new("/etc/sysconfig/network/ifcfg-eth0", "w")
	out_file.puts("BOOTPROTO='static'
BROADCAST=''
ETHTOOL_OPTIONS=''
IPADDR='192.168.1.100/24'
MTU=''
NAME=''
NETMASK=''
NETWORK=''
REMOTE_IPADDR=''
STARTMODE='auto'
DHCLIENT_SET_DEFAULT_ROUTE='yes'
ZONE='public'
")
	out_file.close
	system("ifdown eth0")
	system("ifup eth0")
end

def dhcp
	system("rm /etc/sysconfig/network/ifcfg-eth0")
	out_file = File.new("/etc/sysconfig/network/ifcfg-eth0", "w")
	out_file.puts("BOOTPROTO='dhcp'
BROADCAST=''
ETHTOOL_OPTIONS=''
IPADDR=''
MTU=''
NAME=''
NETMASK=''
NETWORK=''
REMOTE_IPADDR=''
STARTMODE='auto'
DHCLIENT_SET_DEFAULT_ROUTE='yes'
ZONE='public'
")
	out_file.close
	system("ifdown eth0")
	system("ifup eth0")
end

menu
