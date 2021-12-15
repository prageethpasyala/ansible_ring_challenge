
terraform apply --auto-approve

cd /Users/prageeth.pasyala/Documents/Talent_Acedemy/Terraform/Ring_challenge


LIVE MONITERING OF TXT FILE :                   tail -f masterlog.txt
PVTSERVER LOG.SH EXECUTABLE :                   chmod +x log.sh
CREATE CRONTAB :                                crontab -e
                                                crontab -l
PVTSERVER CRONTAB :                             * * * * * /bin/bash /home/ec2-user/log.sh


PUBLIC SERVER :                                 movefile.sh -> sudo cp masterlog.txt /var/www/html/
SET MOVEFILE EXECUTABLE :                       chmod +x movefile.sh
CREATE CRONTAB :                                crontab -e
CRONTAB :                                       * * * * * /bin/bash -c "/home/ec2-user/movefile.sh"
CHNAGE /VAR/WWW REMOTE WRITE PERMISSION :       sudo chmod 777 /var/www/html -R


SSH ON TO REMOTE SERVER :                       ssh -i "ta-lab-key.pem" ec2-user@54.217.48.107   
SECURE TRANSFER TO REMOTE SERVER:               scp -i ta-lab-key.pem log.txt ec2-user@54.217.48.107:/home/ec2-user/

TO DEALY RUNNING :                              /bin/sleep 2


ssh -i "~/.ssh/ta-lab-key.pem" ec2-user@34.253.155.219
sudo chmod 777 /var/www/html -R                  chnage permission on public server html folder 

scp -i "~/.ssh/ta-lab-key.pem" ta-lab-key.pem ec2-user@34.253.155.219:/home/ec2-user/
scp -i "~/.ssh/ta-lab-key.pem" log.sh ec2-user@34.253.155.219:/home/ec2-user/
scp -i "~/.ssh/ta-lab-key.pem" index.php ec2-user@34.253.155.219:/var/www/html/
scp -i "~/.ssh/ta-lab-key.pem" lognum.php ec2-user@34.253.155.219:/var/www/html/
scp -i "~/.ssh/ta-lab-key.pem" masterlog.php ec2-user@34.253.155.219:/var/www/html/
scp -i "~/.ssh/ta-lab-key.pem" index.html ec2-user@34.253.155.219:/var/www/html/

pvt-server-1st = "192.168.21.42"


scp -i ta-lab-key.pem ta-lab-key.pem ubuntu@192.168.21.42:/home/ubuntu/



scp -i ta-lab-key.pem log.sh ubuntu@192.168.21.42:/home/ubuntu/


ssh -i ta-lab-key.pem ec2-user@192.168.21.37
ssh -i ta-lab-key.pem ec2-user@192.168.22.109
ssh -i ta-lab-key.pem ec2-user@192.168.23.244
ssh -i ta-lab-key.pem ec2-user@192.168.24.9
ssh -i ta-lab-key.pem ec2-user@192.168.25.218

chmod +x log.sh



RENAMEING THE MAIN WEB PAGE TEXT CONTENT : /var/www/html/countlin.sh
#!/bin/bash
lines=$(wc -l < /var/www/html/masterlog.txt)
echo $lines 
if [$lines<15]; then
        echo "Same page"
else 
        echo "Refresh page"
        

        $(cp masterlog.txt echo $lines.txt)
        $(rm masterlog.txt) 
fi