#!/bin/bash
while true; do
flag=0
now=`date`
if [ $flag -eq 0 ];then
echo "$now"
echo "===================="
echo "     Main Menu"
echo "===================="
echo "1. Operating System Info"
echo "2. Hardware List"
echo "3. Free and Used Memory"
echo "4. Hardware Detail"
echo "5. exit"
printf "Chose 1-5 : "
read input
flag=1
if [ $flag -eq 1 ];then
	if [ $input -eq 1 ]; then
		echo "--------------------------------------------------"
		echo "     System Status"
		echo "--------------------------------------------------"
		echo "Username : "$USER
		cat /proc/version | awk '{print "OS : "$1,$2,$3}'
		uptime | sed -e 's/  / /g' | awk '{print "Uptime : "$3,$4}'
		hostname -I | awk '{print "IP : "$0}'
		cat /etc/hostname | awk '{print "Hostname : "$1}'
		printf "Press [Enter] key to continue..."
		read enter
		flag=0
	elif [ $input -eq 2 ];then
		echo "--------------------------------------------------"
		echo "     Hardware List"
		echo "--------------------------------------------------"
		lscpu |  grep 'x.*' -o | awk 'NR==1{print "Machine Hardware : "$1}'
		sudo lshw -short
		printf "Press [Enter] key to continue..."
		read enter
		flag=0
	elif [ $input -eq 3 ];then
		echo "--------------------------------------------------"
		echo "     MEMORY"
		echo "--------------------------------------------------"
		echo "****************"
		echo "     Memory"
		echo "****************"
		free -m | awk 'NR==2{print "Size : "$2" MB"}'
		free -m | awk 'NR==2{print "Free : "$4" MB"}'
		echo "******************************"
		echo "     Memory Statistics"
		echo "******************************"
		vmstat
		echo "*************************************"
		echo "     Top 10 cpu eating process"
		echo "*************************************"
		ps aux --sort=-%cpu | head -n 11
		printf "Press [Enter] key to continue..."
		read enter
		flag=0
	elif [ $input -eq 4 ];then
		while [ $flag -eq 1 ]; do
		echo "========================="
		echo "     Hardware Detail"
		echo "========================="
		echo "1. CPU"
		echo "2. Block Devices"
		echo "3. Back"
		printf "Choose 1-3 : "
		read input2
			if [ $input2 -eq 1 ];then
			echo "--------------------------------------------------"
			echo "     CPU"
			echo "--------------------------------------------------"
			cat /proc/cpuinfo | grep 'model name' | cut -f 2- | awk 'NR==1{print "Model Name "$0}'
			cat /proc/cpuinfo | grep 'cpu MHz' | cut -f 3- | awk 'NR==1{print "Frequency "$0}'
			cat /proc/cpuinfo | grep 'cache size' | cut -f 2- | awk 'NR==1{print "Cache "$0}'
			printf "Press [Enter] key to continue..."
			read enter
			elif [ $input2 -eq 2 ];then
			echo "--------------------------------------------------"
			echo "     blk"
			echo "--------------------------------------------------"
			lsblk
			printf "Press [Enter] key to continue..."
			read enter
			elif [ $input2 -eq 3 ];then
			flag=0
			fi
		done
	elif [ $input -eq 5 ];then
		echo "Bye Bye...."
		exit;
	else
		echo "Please input the correct input"
		printf "Press [Enter] key to continue..."
		read enter
		flag=0
	fi
fi
fi
done
