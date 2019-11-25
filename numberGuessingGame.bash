#this is bash file
#!bin/bash/

#run this file "bash ./numberGuessingGame.bash"

#numberGuessingGame.bash
echo "==============================="
echo "Number Guessing Game"
echo "guess random number of 1 to 100"
echo "==============================="

#display current date and time
date
echo ""

function numberGuessingGame(){
	#create random number 1 to 100
	randomNumber=$(((RANDOM%100)+1))
	#set correct flag
	correctFlag=false
	#guess count 10 times
	for i in {10..1}
	do
		#display remaining
		echo "==============================="
		echo $i "remaining"
		echo "enter your guess number 1 to 100"
		#get guess number from user
		read guessNumber
		#judge guess number integer 3 digit,0 to 9
		if [[ $guessNumber =~ [0-9]{1,3} ]]
		then
			if (($guessNumber > $randomNumber))
			then
				echo "your enter number is [$guessNumber]"
				echo -e "random number is less than [$guessNumber]\n"
			elif (($guessNumber < $randomNumber))
			then
				echo "your enter number is [$guessNumber]"
				echo -e "random number is greater than [$guessNumber]\n"
			else
				#change correct flag from false to true
				${correctFlag//false/true}
				#out of loop
				break
			fi
		else
			echo "you entered [$guessNumber]"
			echo -e "please enter number of 1 to 100\n"
		fi
	done
	#user correct
	if $correctFlag
	then
		echo "correct! random number is [$randomNumber]"
		#user lose
	else
		echo "lose! random number is [$randomNumber]"
	fi
	#close game
	echo "finished! enter any key"
	read anyKey
}
#start function numberGuessingGame
numberGuessingGame
#EOC
