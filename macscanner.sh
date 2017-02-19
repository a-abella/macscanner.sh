#!/bin/bash

# Network scanner utility. Generates whitespace-delimited list of hostnames and mac addresses.
# Requires properly configured DNS on the network to resolve hostnames.
# Must be run as root for nmap to output mac addresses.

# Scan network for devices and parse nmap output for hostnames and mac addresses
nmap -sS --max-retries 2 --defeat-rst-ratelimit -T 5 -M 36 192.168.0-5.0-255 | grep -Ei 'scan report for|mac address' | paste -d " " - - | grep ".domain.tld" | awk -F ' ' '{print $5"\t\t"$9}' >> /root/macscanner/macs-out.txt

# Clean up list formatting and remove entries without hostnames
sort -u /path/to/macs-out.txt > /path/to/macscanner/temp.txt
grep -vi 'Nmap' /path/to/macscanner/temp.txt > /path/to/macscanner/temp2.txt

# Leave only most recent duplicate
awk -F'.' '{ x[$1]=$0 } END { for (i in x) print x[i] }' /root/macscanner/temp2.txt > /root/macscanner/macs-out.txt
rm /root/macscanner/temp*.txt
