#!/bin/bash

######################################################################################
######### Script to check if current monthly bill is under 300 USD ###################
######################################################################################

threshold_amount=300

OUT_FILE=/opt/apradeep/aws_billing_Report/aws_current_month_bill.txt

rm -f $OUT_FILE


current_month_bill=`/usr/local/bin/awscost --aws-profile aws-billing -g MONTHLY -p 3 -d SERVICE --total | grep -i Total | awk '{print $5}'`

##echo $current_month_bill

if [ $current_month_bill -ge $threshold_amount ]
then
    ##echo "$current_month_bill USD exceeds the monthly threshold amount $threshold_amount USD, immediate attention required!!"
    echo "$current_month_bill USD exceeds the monthly threshold amount $threshold_amount USD, immediate attention required!!" > $OUT_FILE
    mail -s 'AWS Billing Alert' pradeep@abcd.com < $OUT_FILE
    fi
