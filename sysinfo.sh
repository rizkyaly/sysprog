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
		cat /proc/version | awk '{print "OS : "$1" "$2" "$3}'
		printf "Press [Enter] key to continue..."
		read enter
		flag=0
	elif [ $input -eq 2 ];then
		echo "2. Hardware List"
		printf "Press [Enter] key to continue..."
		read enter
		flag=0
	elif [ $input -eq 3 ];then
		echo "3. Free and Used Memory"
		printf "Press [Enter] key to continue..."
		read enter
		flag=0
	elif [ $input -eq 4 ];then
		echo "4. Hardware Detail"
		printf "Press [Enter] key to continue..."
		flag=0
	elif [ $input -eq 5 ];then
		exit;
	fi
fi
fi
done
