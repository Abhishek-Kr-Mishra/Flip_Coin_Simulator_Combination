#! /bin/bash

headCount=0
tailCount=0
declare -A singletDictionary
read -p "Enter the times of flip " num
for ((counter=1; counter <= $num; counter++))
do
	flip=$((RANDOM%2))
	if (( $flip == 1 ))
	then
		headCount=$((headCount+1))
		singletDictionary[1]=$headCount
	else
		tailCount=$((tailCount+1))
		singletDictionary[2]=$tailCount
	fi
done
	singHeadProb=$((${singletDictionary[1]} *100 / $num ))
	singTailProb=$((${singletDictionary[2]} *100 / $num ))
echo "----------------------------------------------------------------------------------------"
if (( $singHeadProb > $singTailProb ))
then
	echo "Head"
	echo "Head = $singHeadProb %"
else
	echo "Tail"
	echo "Tail = $singTailProb %"
fi

echo "Head: ${singletDictionary[1]} Tail: ${singletDictionary[2]}"
