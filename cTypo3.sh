#!/bin/bash
VERSION="1.0.0"

DEBUG=0
TYPO3_VERSION=0

SCRIPT_PATH="/usr/local/bin/ctypo3_script"
. $SCRIPT_PATH/lib/ctypo3_functions.sh

# param 1 - path to typo3 installation
path=$1


# localconf file
typo3_4_5_localconf_file=${1}/typo3conf/localconf.php
typo3_6_x_localconf_file=${1}/typo3conf/LocalConfiguration.php


if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi


if [ $DEBUG -eq 1 ]; then
	echo "-------------------------------------------------------"
	echo "### DEBUG MODE ###"
fi

# check path to typo3 installation

if [ -z "$path" ]
then
	echo "-------------------------------------------------------"
	echo "ERROR: path to typo3 installation not set!"
	echo "-------------------------------------------------------"
	echo "Usage 1: sh `basename $0` [path_to_typo3_installation]"
	echo "Usage 2: set path in bash script `basename $0`"
	echo "-------------------------------------------------------"
	exit
elif [ -f $typo3_4_5_localconf_file ]
then
	
	TYPO3_VERSION=4
	localconf_file=$typo3_4_5_localconf_file

	mysql_db=$(grep '$typo_db ' $localconf_file | grep -o  \'.*\' | sed s/\'//g)
	mysql_user=$(grep '$typo_db_username' $localconf_file | grep -o  \'.*\' | sed s/\'//g)
	mysql_pass=$(grep '$typo_db_password' $localconf_file | grep -o  \'.*\' | sed s/\'//g)
	mysql_host=$(grep '$typo_db_host' $localconf_file | grep -o  \'.*\' | sed s/\'//g)

elif [ -f $typo3_6_x_localconf_file ]
then

	TYPO3_VERSION=6
	localconf_file=$typo3_6_x_localconf_file

	mysql_db=$(grep "'database'" $localconf_file | sed s/\database//g | sed s/\'//g | sed s/\=\>//g | sed s/\,//g | sed -e s/[[:space:]]//g)
	mysql_user=$(grep "'username'" $localconf_file | sed s/\username//g | sed s/\'//g | sed s/\=\>//g | sed s/\,//g | sed -e s/[[:space:]]//g)
	mysql_pass=$(grep "'password'" $localconf_file | sed s/\password//g | sed s/\'//g | sed s/\=\>//g | sed s/\,//g | sed -e s/[[:space:]]//g)
	mysql_host=$(grep "'host'" $localconf_file | sed s/\host//g | sed s/\'//g | sed s/\=\>//g | sed s/\,//g | sed -e s/[[:space:]]//g)

else	
	echo "-------------------------------------------------------"
	echo "ERROR: file "$1"/typo3conf/localconf.php does not exist!"
	echo "-------------------------------------------------------"
	echo "Usage 1: sh `basename $0` [path_to_typo3_installation]"
	echo "Usage 2: set path in bash script `basename $0`"
	echo "-------------------------------------------------------"
	exit
fi


if [ $DEBUG -eq 1 ]; then

	echo "-------------------------------------------------------"
	echo "path: " $1
	echo "path to localconf.php: " $localconf_file
	echo "-------------------------------------------------------"
	echo "mysql_db: ${mysql_db}"
	echo "mysql_user: ${mysql_user}"
	echo "mysql_pass: ${mysql_pass}"
	echo "mysql_host: ${mysql_host}"
	echo "-------------------------------------------------------"

fi

mysql -h $mysql_host -D $mysql_db -u $mysql_user --password=$mysql_pass -e exit
dbstatus=`echo $?`

if [ $dbstatus -ne 0 ]; then
	echo "-------------------------------------------------------"
	echo "ERROR: cant connect to database!"
	echo "-------------------------------------------------------"
	echo "HINT: Check your settings in in typo3 localconf.php"
	echo "-------------------------------------------------------"		
	exit
fi

if [ $TYPO3_VERSION -eq 4 ]; then
	. $SCRIPT_PATH/lib/ctypo3_4_x.sh
elif [ $TYPO3_VERSION -eq 6 ]; then
	. $SCRIPT_PATH/lib/ctypo3_6_x.sh
else
	echo "-------------------------------------------------------"
	echo "ERROR: wrong TYPO3 Version!"
	echo "-------------------------------------------------------"
fi

