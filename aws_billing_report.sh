#!/bin/bash
###################################################################
########### Script to pull the AWS Billing for last 3 days ########
###################################################################
OUT_DIR=/opt/apradeep/aws_billing_Report
OUT_FILE=/opt/apradeep/aws_billing_Report/aws_billing_last_7_days.txt

rm -f $OUT_FILE

echo "###################################"  > $OUT_FILE
echo "######## Last 7 days Bill    ######"  >> $OUT_FILE
echo "###################################"  >> $OUT_FILE


/usr/local/bin/awscost --aws-profile aws-billing -g DAILY -p 7 -d SERVICE >> $OUT_FILE

echo "###################################"  >> $OUT_FILE
echo "######## Last 3 Months Bill  ######"  >> $OUT_FILE
echo "###################################"  >> $OUT_FILE
/usr/local/bin/awscost --aws-profile aws-billing -g MONTHLY -p 3 -d SERVICE --total >> $OUT_FILE

mail -s 'AWS Billing Report for last 7 days' abcd.com < $OUT_FILE
