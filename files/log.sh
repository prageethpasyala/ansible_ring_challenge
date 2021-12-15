#!/bin/bash

/bin/sleep 1

file=./clientlog.txt
if [ ! -e "$file" ]; then
    echo "File does not exist - try again to create log file"
    echo 0 > clientlog.txt
else 
    echo "File exist"
    # var1=$(< clientlog.txt)
    # ((var1=var1+1))
    # write log number to local server  - for future use    
    # echo $var1 > log.txt
    
    servername="ubuntu@192.168.11.25"
    
    # read the log number from remote server
    result=`ssh -i "ta-lab-key.pem" ''$servername'' "cat /var/www/html/log.txt"`
    echo "Current server log number is : " $result  
    ((result=result+1))      
    # write result to remote server - log file : (replace text)
    echo $result | ssh -i "ta-lab-key.pem" $servername -T "cat > /var/www/html/log.txt"
    
    timestamp=$(date "+time_stamp : %Y-%m-%d : %H-%M-%S") 
    echo "------------------------------>" + $timestamp + "<---------------------"    
    echo "Log file updated !" $result >> clientlog.txt

    # write onto remote server - master log
    
    echo "Current log number   : " $result | ssh -i "ta-lab-key.pem" $servername -T "cat >> /var/www/html/masterlog.txt"
    ip4=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
    #echo "Log updated by server : " $ip4 | ssh -i "ta-lab-key.pem" $servername -T "cat >> /home/ec2-user/masterlog.txt"    
    echo "------------------------------>" + $timestamp " updated by :" $ip4 +"<---------------------" | ssh -i "ta-lab-key.pem" $servername -T "cat >> /var/www/html/masterlog.txt"

    echo "Log num updated to $result !!!"

fi



# LIVE MONITERING OF TXT FILE :  tail -f masterlog.txt
# PVTSERVER LOG.SH EXECUTABLE : chmod +x log.sh
# CREATE CRONTAB : crontab -e
# PVTSERVER CRONTAB : * * * * * /bin/bash /home/ec2-user/log.sh


# PUBLIC SERVER : movefile.sh -> sudo cp masterlog.txt /var/www/html/
# SET MOVEFILE EXECUTABLE : chmod +x movefile.sh
# CREATE CRONTAB : crontab -e
# CRONTAB : * * * * * /bin/bash -c "/home/ec2-user/movefile.sh"