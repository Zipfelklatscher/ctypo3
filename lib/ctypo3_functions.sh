#!/bin/bash

findAndDelete () {

	FILE_COUNT=`find $1 -name "$2" | wc -l`
	if [ $FILE_COUNT != 0 ]; then
		find $1 -name $2 | xargs  rm $3
		echo "INFO: [$FILE_COUNT] $2 files deleted!"
	else
		echo "INFO: [0] $2 files found!"
	fi

echo "-------------------------------------------------------"

}

emptySqlTable () {
	
	COUNT_ROWS=$(mysql -N -h $mysql_host -D $mysql_db -u $mysql_user --password=$mysql_pass -e "SELECT COUNT(*) FROM $1")
		
	if [ $COUNT_ROWS != 0 ]; then
		mysql -h $mysql_host -D $mysql_db -u $mysql_user --password=$mysql_pass -e "TRUNCATE TABLE $1"
		echo "INFO: $1 table cleared in DB: "$mysql_db
	else
		echo "INFO: $1 table already empty!"
	fi
	echo "-------------------------------------------------------"		

}


printAsciArt (){
	echo " _______  _______  __   __  _______  _______  _______ ";
	echo "|       ||       ||  | |  ||       ||       ||       |";
	echo "|       ||_     _||  |_|  ||    _  ||   _   ||___    |";
	echo "|       |  |   |  |       ||   |_| ||  | |  | ___|   |";
	echo "|      _|  |   |  |_     _||    ___||  |_|  ||___    |";
	echo "|     |_   |   |    |   |  |   |    |       | ___|   |";
	echo "|_______|  |___|    |___|  |___|    |_______||_______|";
}