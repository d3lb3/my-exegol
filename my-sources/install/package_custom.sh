#!/bin/bash
# Author: @d3lb3

source common.sh
# sourcing package_ad.sh for the install_powershell() function
source package_base.sh
source package_misc.sh
source package_osint.sh
source package_web.sh
source package_ad.sh
source package_wordlists.sh
source package_mobile.sh
source package_iot.sh
source package_rfid.sh
source package_voip.sh
source package_sdr.sh
source package_network.sh
source package_wifi.sh
source package_forensic.sh
source package_cloud.sh
source package_steganography.sh
source package_reverse.sh
source package_crypto.sh
source package_code_analysis.sh
source package_cracking.sh
source package_c2.sh

function install_arsenal_custom() {
    git clone https://github.com/Orange-Cyberdefense/arsenal
    rm -rf ./arsenal/arsenal/data/cheats
    git clone https://github.com/d3lb3/arsenal-cheats
    cp -r arsenal-cheats/cheats ./arsenal/arsenal/data/cheats
    rm -rf arsenal-cheats
    cd arsenal
    pipx install .
    cd $LAUNCH_DIRECTORY
    rm -rf arsenal
}

function add_kali_repository() {
    echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list.d/kali.list
    wget -q -O - https://archive.kali.org/archive-key.asc | sudo apt-key add -
    sudo apt update
}


function package_custom() {
    set_env
    local start_time
    local end_time
    start_time=$(date +%s)
    install_gobuster
    install_dirsearch
    install_wpscan
    install_testssl
    install_sqlmap
    install_gowitness
    fapt hydra

    # ad
    fapt ldap-utils
    install_smbclientng
    install_pretender
    install_responder
    install_bloodhound-py
    install_bloodhound
    install_cypheroth
    install_mitm6_pip
    install_impacket
    install_powershell
    install_krbrelayx
    #install_pypykatz
    install_enum4linux-ng
    install_libmspack
    install_windapsearch-go
    install_smbmap
    install_adidnsdump
    install_petitpotam
    install_coercer
    install_dfscoerce
    #install_pkinittools => error code 1
    install_pywhisker
    install_pywsus
    install_donpapi
    install_proxychains
    install_certipy
    install_pyfinduncommonshares
    #install_ldaprelayscan" => error code 1
    install_kerbrute
    install_ldeep
    install_keepwn
    install_pre2k
    install_certsync
    install_bqm
    install_neo4j
    install_netexec
    install_bloodyAD
    install_dploot
    install_smartbrute
    install_metasploit
    install_bettercap
    install_wifite2

    # network
    fapt nmap
    fapt traceroute
    install_nmap

    # crack
    fapt hashcat
    fapt fcrackzip
    install_john
    install_haiti

    # misc
    install_searchsploit
    install_seclists
    install_arsenal_custom
    add_kali_repository

    end_time=$(date +%s)
    local elapsed_time=$((end_time - start_time))
    colorecho "Package custom completed in $elapsed_time seconds."
}