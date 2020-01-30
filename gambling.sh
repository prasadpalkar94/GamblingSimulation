#!/bin/bash -x
echo "-----WELCOME TO GAMBLING SIMULATION---------"
STAKE_FOR_DAY=100
BET_PER_GAME=1
LOSE=1
WIN=0
cash=$STAKE_FOR_DAY

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
}
checkWon

