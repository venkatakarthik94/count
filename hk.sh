#HK CDN
j=1
for i in 18.162.171.160 18.162.217.246 18.163.131.161 18.163.144.108 18.163.15.124 18.163.231.127 18.163.232.175 18.166.49.156 18.163.54.122

do
echo ....########## Connecting to HK CDN$j..############
sudo ssh -i /home/$USER/id_rsa ppliveadmin@$i << EOF
sudo pm2 ls | grep -i "root" | grep -v "pm2-logrotate"
EOF
j=$((j+1))
done
