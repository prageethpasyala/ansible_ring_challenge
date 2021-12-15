
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "* * * * * /bin/bash /home/ubuntu/log.sh" >> mycron
#install new cron file
crontab mycron
rm mycron