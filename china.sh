#China CDN
j=1
for i in 103.36.91.129 103.36.91.130 103.36.91.131 103.36.91.132 103.36.91.133 103.36.91.134 103.36.91.135 103.36.91.137 
do
echo ....########## Connecting to CHINA CDN$j..############
sudo ssh -i /home/$USER/id_rsa ppliveadmin@$i << EOF
sudo pm2 ls | grep -i "root" | grep -v "pm2-logrotate"
EOF
j=$((j+1))
done
