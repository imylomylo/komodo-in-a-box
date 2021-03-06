function submenu_kmdice {
while true
do
CHAIN=KMDICE

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
KMDICE_GETMININGINFO "Get Mining Info - $CHAIN getmininginfo" \
KMDICE_DELETE "Experimental - Delete blockchain data" \
KMDICE_START "Start $CHAIN" \
WALLET "Wallet function for $CHAIN" \
FAUCET "Faucet functions for $CHAIN" \
REWARDS "Rewards functions for $CHAIN" \
TOKENS "Use the tokenization system on this blockchain" \
STOP "Stop $CHAIN" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	KMDICE_DELETE) delete_blockchain_data_kmdice;;
	KMDICE_START) start_kmdice;;
	STOP) stop;;
	GETINFO) getinfo;;
	LISTUNSPENT) listunspent;;
	GETPEERINFO) getpeerinfo;;	
	GETMININGINFO) getmininginfo;;
	WALLET) kmdice_wallet;;
	TOKENS) kmdice_tokens;;
  FAUCET) kmdice_faucet;;
  REWARDS) kmdice_rewards;;
	Back) echo "Bye"; break;;
esac
done
}

function kmdice_wallet {
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

function kmdice_tokens {
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


function kmdice_faucet {
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

function kmdice_rewards {
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

function start_kmdice {
        CHAIN="KMDICE"
        source ~/.devwallet
        echo "Starting $CHAIN..."
        sleep 2
	if ! ps aux | grep -i "=$CHAIN " | grep -v grep ; then
                echo "Starting $CHAIN... "
                if [ "$DEVPUBKEY" == "" ]; then
                        echo "Starting $CHAIN with no pubkey set"
                        hide_output komodod -ac_name=KMDICE -ac_supply=10500000 -ac_reward=2500000000 -ac_halving=210000 -ac_cc=2 -addressindex=1 -spentindex=1 -addnode=144.76.217.232 &
                        sleep 3
                else
                        echo "Starting $CHAIN with pubkey $DEVPUBKEY"
                        hide_output komodod -pubkey=$DEVPUBKEY -ac_name=KMDICE -ac_supply=10500000 -ac_reward=2500000000 -ac_halving=210000 -ac_cc=2 -addressindex=1 -spentindex=1 -addnode=144.76.217.232 &
                        sleep 3
                fi
        else
                echo "Not starting $CHAIN - already started"
                sleep 4
        fi
}

