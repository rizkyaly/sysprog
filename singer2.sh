#!/bin/bash
sing_2(){
while read text
do
var2=$(echo $text | sed -e 's/2\$/2\$ /' | awk '{print $1}')
if [ "$var2" == '2$' ]
then
echo "$text" | sed -e 's/2\$//g'
cat lyrics2.txt | tail -n +2 > lyrics2.tmp && mv lyrics2.tmp lyrics2.txt
elif [ '$text' == '' ]
then
cat lyrics2.txt | tail -n +2 > lyrics2.tmp && mv lyrics2.tmp lyrics2.txt
echo ...
else
varsinger1=$(ps -ef | grep singer1 | awk 'NR==1{print $2}')
kill -USR1 $varsinger1
break
fi
sleep 1
done < lyrics2.txt
}
trap "sing_2" USR2

while [ 1 -gt 0 ]
do
echo ...
sleep 1
done
