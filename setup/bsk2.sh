
function bsk2 {
PARAM_STRING=""
input_box "Blockchain Starter Kit - Step 1" "Name of chain?" "HELLOWORLD" CHAIN

while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Cakeshop Console" \
--title "[ Blockchain Starter Kit - $CHAIN ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key. \n\
\n\
Choose the Seed or Mining Menu" 25 120 14 \
SEED-MENU "BSK - $CHAIN seed control" \
MINING-MENU "BSK - $CHAIN mining control" \
TOKENS "Use the tokenization system on this blockchain" \
WALLET "Use this node $CHAIN wallet" \
PARAMETERS "Configure Smart Chain Parameters for $CHAIN start up" \
RUNNING "BSK - $CHAIN control" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
  TOKENS) tokens;;
  WALLET) wallet;;
  PARAMETERS) bsk2_submenu_param;;
  RUNNING) bsk2_submenu_running;;
  Back) echo "Bye"; break;;
esac
done
}

function wallet {
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

function tokens {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source ~/.devwallet
    submenu_tokens
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function bsk2_submenu_param {
while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Blockchain Dev Kit Console" \
--title "[ Blockchain Starter Kit - $CHAIN Parameters Menu ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 25 120 14 \
CHOICE_AC_SUPPLY "BSK $CHAIN -ac_supply" \
CHOICE_AC_REWARD "BSK $CHAIN -ac_reward" \
CHOICE_AC_BLOCKTIME "BSK $CHAIN -ac_blocktime" \
CHOICE_AC_FOUNDERS "BSK $CHAIN -ac_founders" \
CHOICE_AC_HALVING "BSK $CHAIN -ac_halving" \
CHOICE_AC_STAKED "BSK $CHAIN -ac_staked" \
CHOICE_AC_PUBKEY "BSK $CHAIN -ac_pubkey" \
CHOICE_ADDNODE "BSK $CHAIN -addnode" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
  CHOICE_AC_SUPPLY) bsk2_param_supply;;
  CHOICE_AC_REWARD) bsk2_param_reward;;
  CHOICE_AC_BLOCKTIME) bsk2_param_blocktime;;
  CHOICE_AC_FOUNDERS) bsk2_param_founders;;
  CHOICE_AC_HALVING) bsk2_param_halving;;
  CHOICE_AC_STAKED) bsk2_param_staked;;
  CHOICE_AC_PUBKEY) bsk2_param_pubkey;;
  CHOICE_ADDNODE) bsk2_param_addnode;;
  Back) echo "Bye"; break;;
esac
done
}


function bsk2_submenu_running {
while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Cakeshop Console" \
--title "[ Blockchain Starter Kit - $CHAIN Seed Menu ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 25 120 14 \
RUNNING-GETINFO "BSK $CHAIN seed getinfo" \
RUNNING-START "Create a BSK $CHAIN seed node" \
RUNNING-STOP "Shutdown $CHAIN seed node" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	RUNNING-START) bsk2_running_start;;
	RUNNING-GETINFO) bsk2_running_getinfo;;
	RUNNING-STOP) bsk2_running_stop;;
	Back) echo "Bye"; break;;
esac
done
}

function bsk2_running_start {
    if ps aux | grep -i $CHAIN | grep -iv "coinData\|grep" ; then
	    echo "seed node for name $CHAIN running, use different name"
	    sleep 2
    else
      source ~/.devwallet
      echo $PARAM_STRING
      sleep 3
      hide_output komodod -ac_name=${CHAIN} ${PARAM_STRING} -pubkey=$DEVPUBKEY -ac_cc=2 &>/dev/null &
      sleep 1
      sleep 1
      source ~/.komodo/$CHAIN/$CHAIN.conf
      echo "Node setup done and chain started"
      sleep 5
      curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"importprivkey\", \"params\": [\"$DEVWIF\"]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result'
      sleep 1
    fi
}

function bsk2_importdevwallet {
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source ~/.devwallet
    echo "Importing $DEVADDRESS"
    sleep 2
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"importprivkey\", \"params\": [\"$DEVWIF\"]}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result'
    sleep 1
  else
    echo "Node not running"
    sleep 2
  fi
}


function bsk2_stop {
   METHOD="stop"
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    RESULT=`curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"${METHOD}\", \"params\": []}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result'`
    echo $RESULT
    sleep 1
  else
    echo "Mining node not running"
    sleep 2
  fi
}

function bsk2_param_supply {
    if ps aux | grep -i $CHAIN | grep -iv "coinData\|grep" ; then
	    echo "Node for name $CHAIN running, use different name"
	    sleep 2
    else
      input_box "$CHAIN" "How many $CHAIN coins? -ac_supply=" "1000" AC_PARAM_SUPPLY
      PARAM_STRING="${PARAM_STRING} -ac_supply=${AC_PARAM_SUPPLY}"
    fi
}

function bsk2_param_reward {
    if ps aux | grep -i $CHAIN | grep -iv "coinData\|grep" ; then
	    echo "Node for name $CHAIN running, use different name"
	    sleep 2
    else
      input_box "$CHAIN" "How many $CHAIN coins block reward? -ac_reward=" "10000" AC_PARAM_REWARD
      PARAM_STRING="${PARAM_STRING} -ac_reward=${AC_PARAM_REWARD}"
    fi
}

function bsk2_param_pubkey {
    if ps aux | grep -i $CHAIN | grep -iv "coinData\|grep" ; then
	    echo "Node for name $CHAIN running, use different name"
	    sleep 2
    else
      input_box "$CHAIN" "$CHAIN pubkey for receiving payments from network? -ac_pubkey=" "66 char pubkey" AC_PARAM_PUBKEY
      PARAM_STRING="${PARAM_STRING} -ac_pubkey=${AC_PARAM_PUBKEY}"
    fi
}




function bsk2_param_blocktime {
    if ps aux | grep -i $CHAIN | grep -iv "coinData\|grep" ; then
	    echo "Node for name $CHAIN running, use different name"
	    sleep 2
    else
      input_box "$CHAIN" "How many seconds per block in $CHAIN? -ac_blocktime=" "30" AC_PARAM_BLOCKTIME
      PARAM_STRING="${PARAM_STRING} -ac_blocktime=${AC_PARAM_BLOCKTIME}"
    fi
}


function bsk2_param_founders {
    if ps aux | grep -i $CHAIN | grep -iv "coinData\|grep" ; then
	    echo "Node for name $CHAIN running, use different name"
	    sleep 2
    else
      input_box "$CHAIN" "How much founders reward in $CHAIN? -ac_founders=" "20" AC_PARAM_FOUNDERS
      PARAM_STRING="${PARAM_STRING} -ac_founders=${AC_PARAM_FOUNDERS}"
    fi
}


function bsk2_param_halving {
    if ps aux | grep -i $CHAIN | grep -iv "coinData\|grep" ; then
	    echo "Node for name $CHAIN running, use different name"
	    sleep 2
    else
      input_box "$CHAIN" "How many blocks until halving in $CHAIN? -ac_halving=" "10000" AC_PARAM_HALVING
      PARAM_STRING="${PARAM_STRING} -ac_halving=${AC_PARAM_HALVING}"
    fi
}


function bsk2_param_staked {
    if ps aux | grep -i $CHAIN | grep -iv "coinData\|grep" ; then
	    echo "Node for name $CHAIN running, use different name"
	    sleep 2
    else
      input_box "$CHAIN" "What percentage of proof of staked in $CHAIN? -ac_staked=" "50" AC_PARAM_STAKED
      PARAM_STRING="${PARAM_STRING} -ac_blocktime=${AC_PARAM_STAKED}"
    fi
}


function bsk2_param_addnode {
    if ps aux | grep -i $CHAIN | grep -iv "coinData\|grep" ; then
	    echo "seed node for name $CHAIN running, use different name"
	    sleep 2
    else
      input_box "$CHAIN" "How many seconds per block in $CHAIN? -addnode=" "1.2.3.4" AC_PARAM_ADDNODE
      PARAM_STRING="${PARAM_STRING} -addnode=${AC_PARAM_ADDNODE}"
    fi
}

function bsk2_running_stop {
  source ~/.komodo/$CHAIN/$CHAIN.conf
  RESULT=`curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"stop\", \"params\": []}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result'`
  echo $RESULT
  sleep 1
}

function bsk2_running_getinfo {
  CHAIN=$CHAIN
  METHOD="getinfo"
  if ps aux | grep -i $CHAIN | grep -v grep ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    curl -s --user $rpcuser:$rpcpassword --data-binary "{\"jsonrpc\": \"1.0\", \"id\": \"curltest\", \"method\": \"$METHOD\", \"params\": []}" -H 'content-type: text/plain;' http://127.0.0.1:$rpcport/ | jq -r '.result' > ~/.$METHOD
    MSGBOXINFO=`cat ~/.$METHOD`
    message_box "$METHOD" "$MSGBOXINFO"
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

