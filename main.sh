#!/bin/bash
#thenurhabib

rm -rf listtwo.txt &> /dev/null
tar=$1
sfe=$(echo "$tar" | cut -d "." -f 1)
echo -n "+-www" > listone.txt

runtime="40 second"
endtime=$(date -ud "$runtime" +%s)

while [[ $(date -u +%s) -le $endtime ]]
do
    
    for gsd in $(cat listone.txt); do
        g=$(curl "https://www.google.com/search?q=site:$tar$gsd" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' -s | grep -Eoi '<a [^>]+>' |  grep -Eo 'href="[^\"]+"' |  grep -Eo '(http|https)://[^/"]+' | grep -i "$tar" | sort -u)
        
        if echo "$g" | grep -i ".$tar" &> /dev/null;
        then
            echo "$g" | sed 's/https:\/\///g' | sed 's/http:\/\///g'
            echo "$g" | grep -v "https://$tar\|http://$tar" | cut -d '/' -f 3 | cut -d "." -f 1 | sed 's/\<$sfe\>//g' | sed 's/^/+-/' | sort -u | tr -d '\n' >> listtwo.txt
        else
            exit 1
        fi
    done < listone.txt
    
    cat listtwo.txt | tr '+-' '\n' | sort -u | sed 's/^/+-/' | tr -d '\n' > listone.txt
done
