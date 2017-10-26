while read text
do
var2=$(echo $text | sed -e 's/2\$/2\$ /' | awk '{print $1}')
if [ "$var2" == '2$' ]
then
echo "$text" | sed -e 's/2\$//g'
else
echo "..."
fi
done < lyrics.txt
