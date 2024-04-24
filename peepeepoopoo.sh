#!/bin/bash

#Counter variables
count=0
count_error=0
need="n"

echo

#Greeting
espeak "Hi! My name is peepeepoopoo and I am a machine designed to help with every day activities." &
python3 greeting.py

echo
echo

wait

#Action Table
echo "----------------------"
echo "   Availabe Actions   "
echo "----------------------"
python3 create_folder.py
python3 create_file.py
python3 terminate_script.py
echo "----------------------"

echo
echo
echo

#Number input for Action
wait
espeak "Input one number of the action list above:" &
read -p "Input one number of the action list above: " action

#Actions loop
while true; do

	case $action in
		1)
		wait
		((count++))
		echo "----------------------------------------------"
		read -p "Location of Folder: " folder_loc
		read -p "Name of Folder: " folder_name
		mkdir $folder_loc/$folder_name
		echo "----------------------------------------------"
		;;
		2)
		echo "----------------------------------------------"
		wait
		((count++))
		read -p "Location of File: " file_loc
		read -p "Name of File: " file_name
		touch $file_loc/$file_name
		echo "----------------------------------------------"
		;;
		3)
		wait
		espeak "Ok. That's fine with me. Goodbye!" &
		echo "Ok. That's fine with me. Goodbye!"
		wait
		break
		;;
		*)
		((count_error++))
		wait
		espeak "Invalid argument. Please try again!" &
		python invalid_argument.py
		wait
		;;
	esac

	#If previous argument was valid
	if [[ $action -eq 1 || $action -eq 2 ]]; then
		wait
		read -p "Can I help? [y/n]: " need
		if [[ $need == "y" ]]; then
			if [[ $count -eq 1 ]]; then
				wait
				espeak "How can I be of service? Type one number from the list above:" &
				read -p "How can I be of service? Type one number from the list above: " action
			elif [[ $count -eq 2 ]]; then
				wait
				espeak "I think you got it by now... So what is it?" &
				read -p "I think you got it by now... So what is it? " action
			else
				wait
				espeak "Sorry I am exhausted... I have to go..." &
				echo "Sorry I am exhausted... I have to go..."
				wait
				break
			fi
		elif [[ $need == "n" ]]; then
			wait
			espeak "That's ok. Whenever you need me you know where to find me!" &
			echo "That's ok. Whenever you need me you know where to find me! :)"
			wait
			break
		else
			break
		fi
	else
		wait
		if [[ $count_error -eq 1 ]]; then
			wait
			espeak "Be carefull this time! So what do you want me to do?" &
			read -p "Be carefull this time! So what do you want me to do? " action
		else
			wait
			espeak "At this point you are doing it on purpose... Goodbye!" &
			echo "At this point you are doing it on purpose... Goodbye!"
			wait
			break
		fi
	fi
done

sleep 0.5s

clear
