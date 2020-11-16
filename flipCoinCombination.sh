#! /bin/bash

echo -e "1: For Singlet \n2: For Doublet \n3: For Triplet"
declare -A combinationDictionary

function singlet()
{
num=$1
for ((counter=1; counter <= $num; counter++))
do
	flip=$((RANDOM%2))
        combinationDictionary[$flip]=$((${combinationDictionary[$flip]} +1))
done
singHeadProb=$(( (${combinationDictionary[0]}*100) / $num ))
singTailProb=$(( (${combinationDictionary[1]}*100) / $num ))
echo "----------------------------------------------------------------------------------------"
if (( $singHeadProb > $singTailProb ))
then
	echo "Head"
	echo "Head = $singHeadProb %"
else
	echo "Tail"
	echo "Tail = $singTailProb %"
fi

echo "Head: ${combinationDictionary[0]} Tail: ${combinationDictionary[1]}"

}

function Doublet()
{
 num=$1
         for ((counter=1; counter <= $num; counter++))
        do
                flip=$((RANDOM%4))
                combinationDictionary[$flip]=$((${combinationDictionary[$flip]} +1))
        done
        SingHHProb=$(( (${combinationDictionary[0]}*100) / $num ))
        SingTTProb=$(( (${combinationDictionary[1]}*100) / $num ))
        SingHTProb=$(( (${combinationDictionary[2]}*100) / $num ))
        SingTHProb=$(( (${combinationDictionary[3]}*100) / $num ))

        echo "--------------------------------------------------------------------------------------"
        if (( $SingHHProb >= $SingTTProb && $SingHHProb >= $SingTHProb && $SingHHProb >= $SingHTProb ))
        then
                echo "$SingHHProb %"
        elif (( $SingTTProb >= $SingHHProb && $SingTTProb >= $SingTHProb && $SingTTProb >= $SingHTProb ))
        then
                echo "TT = $SingTTProb %"
        elif (( $SingTHProb >= $SingTTProb && $SingTHProb >= $SingHHProb && $SingTHProb >= $SingHTProb ))
        then
                echo "TH = $SignTHProb %"
        else
                echo "HT = $SignHTProb %"

        fi

        echo "HH: ${combinationDictionary[0]} TT: ${combinationDictionary[1]}  HT : ${combinationDictionary[2]}   TH : ${combinationDictionary[3]}"

}

function Triplet()
{
num=$1
         for ((counter=1; counter < $num; counter++))
        do
                flip=$((RANDOM%8))
                combinationDictionary[$flip]=$((${combinationDictionary[$flip]} +1))
        done
        HHH=$((${combinationDictionary[0]}*100 / $num ))
        TTT=$((${combinationDictionary[1]}*100 / $num ))
        THH=$((${combinationDictionary[2]}*100 / $num ))
        TTH=$((${combinationDictionary[3]}*100 / $num ))
        THT=$((${combinationDictionary[4]}*100 / $num ))
        HTT=$((${combinationDictionary[5]}*100 / $num ))
        HTH=$((${combinationDictionary[6]}*100 / $num ))
        HHT=$((${combinationDictionary[7]}*100 / $num ))


        echo "--------------------------------------------------------------------------------------"
        if (( $HHH > $TTT && $HHH > $THH && $HHH > $TTH && $HHH > $THT && $HHH > $HTT && $HHH > $HTH && $HHH > $HHT ))
        then
                echo "HHH = $HHH %"
        elif (( $TTT > $HHH && $TTT > $THH && $TTT > $TTH && $TTT > $THT && $TTT > $HTT && $TTT > $HTH && $TTT > $HHT ))
        then
                echo "TTT = $TTT %"
        elif (( $THH > $TTT && $THH > $HHH && $THH > $TTH && $THH > $THT && $THH > $HTT && $THH > $HTH && $THH > $HHT ))
        then
                echo "THH = $THH %"
	elif (( $TTH > $TTT && $TTH > $THH && $TTH > $HHH && $TTH > $THT && $TTH > $HTT && $TTH > $HTH && $TTH > $HHT ))
	then
			echo "TTH: $TTH %"
	elif (( $THT > $TTT && $THT > $THH && $THT > $TTH > $THT > $HHH && $THT > $HTT && $THT > $HTH && $THT > $HHT ))
	then
		echo "THT : $THT %"
	elif (( $HTT > $TTT && $HTT > $THH && $HTT > $TTH && $HTT > $THT && $HTT > $HHH && $HTT > $HTH && $HTT > $HHT ))
	then
		echo "HTT : $HTT %"
	elif (( $HHT > $TTT && $HHT > $THH && $HHT > $TTH && $HHT > $THT && $HHT > $HTT && $HHT > $HTH && $HHT > $HHH ))
	then
		echo "HHT : $HHT %"
        else
                echo "HTH = $HTH %"

        fi


}

read -p "Enter the times of flip " num
read -p "Select the option: " option

case "$option" in
1)

	singlet $num
	;;
2)
	Doublet $num
	;;
3)
	Triplet $num
	;;
*)	echo "0"

esac
