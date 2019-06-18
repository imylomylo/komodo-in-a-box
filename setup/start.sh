#!/bin/bash
# This is the entry point for configuring the system.
#####################################################
INSTALL_DIR=`pwd`
#sudo apt-get update
#sudo apt-get -y install libgomp1 jq dialog
export NCURSES_NO_UTF8_ACS=1
source setup/functions.sh # load our functions
#mkdir -p ~/bin

# Put a start script in a global location. We tell the user to run 'komodoinabox'
# in the first dialog prompt, so we should do this before that starts.
cat > /usr/local/bin/learn-kmd << EOF;
#!/bin/bash
cd /learn-kmd
source setup/start.sh
EOF
chmod +x /usr/local/bin/learn-kmd

source setup/tutorials.sh 
echo
echo "-----------------------------------------------"
echo
echo Your komodod start chains running follow: 1 per line
echo
ps aux | grep komodod | grep -v grep | awk -F " " '{$1=$2=$3=$4=$5=$6=$7=$8=$9=$10=""; print $0 }'
ps aux | grep hushd | grep -v grep | awk -F " " '{$1=$2=$3=$4=$5=$6=$7=$8=$9=$10=""; print $0 }'
