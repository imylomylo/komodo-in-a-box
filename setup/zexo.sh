function submenu_zexo {
while true
do
CHAIN=ZEXO

### display main menu ###
dialog --clear  --help-button --backtitle "Cakeshop Console" \
--title "[ Z E X O  - C O N S O L E ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 25 60 14 \
GETINFO "Get Info - $CHAIN getinfo method" \
LISTUNSPENT "List Unspent UTXO - $CHAIN listunspent" \
GETPEERINFO "Get Network Info - $CHAIN getpeerinfo" \
ZEXO_GETMININGINFO "Get Mining Info - $CHAIN getmininginfo" \
ZEXO_DELETE "Experimental - Delete blockchain data" \
ZEXO_START "Start $CHAIN" \
WALLET "Wallet function for $CHAIN" \
FAUCET "Faucet functions for $CHAIN" \
REWARDS "Rewards functions for $CHAIN" \
TOKENS "Use the tokenization system on this blockchain" \
STOP "Stop $CHAIN" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	ZEXO_DELETE) delete_blockchain_data_zexo;;
	ZEXO_START) start_zexo;;
	STOP) stop;;
	GETINFO) getinfo;;
	LISTUNSPENT) listunspent;;
	GETPEERINFO) getpeerinfo;;	
	GETMININGINFO) getmininginfo;;
	WALLET) zexo_wallet;;
	TOKENS) zexo_tokens;;
  FAUCET) zexo_faucet;;
  REWARDS) zexo_rewards;;
	Back) echo "Bye"; break;;
esac
done
}

function zexo_wallet {
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

function zexo_tokens {
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


function zexo_faucet {
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

function zexo_rewards {
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

function start_zexo {
        CHAIN="ZEXO"
        source ~/.devwallet
        echo "Starting $CHAIN..."
        sleep 2
        if ! ps aux | grep -i "=$CHAIN " | grep -v grep ; then
                echo "Starting $CHAIN... "
                if [ "$DEVPUBKEY" == "" ]; then
                        echo "Starting $CHAIN with no pubkey set"
			hide_output komodod -pubkey=$DEVPUBKEY -ac_name=ZEXO -ac_supply=100000000 -ac_reward=1478310502 -ac_halving=525600 -ac_cc=42 -ac_ccenable=236 -ac_perc=77700 -ac_staked=93 -ac_pubkey=02713bd85e054db923694b6b7a85306264edf4d6bd6d331814f2b40af444b3ebbc -ac_public=1 -addnode=80.240.17.222 &
                        sleep 3
                else
                        echo "Starting $CHAIN with pubkey $DEVPUBKEY"
			hide_output komodod -pubkey=$DEVPUBKEY -ac_name=ZEXO -ac_supply=100000000 -ac_reward=1478310502 -ac_halving=525600 -ac_cc=42 -ac_ccenable=236 -ac_perc=77700 -ac_staked=93 -ac_pubkey=02713bd85e054db923694b6b7a85306264edf4d6bd6d331814f2b40af444b3ebbc -ac_public=1 -addnode=80.240.17.222 &
                        sleep 3
                fi
        else
                echo "Not starting $CHAIN - already started"
                sleep 4
        fi
}

