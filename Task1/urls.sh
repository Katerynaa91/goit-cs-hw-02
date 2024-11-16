#!/bin/bash

websites=("https://google.com/" "https://weather.com/" "https://facebook.com/")

log_file="logs.log"

> "$log_file"

for website in "${websites[@]}"
do
        timestamp=$(date +"%Y-%m-%d %H:%M%S")

        status_code=$(curl -k -I -o /dev/null -s -w "%{http_code}" -L "$website")

        if [ "$status_code" -eq 200 ]; then
                echo "[$timestamp] $website is UP $status_code" | tee -a "$log_file"
        else
                echo "[$timestamp] $website is DOWN $status_code" | tee -a "$log_file"
        fi
done
