#!/bin/bash

DATE=$(date +%y-%m-%d-%s)
BACKUP=db-$DATE.sql

DB_HOST=$1
DB_NAME=$2
BUCKET_NAME=$3

MYSQL_ROOT_PASSWORD=$4
AWS_ACCESS_KEY_ID=$5
AWS_SECRET_ACCESS_KEY=$6

mysqldump -u root -h $DB_HOST -p$MYSQL_ROOT_PASSWORD $DB_NAME > /tmp/$BACKUP && \
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY && \

echo "uploading your $BACKUP file on AWS S3 Bucket" && \

aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME/$BACKUP
