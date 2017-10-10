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
		echo "Username : "$USER
		cat /proc/version | awk '{print "OS : "$1,$2,$3}'
		uptime | sed -e 's/  / /g' | grep '[0-9]:[0-9][0-9], [0-9]' -o | awk '{print "Uptime : "$0}'
		ifconfig | grep 'inet addr:192.[0-9.//]*' -o | grep '[0-9.//]*' -o | awk '{print "IP : "$1}'
		cat /etc/hostname | awk '{print "Hostname : "$1}'
		printf "Press [Enter] key to continue..."
		read enter
		flag=0
	elif [ $input -eq 2 ];then
		lscpu | sed -e 's/Architecture:/ /' | grep 'x.*' -o | awk 'NR==1{print "Machine Hardware : "$1}'
		sudo lshw -short
		printf "Press [Enter] key to continue..."
		read enter
		flag=0
	elif [ $input -eq 3 ];then
		free -m | awk 'NR==2{print "Size : "$2" MB"}'
		echo "Memory Statistics"
		vmstat
		echo "Top 10 cpu eating process"
		ps aux --sort=-%mem | head -n 10
		printf "Press [Enter] key to continue..."
		read enter
		flag=0
	elif [ $input -eq 4 ];then
		echo "4. Hardware Detail"
		printf "Press [Enter] key to continue..."
		read enter
		flag=0
	elif [ $input -eq 5 ];then
		exit;
	fi
fi
fi
done
