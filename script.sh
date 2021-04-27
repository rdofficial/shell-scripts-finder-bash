# The script to find and filter out all the shell scripts around the computer's storage.
#
# Author : Rishav Das (https://github.com/rdofficial)
# Created on : April 27, 2021
#

# First checking wheter the directory location is given in the arguments or not
if [[ -z "${1}" ]]; then
	# If the user did not give the directory location in the arguments, then we manually ask the user to enter the directory location where to clean the cache

	echo -e ""
	read -p "Enter the directory location (where to scan) : " directoryLocation
else
	# If the user did give the directory location in the arguments, then we continue using it

	directoryLocation=$1
fi

# Finding out all the shell script files in the user specified directory
echo -e "\nAll the shell script files are listed below : "
for file in $( find ${directoryLocation} | grep .sh ); do
	# Iterating through each file / folder search results

	# Checking if the location given is a file or folder
	if [[ -f $file ]] && [[ "${file:${#file}-3:3}" == ".sh" ]] ; then
		# If the currently iterated location is of a file, then we continue to print it on the console screen

		echo -e "[!] ${file}"
	else
		# If the currently iterated location is not of a file (i.e., it is of a folder), then we skip the current iteration

		continue
	fi
done
