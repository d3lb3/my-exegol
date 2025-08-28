#!/bin/bash
#set -e

# This script will be executed on the first startup of each new container with the "my-resources" feature enabled.
# Arbitrary code can be added in this file, in order to customize Exegol (dependency installation, configuration file copy, etc).
# It is strongly advised **not** to overwrite the configuration files provided by exegol (e.g. /root/.zshrc, /opt/.exegol_aliases, ...), official updates will not be applied otherwise.

# Exegol also features a set of supported customization a user can make.
# The /opt/supported_setups.md file lists the supported configurations that can be made easily.

# keep track of the current directory as we will cd to install some tools
LAUNCH_DIRECTORY="$PWD"

# remove Exegol history
echo -n > ~/.zsh_history

# nxc passwords
sed -i 's/^audit_mode = .*/audit_mode = \*/' /root/.nxc/nxc.conf

# pentest environment variables source
FILE=/workspace/.env
if [ ! -f $FILE ]
then
    touch $FILE
fi
echo "DOMAIN=''" >> $FILE
echo "DC_IP=''" >> $FILE
echo "DC2_IP=''" >> $FILE
echo "USER=''" >> $FILE
echo "PASSWORD=''" >> $FILE
echo "USER_ADM=''" >> $FILE
echo "PASSWORD_ADM=''" >> $FILE
echo "ATTACKER_IP=''" >> $FILE

# build internal pentest tree
mkdir /workspace/attacks
mkdir /workspace/loot
mkdir /workspace/notes
touch /workspace/notes/todo.md
touch /workspace/notes/comptes.md
touch /workspace/notes/questions.md
mkdir /workspace/screenshots
mkdir /workspace/targets
mkdir /workspace/targets/nmap
mkdir /workspace/targets/bh

# fix user rights
find /workspace/ -type d -exec chmod 770 {} \; -exec chmod g+s {} \;
find /workspace/ -type f -exec chmod 660 {} \;

# additional setup
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list.d/kali.list
wget -q -O - https://archive.kali.org/archive-key.asc | sudo apt-key add -
sudo apt update
