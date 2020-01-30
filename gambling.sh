#!/bin/bash -x
echo "-----WELCOME TO GAMBLING SIMULATION---------"
STAKE_FOR_DAY=100
BET_PER_GAME=1

function checkWon(){
check=$((RANDOM%2))
if [ $check -eq 1 ]
then
echo "WON"
amount=$(($STAKE_FOR_DAY+$BET_PER_GAME))
else
echo "LOST"
amount=$(($STAKE_FOR_DAY-$BET_PER_GAME))
fi        
}
checkWon
