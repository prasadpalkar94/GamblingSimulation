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

function checkWon(){
totalval=0
check=$((RANDOM%2))
if [ $check -eq $WIN ]
then
echo "WON"
wonresign=$(($STAKE_FOR_DAY+$val))
while [ $cash -ne $wonresign ]
do
cash=$(($cash+$BET_PER_GAME))
totalval=$(($totalval+$cash))
done
else
echo "LOST"
loseresign=$(($STAKE_FOR_DAY-$val))
while [ $cash -ne $loseresign ]
do
cash=$(($cash-$BET_PER_GAME))
totalval=$(($totalval+$cash))
done
fi        
}
checkWon

