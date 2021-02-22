#IRE CDN
j=1
for i in 52.209.208.205 54.76.93.58 99.80.44.198 52.210.216.230 52.212.164.10 54.76.121.237 52.16.96.168 18.203.133.235 46.137.20.248
do
echo ....########## Connecting to IRE CDN$j..############
sudo ssh -i /home/$USER/id_rsa ppliveadmin@$i << EOF
sudo pm2 ls | grep -i "root" | grep -v "pm2-logrotate"
EOF
j=$((j+1))
done
