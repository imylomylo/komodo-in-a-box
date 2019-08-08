function submenu_chain {
while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Cakeshop Console" \
--title "[ B L O C K C H A I N - C O N S O L E ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 25 60 14 \
GETINFO "Get Info - $CHAIN getinfo method" \
LISTUNSPENT "List Unspent UTXO - $CHAIN listunspent" \
GETPEERINFO "Get Network Info - $CHAIN getpeerinfo" \
GETMININGINFO "Get Mining Info - $CHAIN getmininginfo" \
WALLET "Wallet function for $CHAIN" \
FAUCET "Faucet functions for $CHAIN" \
REWARDS "Rewards functions for $CHAIN" \
TOKENS "Use the tokenization system on this blockchain" \
CHAINSTOP "Stop $CHAIN" \
CHAINDELETE "Experimental - Delete blockchain data" \
CHAINSTART "Start $CHAIN" \
Back "Back a menu" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	CHAINDELETE) delete_blockchain_data_chain;;
	CHAINSTART) start_chain;;
	CHAINSTOP) stop_chain;;
	GETINFO) getinfo;;
	LISTUNSPENT) listunspent;;
	GETPEERINFO) getpeerinfo;;	
	GETMININGINFO) getmininginfo;;
	WALLET) chain_wallet;;
	TOKENS) chain_tokens;;
	FAUCET) chain_faucet;;
	REWARDS) chain_rewards;;
	Back) echo "Bye"; break;;
esac
done
}

function chain_wallet {
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

function chain_address {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source $HOME/.devwallet
    submenu_address
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function chain_blockchain {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source $HOME/.devwallet
    submenu_blockchain
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function chain_tokens {
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

function chain_oracles {
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

function chain_faucet {
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

function chain_rewards {
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

function stop_chain {
  KIABMETHOD="listunspent"
  if ps aux | grep -i $CHAIN ; then
    source ~/.komodo/$CHAIN/$CHAIN.conf
    source $HOME/.devwallet
    stop
  else
    echo "Nothing to query - start $CHAIN..."
    sleep 1
  fi
}

function start_chain {
        source ~/.devwallet
	pubkey=$DEVPUBKEY
        echo "Starting $CHAIN..."
        sleep 2
        if ! ps aux | grep -i "=$CHAIN " | grep -v grep ; then
                echo "Starting $CHAIN... "
                if [ "$DEVPUBKEY" == "" ]; then
                        echo "Starting $CHAIN with no pubkey set"
			cmd=$(grep $CHAIN ~/komodo/src/assetchains.old | sed  's/^\.\///')
			hide_output eval $cmd
                        sleep 3
                else
                        echo "Starting $CHAIN with pubkey $DEVPUBKEY"
			cmd=$(grep $CHAIN ~/komodo/src/assetchains.old | sed  's/^\.\///')
			echo $cmd
			sleep 2
			hide_output eval $cmd
                        sleep 3
                fi
        else
                echo "Not starting $CHAIN - already started"
                sleep 4
        fi
}

