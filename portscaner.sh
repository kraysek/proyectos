#!/bin/bash

read -p "introduce una ip: " ip
read -p "introduce un rango de puertos : " ports

for i in $(seq 0 $ports): do
	sudo nc -zv $ip $i 2>/dev/null && "el puerto $i esta abierto"
done