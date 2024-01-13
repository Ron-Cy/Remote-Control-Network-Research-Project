#!/bin/bash 

#1st function
function ip1()
{
	echo "Please input IP address for anonymous check"	
}	

#2nd function
function ip2()
{
	echo "Input IP to scan for open ports "	
}

#3rd function
function ip3()
{
	echo "Input IP to check with whois "	
}

#4th function
function protocol()
{
	echo "A.Connect via SSH	B.Connect via FTP	C.Exit"
	read option

		case $option in
		A|a)
			echo "connect via SSH"
			
			echo "Username"
			read username
			
			echo "SSH IP address"
			read sip
			
			echo "Password"
			read pw
			
			sshpass -p $pw ssh $username@$sip -p 22 "ifconfig | grep broadcast | awk '{print \$2}'; uptime"
			
			sshpass -p $pw ssh $username@$sip -p 22 "geoiplookup $sip"
			
			echo "Input IP/URL to check with whois "
			read ipw
			sshpass -p $pw ssh $username@$sip -p 22 "whois $ipw > whoisresult.txt"		
		;;
		B|b)
			echo "connect via FTP"
			echo "FTP IP address"
			read fip
			ftp $fip
		;;
		C|c)
			exit
		;;	
		esac
		protocol
}

#bash command sequence

#to make sure my connection is anonymous if not then alert user and exit	
	ip1
	read ipx1
	anonymous=$(curl -s ifconfig.io)
	if [ $ipx1 != $anonymous ]
	then
		echo "Anonymous"
		whois $ipx1 | grep -i country | uniq | head -n 1	
	else
		echo "Alert! Not an anonymous connection"
	exit	
	fi

#to scan for open ports for connection in next part
		ip2
		read ipx2
		nmap $ipx2 -Pn -sV

#give user both connection option and option to exit. 
#User can connect to remote server via SSH to request server show IP, country, uptime & whois for another input IP/URL
#after SSH connection done, can back to option menu and connect via FTP to get the whoisresult.txt from server
			protocol


			





		
		
		
