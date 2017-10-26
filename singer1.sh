#!/bin/bash
sing_1(){
while read text
do
var1=$(echo $text | sed -e 's/1\$/1\$ /' | awk '{print $1}')
if [ "$var1" == '1$' ]
then
	echo "$text" | sed -e 's/1\$//g'
	cat lyrics2.txt | tail -n +2 > lyrics2.tmp && mv lyrics2.tmp lyrics2.txt
else
	if [ "$var1" == "" ]
	then
		echo asd
		cat lyrics2.txt | tail -n +2 > lyrics2.tmp && mv lyrics.tmp lyrics2.txt
	else
		echo $var1
		varsinger2=$(ps -ef | grep singer2 | awk 'NR==1{print $2}')
		kill -USR2 $varsinger2
		break
	fi
fi
	sleep 1
done < lyrics2.txt
}
cat lyrics.txt > lyrics2.txt

trap "sing_1" USR1

while [ 1 -gt 0 ]
do
echo ...
sleep 1
done
