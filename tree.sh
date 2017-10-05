#!/bin/bash
echo 'Initial Directory = '$PWD
tree_function()
{
for file in "$@"
do
	if [ -d "$file" ] ; then
		echo "$file" | sed -e "s/[^\/]*\//| /g" -e "s/| \([^|]\)/\+---\1/"
		tree_function "$file"/*
	fi
done
}
tree_function ./*
