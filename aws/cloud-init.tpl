#!/usr/bin/env bash
sudo apt update && sudo apt install -y unzip jq boinc-client dnsutils
sleep 12
systemctl restart boinc-client
sleep 12
sudo boinccmd --project_attach http://boinc.bakerlab.org/rosetta 2145187_1ea61cfe866960f3a196ded17ec9a5d8
sleep 12
systemctl restart boinc-client
