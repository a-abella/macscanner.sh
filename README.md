# macscanner.sh
Network scanner and MAC address list compiler. For use with Wake-Send.ps1

Developed in conjunction with my [Wake-Send.ps1](https://github.com/a-abella/Wake-Send.ps1) PowerShell script, I needed a reliable and up-to-date source of device MAC addresses on the network so I could construct a magic packet containing a target PC's mac address data. Enter macscanner.sh. Parses nmap output, self-cleans repeat entries, is multi-hostname-aware, and would require no maintenance or afterthought. Runs on any Linux server you have lying around that's online on your target network. I run it on a 30 minute cron, and scp it to a network location where Wake-Send.ps1 can access it.

## Requirements ##
<code>Nmap</code> and <code>awk</code>

## Usage ##
1. Edit script source with your relevant IP range and domain name information.
2. Must be run as root for Nmap to see host MAC address data.
3. Most effective when run frequently to collect new devices.
4. As Nmap collects MAC address data from broadcast frames, this script can only collect data from the executing host's subnet. To collect from multiple subnets you will need a host on each subnet.
