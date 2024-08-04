#! /bin/bash

# Greets user and explains program
echo -e "Welcome to the open port scanner!\n"

# Asks user for starting IP address in scan range and saves it
echo "Enter starting IP address: "
# -e (Allows escape sequences) such as \n (newline)
read firstIP && echo -e "\n"

# Asks user for last octet of last IP address in scan range and saves it
echo "Enter the last octet of the ending IP address: "
read lastOctetIP && echo -e "\n"

# Asks user for the port to be scanned and saves it
echo "Enter the port number to be scanned: "
read port && echo -e "\nRunning scan...\n"

# Scans the given IP address range for given port and sends output to allResults
# -sT (TCP connection scan)
# Hides scan output by sending it to /dev/null
# -oG (grepable output)
nmap -sT $firstIP-$lastOctetIP -p $port >/dev/null -oG allResults

# Searches through allResults and sends all open ports to openResults
cat allResults | grep open > openResults

# Prints scan status update
echo -e "\nScanned for open ports."
echo "Displaying hosts with port $port open... "

# Prints hosts within given range with given port open
echo "------------------------------" && cat openResults
echo -e "------------------------------\nScan complete."