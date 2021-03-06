#!/bin/bash -x
echo "-----WELCOME TO GAMBLING SIMULATION---------"
declare -A month
STAKE_FOR_DAY=100
BET_PER_GAME=1
LOSE=1
WIN=0
cash=$STAKE_FOR_DAY
DAYS_TO_PLAY=20
function resignpercent() {
	echo "$(($cash*50/$STAKE_FOR_DAY))"
}

val="$(resignpercent)"
WONRESIGN=$(($STAKE_FOR_DAY+$val))
LOSERESIGN=$(($STAKE_FOR_DAY-$val))

function checkWon(){
	totalamount=0
	check=$((RANDOM%2))
	while [[ $cash -ne $WONRESIGN  && $cash -ne $LOSERESIGN ]]
	do
		if [ $check -eq $WIN ]
		then
			cash=$(($cash+$BET_PER_GAME))	
		else
			cash=$(($cash-$BET_PER_GAME))
			fi        
	done
			totalcashobtained=$(($cash-$STAKE_FOR_DAY))
			echo $totalcashobtained
}

function wonORlost(){
	for ((i=1;i<=20;i++))
	do
   totalcash=$(($totalcash+$(checkWon)))
	month[$i]=$totalcash
	done
   if [ $totalcash -gt $WONRESIGN ]
	then
		echo Total cash won:$totalcash
	else
		echo Total cash lost:$totalcash
	fi
}

function dayCheck(){
for daycheck in ${!month[@]}
do
	echo $daycheck ${month[$daycheck]}
done
}

function checkNextMonth(){
y=1
n=0
read -p "Enter choice between 1 or 0" choice
if [ $choice -eq 1 ]
then
	checkWon
else
	echo "Game Over"
fi 
}

checkWon
wonORlost
echo ${month[@]}

echo "UnluckyDay::$(dayCheck| sort -k2 -rn | tail -1)"
echo "LuckyDay::$(dayCheck| sort -k2 -rn | head -1)"

checkNextMonth
