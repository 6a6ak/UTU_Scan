#!/bin/bash

while :
do
    clear
    echo "-------------------------------------"
    echo " Main Menu "
    echo "-------------------------------------"
    echo "[1] Update System"
    echo "[2] Check for Rootkits"
    echo "[3] Check Firewall Status"
    echo "[4] Scan for Malware"
    echo "[5] Check System Files"
    echo "[6] Check for Unauthorized Users"
    echo "[0] Exit"
    echo "======================="
    echo -n "Enter your menu choice [0-6]: "

    read choice

    case $choice in
        1) echo "Updating System..."
           sudo apt update && sudo apt upgrade -y
           read -p "Press [Enter] key to continue..." readEnterKey ;;

        2) echo "Checking for Rootkits..."
           sudo apt install -y chkrootkit
           sudo chkrootkit
           read -p "Press [Enter] key to continue..." readEnterKey ;;

        3) echo "Checking Firewall Status..."
           sudo ufw status verbose
           read -p "Press [Enter] key to continue..." readEnterKey ;;

        4) echo "Scanning for Malware..."
           sudo apt install -y clamav
           sudo freshclam
           sudo clamscan -r /home
           read -p "Press [Enter] key to continue..." readEnterKey ;;

        5) echo "Checking System Files..."
           sudo apt install -y debsums
           sudo debsums -s
           read -p "Press [Enter] key to continue..." readEnterKey ;;

        6) echo "Checking for Unauthorized Users..."
           cat /etc/passwd
           read -p "Press [Enter] key to continue..." readEnterKey ;;

        0) exit 0 ;;

        *) echo "Invalid option"
           read -p "Press [Enter] key to continue..." readEnterKey ;;
    esac
done
