#!/bin/bash

#set permision 400 for remote pem keys 
# tar -zc ta-lab-key.pem | ssh -i ta-lab-key.pem ubuntu@192.168.21.42 'tar -zx -C /home/ubuntu; chmod 400 /home/ubuntu/ta-lab-key.pem'
# -------------------- pvt server 1
#set permision 400 for remote pem keys 
scp -i ta-lab-key.pem ta-lab-key.pem ubuntu@192.168.21.42:/home/ubuntu; chmod 400 -i ta-lab-key.pem ubuntu@192.168.21.42:/home/ubuntu/*.pem

#copy bash scripts to remote servers
scp -i ta-lab-key.pem log.sh ubuntu@192.168.21.42:/home/ubuntu/
scp -i ta-lab-key.pem crontab.sh ubuntu@192.168.21.42:/home/ubuntu/

# execute copyied crontab.sh script remotley to create  the crontabs on remote servers from public
ssh -i ta-lab-key.pem ubuntu@192.168.21.42 'bash -s' < crontab.sh

# ---------------------- pvt server 2
#set permision 400 for remote pem keys 
scp -i ta-lab-key.pem ta-lab-key.pem ubuntu@192.168.22.152:/home/ubuntu; chmod 400 -i ta-lab-key.pem ubuntu@192.168.22.152:/home/ubuntu/*.pem

#copy bash scripts to remote servers
scp -i ta-lab-key.pem log.sh ubuntu@192.168.22.152:/home/ubuntu/
scp -i ta-lab-key.pem crontab.sh ubuntu@192.168.22.152:/home/ubuntu/


# execute copyied crontab.sh script remotley to create  the crontabs on remote servers from public
ssh -i ta-lab-key.pem ubuntu@192.168.22.152 'bash -s' < crontab2.sh

# ---------------------- pvt server 3
#set permision 400 for remote pem keys 
scp -i ta-lab-key.pem ta-lab-key.pem ubuntu@192.168.23.143:/home/ubuntu; chmod 400 -i ta-lab-key.pem ubuntu@192.168.23.143:/home/ubuntu/*.pem

#copy bash scripts to remote servers
scp -i ta-lab-key.pem log.sh ubuntu@192.168.23.143:/home/ubuntu/
scp -i ta-lab-key.pem crontab.sh ubuntu@192.168.23.143:/home/ubuntu/


# execute copyied crontab.sh script remotley to create  the crontabs on remote servers from public
ssh -i ta-lab-key.pem ubuntu@192.168.23.143 'bash -s' < crontab3.sh

# ---------------------- pvt server 4
#set permision 400 for remote pem keys 
scp -i ta-lab-key.pem ta-lab-key.pem ubuntu@192.168.24.144:/home/ubuntu; chmod 400 -i ta-lab-key.pem ubuntu@192.168.24.144:/home/ubuntu/*.pem

#copy bash scripts to remote servers
scp -i ta-lab-key.pem log.sh ubuntu@192.168.24.144:/home/ubuntu/
scp -i ta-lab-key.pem crontab.sh ubuntu@192.168.24.144:/home/ubuntu/


# execute copyied crontab.sh script remotley to create  the crontabs on remote servers from public
ssh -i ta-lab-key.pem ubuntu@192.168.24.144 'bash -s' < crontab4.sh

# ---------------------- pvt server 5
#set permision 400 for remote pem keys 
scp -i ta-lab-key.pem ta-lab-key.pem ubuntu@192.168.25.202:/home/ubuntu; chmod 400 -i ta-lab-key.pem ubuntu@192.168.25.202:/home/ubuntu/*.pem

#copy bash scripts to remote servers
scp -i ta-lab-key.pem log.sh ubuntu@192.168.25.202:/home/ubuntu/
scp -i ta-lab-key.pem crontab.sh ubuntu@192.168.25.202:/home/ubuntu/


# execute copyied crontab.sh script remotley to create  the crontabs on remote servers from public
ssh -i ta-lab-key.pem ubuntu@192.168.25.202 'bash -s' < crontab5.sh


