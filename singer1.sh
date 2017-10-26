while read text
do
var1=$(echo $text | sed -e 's/1\$/1\$ /' | awk '{print $1}')
if [ "$var1" == '1$' ]
then
echo "$text" | sed -e 's/1\$//g'
else
echo "..."
fi
done < lyrics.txt
