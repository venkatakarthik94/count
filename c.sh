#!/bin/bash
###################################################################################################
###################################################################################################
#Tite		:restart count 
#Date		:08-FEB-2021
#Version 	:V1
#Company	:Pragmatic Play
#Contact	:yaragudipati.karthik@pragmaticplay.com
###################################################################################################
###################################################################################################
>/home/$USER/Desktop/count/output.csv
mkdir -p /home/$USER/Desktop/count/


echo "Table_name restart_count" >>/home/$USER/Desktop/count/output.csv

#IRE
echo "IRE">>/home/$USER/Desktop/count/output.csv
sh /home/$USER/Desktop/count/ire.sh >/home/$USER/Desktop/count/ire.csv
cat ire.csv |grep -i root| grep disabled | awk '{print $2 " " $14}' >>/home/$USER/Desktop/count/output.csv

#HK
echo "HK">>/home/$USER/Desktop/count/output.csv
sh /home/$USER/Desktop/count/hk.sh >/home/$USER/Desktop/count/hk.csv
cat hk.csv |grep -i root| grep disabled | awk '{print $2 " " $14}' >>/home/$USER/Desktop/count/output.csv

#china
echo "China">>/home/$USER/Desktop/count/output.csv
sh /home/$USER/Desktop/count/china.sh  >/home/$USER/Desktop/count/china.csv
cat china.csv |grep -i root|grep disabled | awk '{print $4 " " $16}' >>/home/$USER/Desktop/count/output.csv


echo "Please enter Europe count manually"
sudo ssh -i /home/$USER/id_rsa ppliveadmin@54.76.121.237 << EOF
sudo pm2 ls | grep "root" | grep -v "pm2-logrotate"| cut -c 98-101
EOF
