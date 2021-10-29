#!/bin/bash

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[m"
VERSION="0.0.1"
regions='regions.txt'
BANNER="
==================================================
SSS3 - Simple Storage Scanner
Search for buckets with listing permission enabled
Version $VERSION
by: bt0 - www.github.com/halencarjunior
=================================================="
# Testing for requirements
if [[ $(which aws) ]]; then
    echo "[+] aws cli found."
else
    echo "[-] aws cli not found. Please install it using:\nhttps://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html"
    exit 0
fi

if [[ -z $1 ]];
then 
    echo -e "$YELLOW $BANNER $RESET"
    echo -e "Usage: $ $0 domains.txt -o output.txt\n"
    exit 0
fi

if [[ -z $2 ]];
then 
    OUTPUTFILE='output.txt'
else
    OUTPUTFILE=$3
fi

echo -e "$YELLOW $BANNER $RESET\n"

while read line; do
	while read region; do
	echo -e "$YELLOW Listing bucket $line on region $region $RESET"

	RESULT=$((aws s3 ls s3://$line/ --region $region) 2>&1)
	
	if [[ "$RESULT" == *"NoSuchBucket"* ]]; then
		echo -e "$RED	[-] No Such Bucket$RESET"
	elif [[ "$RESULT" == *"InvalidAccessKeyId"* ]]; then
		echo -e "$RED	[-] Invalid Access Key Id found. $RESET"
	else
		echo -e "$GREEN       [+] Investigate the bucket $line on region $region $RESET"	
		#Savin the result in a file
		if [ -f "$line.txt" ];then
			echo -e "\n-Bucket $line on region $region" >> $OUTPUTFILE
		else
			/usr/bin/touch $OUTPUTFILE
			echo -e "- Bucket $line on region $region" >> $OUTPUTFILE 
		fi
		echo -e "\n Listing for Bucket $line \n $RESULT" >> $OUTPUTFILE
	fi
	#echo -e "\n"
	done < $regions
done < $1

