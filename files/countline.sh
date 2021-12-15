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