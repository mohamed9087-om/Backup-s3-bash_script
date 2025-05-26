#!/bin/bash

time=$(date +%m-%d-%Y_%H_%M_%S)
source=/home/ubuntu/bash
des=/home/ubuntu/backup
LOG_FILE=$des/logfile
filename=file-archive-$time.tar.gz

if ! command -v aws &> /dev/null; then
  echo "AWS CLI is not installed. Please install it first."
  exit 2
fi

if [ $? -ne 2 ]
then
        if [ -f $filename ]
        then
                echo " THE FILE: $filename is already exist " | tee -a "$LOG_FILE"
                exit 2
        else
                tar -cvzf $des/$filename $source
                echo " the file is successful to back up to : $des and name :$filename " | tee -a "$LOG_FILE"
                echo
                aws s3 cp "$des/$filename" "s3://s3-new-bash/"

        fi

fi

if [ $? -eq 0 ]
then
        echo " The File : $des/$filename is successful  uploaded to S3 Bucket : s3-new-bash " | tee -a "$LOG_FILE"
else
        echo " The file ; $des/$filename is failed to uploaded to s3 Buket : s3-new-bash "  | tee -a "$LOG_FILE"
fi