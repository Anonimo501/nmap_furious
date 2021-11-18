#!/bin/bash

opcion="ninguna"


function opcion1
{

#Scan -sV

echo ""
echo -e "\e[31m Ingrese la ip victima	\e[0m"
echo ""
read ip

echo ""
echo -e "\e[31m Ingrese los puertos: Ejemplo: 80,443,445(Port Especifico) o 1-65535(Rango)   \e[0m"
echo ""
read ports

echo ""
echo -e "\e[33m	Escaneando puertos... Creando archivo (nmap_Scan-sV)	\e[0m"
echo ""

echo -e "\e[33m -------------------------------------------------------------  \e[0m"

nmap -sS -sV --min-rate 5000 -p$ports --open $ip -vvv -n -Pn -oN nmap_Scan-sV

echo -e "\e[33m -------------------------------------------------------------  \e[0m"

   read
   return 0

}

function opcion2
{

#Scan -sC -sV 

echo ""
echo -e "\e[31m Ingrese la ip victima   \e[0m"
echo ""
read ip

echo ""
echo -e "\e[31m Ingrese los puertos: Ejemplo: 80,443,445 o 80-445(Rango)   \e[0m"
echo ""
read ports

echo ""
echo -e "\e[33m Escaneando puertos... Creando un archivo (nmap_Scan-sC-sV)     \e[0m"
echo ""

echo -e "\e[33m -------------------------------------------------------------  \e[0m"

nmap -sS -sC -sV --min-rate 5000 -p$ports --open $ip -vvv -Pn -n -oN nmap_Scan-sC-sV

echo -e "\e[33m -------------------------------------------------------------  \e[0m"

   read
   return 0

}

function opcion3
{

#Scan de vulnerabilidades puertos especificos

echo ""
echo -e "\e[31m Ingrese la ip victima   \e[0m"
echo ""
read ip

echo ""
echo -e "\e[31m Ingrese los puertos: Ejemplo: 80,443,445 o 1-65535(Rango)   \e[0m"
echo ""
read ports

echo ""
echo -e "\e[33m Escaneando vulnerabilidades... Creando un archivo (nmap_Scan-vuln)     \e[0m"
echo ""

echo -e "\e[33m -------------------------------------------------------------  \e[0m"

nmap --script=vuln -p$ports $ip -vvv -n -Pn -oN nmap_Scan-vuln

echo -e "\e[33m -------------------------------------------------------------  \e[0m"

   read
   return 0

}

function opcion4
{

#Scan -sV

echo ""
echo -e "\e[31m Ingrese la ip victima   \e[0m"
echo ""
read ip

echo ""
echo -e "\e[31m Ingrese los puertos: Ejemplo: 80,443,445(Port Especifico) o 1-65535(Rango)   \e[0m"
echo ""
read ports

echo ""
echo -e "\e[33m Escaneando 65.535 puertos... Creando archivo (nmap_Scan-all-ports)    \e[0m"
echo ""

echo -e "\e[33m -------------------------------------------------------------  \e[0m"

nmap -sS --min-rate 5000 -p$ports --open -vvv -n -Pn $ip -oN nmap_Scan-all-ports

echo -e "\e[33m -------------------------------------------------------------  \e[0m"

   read
   return 0

}

while [ $opcion != "5"  ]
    do

echo ""

	echo -e "\e[31m \n	-- MENU -- \e[0m"
	echo ""
	echo -e "\t1) Nmap -sV (Versiones de Servicios)"
	echo -e "\t2) Nmap -sC -sV (Detalles y Servicios)"
	echo -e "\t3) Nmap --script=vuln (Detectando Vulnerabilidades)"
	echo -e "\t4) Nmap Descubrimiento de puertos simple"
	echo -e "\t5) Salir\n"
	echo -e "\e[33m \tOpcion: \c \e[0m"

read opcion

echo -e "\e[33m -------------------------------------------------------------  \e[0m"

        if [ -z $opcion ] ; then opcion="ninguna" ; fi

        case $opcion in
		"1" )
                      opcion1
  		      ;;
		"2" )
		      opcion2
		      ;;
		"3" )
		      opcion3
		      ;;
		"4" )
                      opcion4
                      ;;
		"*" )
		      ;;

	esac


	/usr/bin/clear
done
