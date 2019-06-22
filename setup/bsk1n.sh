function tutorials {

#input_box "Blockchain Starter Kit - Step 1" "Name of chain?" "HELLOWORLD" CHAIN
# sets CHAIN to the current chain, for tutorials, user selects TUT1, TUT2, TUT3, TUT4

while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Komodo Tutorials Console" \
--title "[ Komodo Smart Chain Tutorials & Blockchain Starter Kit ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key. \n\
\n\
Choose the Seed or Mining Menu" 25 120 14 \
TUT1 "Tutorial 1 - Smart Chain Creation Walkthrough" \
TUT2 "Tutorial 2 - Antara Module Faucet API Walkthrough" \
TUT3 "Tutorial 3 - Antara Module Tokens DEX API Walkthrough" \
TUT4 "Tutorial 4 - Antara Module Tokens NFT Walkthrough" \
TUT5 "Tutorial 5 - Antara Platform Sync Cross Chain API Walkthrough" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")

# make decsion
case $menuitem in
	TUT1) CHAIN=TUT1;bsk1n_tutorials_1;;
	TUT2) CHAIN=TUT1;bsk1n_tutorials_2;;
	TUT3) CHAIN=TUT1;bsk1n_tutorials_3;;
	TUT4) CHAIN=TUT1;bsk1n_tutorials_X;;
	TUT5) CHAIN=TUT5;bsk1n_tutorials_X;;
	Back) echo "Bye"; break;;
esac
done
}

function bsk1n_tutorials_1 {

#input_box "Blockchain Starter Kit - Step 1" "Name of chain?" "HELLOWORLD" CHAIN
echo "Loading tutorial using $CHAIN"
sleep 3

while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Tutorials Console" \
--title "[ 1 Node Blockchain Starter Kit - $CHAIN ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key. \n\
\n\
Go into each menu to complete the tasks \n\
1. Seed Node \n\
    a) Create Seed Node (Spin up) \n\
    b) Go to WALLET submenu and IMPORTDEVWALLET \n\
    c) Optionally VALIDATE the imported wallet \n\
2. Mining Node \n\
    a) Create Mining Node (Spin up) \n\
    b) Go to WALLET submenu and IMPORTDEVWALLET \n\
    c) Optionally VALIDATE the imported wallet \n\
3. Mining Node \n\
    a) Start Mining the first blocks of $CHAIN (setgenerate true) \n\
    b) Get Mining Info \n\
4. Mining Node \n\
    a) Get Blockchain Info \n\
5. Mining Node \n\
    a) Stop Mining (setgenerate false) \n\
    b) Shutdown Node \n\
6. Seed Node \n\
    a) Shutdown Node \n\
Choose the Seed or Mining Menu" 35 140 14 \
SEED-MENU "BSK - Single host - $CHAIN seed control" \
MINING-MENU "BSK - Single host -  $CHAIN mining control" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	SEED-MENU) bsk1n_seed_menu;;
	MINING-MENU) bsk1n_mining_menu;;
	Back) echo "Bye"; break;;
esac
done
}

function bsk1n_tutorials_2 {

#input_box "Blockchain Starter Kit - Step 1" "Name of chain?" "HELLOWORLD" CHAIN
echo "Loading tutorial using $CHAIN"
sleep 3

while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Tutorials Console" \
--title "[ 1 Node Blockchain Starter Kit - $CHAIN ]" \
--menu "You can use the UP/DOWN arrow keys, the first letter of the choice as a hot key. \n\
\n\
A faucet is useful for bootstrapping new users with just enough $CHAIN coins to use other Antara modules.  For example, to create a non-fungible token in the collectible sense of unique player data.  In the tutorial following this one, fungible tokens will be created to represent tokenized assets and traded in the Antara Tokens module's DEX capabilities. \n\
\n\
1. Create the $CHAIN Smart Chain until the mining node mines a block to get the initial supply in it's imported address \n\
2. Mining Node \n\
    a) Check the premine funds of 1000 $CHAIN coins are in the control of the node operator (you) by going to the WALLET submenu and getting the balance or listing the unspent coins\n\
3. Mining Node Deposit $CHAIN coins into the on-chain faucet application\n\
    a) It is now time to lock some of these pre-mine $CHAIN coins in a faucet for new users to tap into and request a small amount \n\
    b) Go to the FAUCET menu and select the FAUCETFUND option to deposit some funds into the faucet\n\
    c) The response will be a transaction id.   This transaction needs to be put into a block. \n\
    d) Using the mining node's main menu, use the GETINFO command to wait for the blocks attribute to go up \n\
    e) Optionally, from the FAUCET menu select INFO to view the faucet's global chain info \n\
4. Seed Node - get funds from the on-chain Faucet provided by the Antara module\n\
    a) Using the WALLET menu on the seed node, validate the address ismine is true.  If it isn't, use the IMPORT-DEV-WALLET command from the menu\n\
    b) Go to the FAUCET menu and select GET funds option\n\
    c) The faucetget transaction requires some proof of work.  This is an example of how to minimize spam by making the client create a transaction that ends in a specific sequence of bytes. \n\
    d) When the transaction fulfils the requirements of ending in the bytes 0x00 0x00, it will be sent to the network. \n\
    e) Wait for the next block to be mined.  Check the seed node's GETINFO command to monitor the blockchain info\n\
\n\
Choose the Seed or Mining Menu" 35 140 14 \
SEED-MENU "BSK - Single host - $CHAIN seed control" \
MINING-MENU "BSK - Single host -  $CHAIN mining control" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	SEED-MENU) bsk1n_seed_menu;;
	MINING-MENU) bsk1n_mining_menu;;
	Back) echo "Bye"; break;;
esac
done
}

function bsk1n_tutorials_3 {

#input_box "Blockchain Starter Kit - Step 1" "Name of chain?" "HELLOWORLD" CHAIN
echo "Loading tutorial using $CHAIN"
sleep 3

while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Tutorials Console" \
--title "[ 1 Node Blockchain Starter Kit - $CHAIN ]" \
--menu "You can use the UP/DOWN arrow keys, the first letter of the choice as a hot key. \n\
\n\
Go into each menu to complete the tasks \n\
1. Seed Node from Tutorial 2 now has 0.1 $CHAIN coins.  These can be used for creating tokens and then selling them on the on-chain DEX for the mining node wallet to buy with the $CHAIN coins. \n\
    a)  \n\
2. Mining Node \n\
    a) Create Mining Node (Spin up) import dev wallet & validate  \n\
Choose the Seed or Mining Menu" 35 140 14 \
SEED-MENU "BSK - Single host - $CHAIN seed control" \
MINING-MENU "BSK - Single host -  $CHAIN mining control" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	SEED-MENU) bsk1n_seed_menu;;
	MINING-MENU) bsk1n_mining_menu;;
	Back) echo "Bye"; break;;
esac
done
}

function bsk1n_tutorials_X {

#input_box "Blockchain Starter Kit - Step 1" "Name of chain?" "HELLOWORLD" CHAIN
echo "Loading tutorial using $CHAIN"
sleep 3

while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Tutorials Console" \
--title "[ 1 Node Blockchain Starter Kit - $CHAIN ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key. \n\
\n\
Go into each menu to complete the tasks \n\
1. Seed Node \n\
    a) Create Seed Node (Spin up) import dev wallet & validate \n\
2. Mining Node \n\
    a) Create Mining Node (Spin up) import dev wallet & validate  \n\
Choose the Seed or Mining Menu" 35 140 14 \
SEED-MENU "BSK - Single host - $CHAIN seed control" \
MINING-MENU "BSK - Single host -  $CHAIN mining control" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	SEED-MENU) bsk1n_seed_menu;;
	MINING-MENU) bsk1n_mining_menu;;
	Back) echo "Bye"; break;;
esac
done
}

function bsk1n_control {
while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Tutorials Console" \
--title "[ Blockchain Starter Kit - Control $CHAIN ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key. \n\
\n\
Choose the Seed or Mining Menu" 25 120 14 \
SEED-MENU "BSK - Single host - $CHAIN seed control" \
MINING-MENU "BSK - Single host -  $CHAIN mining control" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	SEED-MENU) bsk1n_seed_menu;;
	MINING-MENU) bsk1n_mining_menu;;
	Back) echo "Bye"; break;;
esac
done
}

function bsk1n_seed_menu {
  source $HOME/.devwallet
while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Tutorials Console using pubkey $DEVPUBKEY" \
--title "[ Blockchain Starter Kit - $CHAIN Seed Menu ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 25 120 14 \
SEED-GETINFO "$CHAIN seed getinfo" \
SPINUP-SEEDNODE "Create a Smart Chain Seed Node For $CHAIN"  \
SHUTDOWN-NODE-SEED "Shutdown $CHAIN seed node" \
DUMP-RPCCREDENTIALS "Dumps the rpcuser and rpcpassword for this $CHAIN seed node and exit" \
COINGW "(todo) Experimental: Coin Gateway" \
TOKENS "Use the tokenization system on this blockchain" \
ORACLES "Use the oracles on this blockchain" \
FAUCET "Use the on-chain faucet" \
REWARDS "Use the on-chain rewards system" \
WALLET "Use this node $CHAIN wallet" \
REINDEX "Required after installing a blockchain explorer for the first time" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
  SPINUP-SEEDNODE) bsk1n_seed_spinup;;
  SEED-GETINFO) bsk1n_seed_getinfo;;
  DUMP-RPCCREDENTIALS) dump_seed_rpccredentials;;
  COINGW) coingw;;
  SHUTDOWN-NODE-SEED) bsk1n_seed_shutdown;;
  TOKENS) bsk1n_seed_tokens;;
  ORACLES) bsk1n_seed_oracles;;
  FAUCET) bsk1n_seed_faucet;;
  REWARDS) bsk1n_seed_rewards;;
  WALLET) bsk1n_seed_wallet;;
  REINDEX) bsk1n_seed_reindex;;
  Back) echo "Bye"; break;;
esac
done
}

function bsk1n_mining_menu {
  source $HOME/.dev2wallet
while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Tutorials Console using pubkey $DEVPUBKEY" \
--title "[ Blockchain Starter Kit - $CHAIN Mining Menu ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 25 120 14 \
MINER-GETINFO "BSK-1node $CHAIN mining getinfo" \
MINER-GETMININGINFO "BSK-1node $CHAIN mining getmininginfo" \
MINING-START "BSK-1node $CHAIN start mining" \
MINING-STOP "BSK-1node $CHAIN mining stop" \
SPINUP-MININGNODE "Create a BSK-1node $CHAIN mining node" \
TOKENS "Use the tokenization system on this blockchain" \
ORACLES "Use the oracles on this blockchain" \
FAUCET "Use the on-chain faucet" \
REWARDS "Use the on-chain rewards system" \
WALLET "Use this node $CHAIN wallet" \
COINGW "Experimental: Coin Gateway" \
SHUTDOWN-NODE-MINER "Shutdown $CHAIN mining node" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
  SPINUP-MININGNODE) bsk1n_mining_spinup;;
  MINER-GETINFO) bsk1n_mining_getinfo;;
  MINER-GETMININGINFO) bsk1n_mining_getmininginfo;;
  MINING-START) bsk1n_mining_start;;
  MINING-STOP) bsk1n_mining_stop;;
  COINGW) coingw;;
  SHUTDOWN-NODE-MINER) bsk1n_mining_shutdown;;
  TOKENS) bsk1n_mining_tokens;;
  ORACLES) bsk1n_mining_oracles;;
  FAUCET) bsk1n_mining_faucet;;
  REWARDS) bsk1n_mining_rewards;;
  WALLET) bsk1n_mining_wallet;;
	Back) echo "Bye"; break;;
esac
done
}


function bsk1n_seed_getinfo {
  CHAIN=$CHAIN
  METHOD="getinfo"
  if ps aux | grep -i $CHAIN | grep -v "coinData\|grep" ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$METHOD\", \"params\": []}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result' > ~/.$METHOD
    MSGBOXINFO=`cat ~/.$METHOD`
    message_box "$METHOD" "$MSGBOXINFO"
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi

}

function bsk1n_mining_getinfo {
  CHAIN=$CHAIN
  METHOD="getinfo"
  if ps aux | grep -i $CHAIN | grep coinData ; then
    source ~/coinData/$CHAIN/$CHAIN.conf
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$METHOD\", \"params\": []}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result' > ~/.$METHOD
    MSGBOXINFO=`cat ~/.$METHOD`
    message_box "$METHOD" "$MSGBOXINFO"
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function bsk1n_mining_getmininginfo {
  CHAIN=$CHAIN
  METHOD="getmininginfo"
  if ps aux | grep -i $CHAIN | grep coinData ; then
    source ~/coinData/$CHAIN/$CHAIN.conf
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$METHOD\", \"params\": []}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result' > ~/.$METHOD
    MSGBOXINFO=`cat ~/.$METHOD`
    message_box "$METHOD" "$MSGBOXINFO"
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function bsk1n_seed_reindex {
    if ps aux | grep komodod | grep -i "=$CHAIN " | grep -iv "coinData\|grep" ; then
	    echo "seed node for name $CHAIN running, use different name"
	    sleep 2
    else
      input_box "$CHAIN" "How many $CHAIN coins?" "1000" SUPPLY
      source ~/.devwallet
      echo $SUPPLY
      sleep 1
      echo $CHAIN
      sleep 1
      echo "BSK_$CHAIN=-ac_supply=$SUPPLY" >> ~/.komodoinabox.conf
      hide_output komodod -ac_name=$CHAIN -ac_supply=$SUPPLY -pubkey=$DEVPUBKEY -ac_cc=2 -reindex &>/dev/null &
      sleep 1
      sleep 1
      source ~/.komodo/$CHAIN/$CHAIN.conf
      echo "Finishing seed node setup"
      sleep 5
      curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"importprivkey\", \"params\": [\"$DEVWIF\"]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result'
      sleep 1
    fi
}

function bsk1n_seed_spinup {
    if ps aux | grep komodod | grep -i "=$CHAIN " | grep -iv "coinData\|grep" ; then
	    echo "seed node for name $CHAIN running, use different name"
	    sleep 2
    else
      input_box "$CHAIN" "How many $CHAIN coins?" "1000" SUPPLY
      source ~/.devwallet
      echo $SUPPLY
      sleep 1
      echo $CHAIN
      sleep 1
      IPA=`ip a | grep inet | grep -v "127.0.0.1" | awk '{print $2}'| sed 's/\/.*//'`
      IPR=`ip r | grep default | awk '{print $3}'`
      echo "BSK_$CHAIN=-ac_supply=$SUPPLY" >> ~/.komodoinabox.conf
      hide_output komodod -ac_name=$CHAIN -ac_supply=$SUPPLY -pubkey=$DEVPUBKEY -ac_cc=2 -rpcbind=$IPA -rpcallowip=$IPR &>/dev/null &
      sleep 1
      sleep 1
      source ~/.komodo/$CHAIN/$CHAIN.conf
      echo "Finishing seed node setup"
      sleep 5
      curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"importprivkey\", \"params\": [\"$DEVWIF\"]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result'
      sleep 1
    fi
}

function bsk1n_mining_spinup {
  if ps aux | grep $CHAIN | grep coinData ; then
    echo "Already running a mining node"
    sleep 2
  else
    if [ -d ~/coinData/$CHAIN ]; then
	    echo "$CHAIN already been a mining node, no need to mkdir"
	    sleep 1
    else
      NEWRPCPORT=$(shuf -i 25000-25500 -n 1)
      TRYAGAIN=1
      while [ $TRYAGAIN -eq 1 ]
      do
	      NEWPORT=$(( NEWRPCPORT - 1 ))
	      echo "Seeing if ports are available for RPC/P2P $NEWPORT / $NEWRPCPORT"
	      sleep 1
	      if netstat -ptan | grep "$NEWRPCPORT\|$NEWPORT" ; then
		      NEWRPCPORT=$(shuf -i 25000-25500 -n 1)
		      echo "Try again...with $NEWRPCPORT"
		      sleep 1
	      else
		      TRYAGAIN=0
	      fi

      done
      mkdir -p ~/coinData/$CHAIN
      cp ~/.komodo/$CHAIN/$CHAIN.conf ~/coinData/$CHAIN
      newrpcuser=$(dd bs=24 count=1 if=/dev/urandom | base64 | tr +/ _.)
      newrpcpassword=$(dd bs=24 count=1 if=/dev/urandom | base64 | tr +/ _.)
      sed -i "s/^\(rpcuser=\).*$/rpcuser=$newrpcuser/" ~/coinData/$CHAIN/$CHAIN.conf
      sed -i "s/^\(rpcpassword=\).*$/rpcpassword=$newrpcpassword/" ~/coinData/$CHAIN/$CHAIN.conf
      echo "port=$NEWPORT" >> ~/coinData/$CHAIN/$CHAIN.conf
      sed -i "s/^\(rpcport=\).*$/rpcport=$NEWRPCPORT/" ~/coinData/$CHAIN/$CHAIN.conf
      echo "Created datadir for single host BSK"
      sleep 2
    fi
    source $HOME/.dev2wallet
    input_box "$CHAIN" "How many $CHAIN coins?\n\nNote: Must be same as seed node" "1000" SUPPLY
    hide_output komodod -ac_name=$CHAIN -ac_supply=$SUPPLY -datadir=$HOME/coinData/$CHAIN -addnode=localhost -pubkey=$DEVPUBKEY -ac_cc=2 & #>/dev/null &
    echo "Finished mining node setup"
    echo "Ready to enable mining..."
    cat ~/coinData/$CHAIN/$CHAIN.conf
    sleep 3
  fi
}

function bsk1n_mining_importdevwallet {
  if ps aux | grep -i $CHAIN | grep coinData ; then
    source ~/coinData/$CHAIN/$CHAIN.conf
    source ~/.dev2wallet
    echo "Importing $DEVADDRESS"
    sleep 2
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"importprivkey\", \"params\": [\"$DEVWIF\"]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result'
    sleep 1
  else
    echo "Mining node not running"
    sleep 2
  fi
}

function bsk1n_mining_start {
  if ps aux | grep -i $CHAIN | grep coinData ; then
	  echo "Staring mining on $CHAIN"
	  sleep 3
    source ~/coinData/$CHAIN/$CHAIN.conf
    RESULT=`curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"setgenerate\", \"params\": [true,1]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result'`
    echo $RESULT
    sleep 1
  else
    echo "Mining node not running"
    sleep 2
  fi
}

function bsk1n_mining_stop {
  if ps aux | grep -i $CHAIN | grep coinData ; then
    source ~/coinData/$CHAIN/$CHAIN.conf
    RESULT=`curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"setgenerate\", \"params\": [false]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result'`
    #echo $RESULT
    sleep 1
  else
    echo "Mining node not running"
    sleep 2
  fi
}

function bsk1n_mining_shutdown {
  if ps aux | grep -i $CHAIN | grep coinData ; then
    source ~/coinData/$CHAIN/$CHAIN.conf
    RESULT=`curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"stop\", \"params\": []}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result'`
    echo $RESULT
    sleep 1
  else
    echo "Mining node not running"
    sleep 2
  fi
}

function bsk1n_seed_shutdown {
  source ~/.komodo/$CHAIN/$CHAIN.conf
  RESULT=`curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"stop\", \"params\": []}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result'`
  echo $RESULT
  sleep 1
}

function bsk1n_seed_wallet {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source $HOME/.devwallet
    submenu_wallet
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function bsk1n_seed_tokens {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source $HOME/.devwallet
    submenu_tokens
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function bsk1n_seed_oracles {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source $HOME/.devwallet
    submenu_oracles
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function bsk1n_seed_faucet {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source $HOME/.devwallet
    submenu_faucet
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function bsk1n_seed_rewards {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source $HOME/.devwallet
    submenu_rewards
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function bsk1n_mining_wallet {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN | grep coinData ; then
    source ~/coinData/$CHAIN/$CHAIN.conf
    source $HOME/.dev2wallet
    submenu_wallet
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function bsk1n_mining_tokens {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN | grep coinData ; then
    source ~/coinData/$CHAIN/$CHAIN.conf
    source $HOME/.dev2wallet
    submenu_tokens
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function bsk1n_mining_oracles {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN | grep coinData ; then
    source ~/coinData/$CHAIN/$CHAIN.conf
    source $HOME/.dev2wallet
    echo "Using mining node's oracles data"
    submenu_oracles
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function bsk1n_mining_faucet {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN | grep coinData ; then
    source ~/coinData/$CHAIN/$CHAIN.conf
    source $HOME/.dev2wallet
    echo "Using mining node's faucet"
    submenu_faucet
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function bsk1n_mining_rewards {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN | grep coinData ; then
    source ~/coinData/$CHAIN/$CHAIN.conf
    source $HOME/.dev2wallet
    echo "Using mining node's rewards"
    submenu_rewards
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function dump_seed_rpccredentials {
  RPCUSER=`cat ~/.komodo/$CHAIN/$CHAIN.conf | grep "^rpcuser="`
  RPCPASSWORD=`cat ~/.komodo/$CHAIN/$CHAIN.conf | grep "^rpcpassword="`
  echo "$RPCUSER"
  echo "$RPCPASSWORD"
  echo "Goodbye"
  exit
}

