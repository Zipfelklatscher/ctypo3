#!/bin/bash

#### TYPO3 4.x ###

choice=0

while [ $choice != 10 ]; do

	printAsciArt

	echo "-------------------------------------------------------"
	echo "TYPO3 CLEANER v${VERSION} by mail@jaapen.com -> TYPO3 [4.x]"
	echo "-------------------------------------------------------"
	echo "What do you wanna do?"
	
	echo "[1] Clear mysql cache tabels"
	echo "[2] Clear sys_log & sys_history tables"
	echo "[3] Clear typo3conf temp files"
	echo "[4] Clear temp images"
	echo "[5] Clear typo3temp temp files"
	echo "[6] Clear session data"
	echo "[7] Clear all"
	echo "[8] Print extensions"
	echo "[9] Exit"
	
	echo "Please choose:"
	
	# read user input
	read choice

	if [ $choice ] ; then
		echo "-------------------------------------------------------"
		echo "I love cleaning, weird but true. It really relaxes me."
	fi	

	echo "-------------------------------------------------------"
	
	
	# [1] Delete mysql cache tabels
	
	if [ $choice -eq 1 ] ; then
			
			emptySqlTable cache_pages
			emptySqlTable cache_pagesection
			emptySqlTable cache_hash
			emptySqlTable cache_imagesizes
			
	# [2] Delete sys_log & sys_history table
	
	elif [ $choice -eq 2 ] ; then
			
			emptySqlTable sys_log
			emptySqlTable sys_history
	
	# [3] Delete typo3conf temp files
			
	elif [ $choice -eq 3 ] ; then
							
			findAndDelete ${path}typo3conf/ temp_*
	
	# [4] Delete temp images
	
	elif [ $choice -eq 4 ] ; then
					
			findAndDelete ${path}/typo3temp/ *.jpeg
			findAndDelete ${path}/typo3temp/ *.jpg
			findAndDelete ${path}/typo3temp/ *.png
			findAndDelete ${path}/typo3temp/ *.gif
	
	# [5] Delete typo3temp temp files
	
	elif [ $choice -eq 5 ] ; then
			
			findAndDelete ${path}/typo3temp/ *.xml.gz
			findAndDelete ${path}/typo3temp/ *.zip
			findAndDelete ${path}/typo3temp/ *.js
			findAndDelete ${path}/typo3temp/ *.css
			findAndDelete ${path}/typo3temp/ *.inc
			findAndDelete ${path}/typo3temp/ *.cache
			findAndDelete ${path}/typo3temp/ *.tbl
			findAndDelete ${path}/typo3temp/ tmb_*
			findAndDelete ${path}/typo3temp/ upload_temp_*
			
	# [6] Delete typo3 session folder
	
	elif [ $choice -eq 6 ] ; then
			
			findAndDelete ${path}/typo3temp/ sessions* -R
	
	# [7] Delete all
	
	elif [ $choice -eq 7 ] ; then
	
			emptySqlTable cache_pages
			emptySqlTable cache_pagesection
			emptySqlTable cache_hash
			emptySqlTable cache_imagesizes
			
			emptySqlTable sys_log
			emptySqlTable sys_history		
	
			findAndDelete ${path}/typo3conf/ temp_*
	
			findAndDelete ${path}/typo3temp/ *.jpeg
			findAndDelete ${path}/typo3temp/ *.jpg
			findAndDelete ${path}/typo3temp/ *.png
			findAndDelete ${path}/typo3temp/ *.gif
			
			findAndDelete ${path}/typo3temp/ *.xml.gz
			findAndDelete ${path}/typo3temp/ *.zip
			findAndDelete ${path}/typo3temp/ *.js
			findAndDelete ${path}/typo3temp/ *.css
			findAndDelete ${path}/typo3temp/ *.inc
			findAndDelete ${path}/typo3temp/ *.cache
			findAndDelete ${path}/typo3temp/ *.tbl		
			findAndDelete ${path}/typo3temp/ tmb_*
			findAndDelete ${path}/typo3temp/ upload_temp_*
	
	# [8] Print extensions
	
	elif [ $choice -eq 8 ] ; then
	
	        find ${path}/typo3conf/ -name ext_emconf.php | xargs grep "'version'"
	
	# 9] Exit
		
	elif [ $choice -eq 9 ] ; then
	
		echo "good bye!"
		exit
		
	else
		echo "ERROR: wrong request"
		echo "-------------------------------------------------------"	
	fi
	
done #end while