#!/bin/bash -v
sudo apt update && sudo apt install -y unzip jq boinc-client dnsutils
sleep 12
systemctl restart boinc-client
sleep 12
sudo boinccmd --project_attach http://boinc.bakerlab.org/rosetta 51f200480b1473b1b972f89b051a31d3
sleep 12
systemctl restart boinc-client