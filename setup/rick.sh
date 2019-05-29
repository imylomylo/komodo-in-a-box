function submenu_rick {
while true
do
CHAIN=RICK

### display main menu ###
dialog --clear  --help-button --backtitle "Cakeshop Console" \
--title "[ K M D I C E - C O N S O L E ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 25 60 14 \
GETINFO "Get Info - $CHAIN getinfo method" \
LISTUNSPENT "List Unspent UTXO - $CHAIN listunspent" \
GETPEERINFO "Get Network Info - $CHAIN getpeerinfo" \
RICK_GETMININGINFO "Get Mining Info - $CHAIN getmininginfo" \
RICK_DELETE "Experimental - Delete blockchain data" \
RICK_START "Start $CHAIN" \
WALLET "Wallet function for $CHAIN" \
FAUCET "Faucet functions for $CHAIN" \
REWARDS "Rewards functions for $CHAIN" \
TOKENS "Use the tokenization system on this blockchain" \
STOP "Stop $CHAIN" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	RICK_DELETE) delete_blockchain_data_rick;;
	RICK_START) start_rick;;
	STOP) stop;;
	GETINFO) getinfo;;
	LISTUNSPENT) listunspent;;
	GETPEERINFO) getpeerinfo;;	
	GETMININGINFO) getmininginfo;;
	WALLET) rick_wallet;;
	TOKENS) rick_tokens;;
  FAUCET) rick_faucet;;
  REWARDS) rick_rewards;;
	Back) echo "Bye"; break;;
esac
done
}

function rick_wallet {
  KIABMETHOD="listunspent"
  if ps aux | grep -i komodod | grep -v "naame\|grep" ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source $HOME/.devwallet
    submenu_wallet
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function rick_tokens {
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


function rick_faucet {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source ~/.devwallet
    submenu_faucet
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function rick_rewards {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source ~/.devwallet
    submenu_rewards
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function start_rick {
        CHAIN="RICK"
        source ~/.devwallet
        echo "Starting $CHAIN..."
        sleep 2
        if ! ps aux | grep -i "=$CHAIN " | grep -v grep ; then
                echo "Starting $CHAIN... "
                if [ "$DEVPUBKEY" == "" ]; then
                        echo "Starting $CHAIN with no pubkey set"
			hide_output komodod -ac_name=RICK -ac_supply=90000000000 -ac_reward=100000000 -ac_cc=3 -addnode=138.201.136.145 &
                        sleep 3
                else
                        echo "Starting $CHAIN with pubkey $DEVPUBKEY"
			hide_output komodod -pubkey=$DEVPUBKEY -ac_name=RICK -ac_supply=90000000000 -ac_reward=100000000 -ac_cc=3 -addnode=138.201.136.145 &
                        sleep 3
                fi
        else
                echo "Not starting $CHAIN - already started"
                sleep 4
        fi
}

