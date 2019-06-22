
function submenu_blockchain {
while true
do
echo "Blockchain functions for $CHAIN blockchain:"
### display main menu ###
dialog --clear  --help-button --backtitle "Cakeshop Console using pubkey $DEVPUBKEY" \
--title "[ C A K E S H O P - B L O C K C H A I N - C O N S O L E ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 25 120 14 \
GETRAWMEMPOOL "getrawmempool - get mempool txs on $CHAIN" \
COINSUPPLY "coinsupply - get supply of $CHAIN" \
GETBLOCKCHAININFO "getblockchaininfo - get the state of $CHAIN" \
GETBLOCKBYHEIGHT "getblock - input a height to get the block from $CHAIN" \
GETBLOCKBYHASH "getblock - input a hash of a block to get it from $CHAIN" \
Back "Back" 2>"${INPUT}"

menuitem=$(<"${INPUT}")

# make decsion
case $menuitem in
  GETRAWMEMPOOL) getrawmempool;;
  COINSUPPLY) coinsupply;;
  GETBLOCKCHAININFO) getblockchaininfo;;
  GETBLOCKBYHEIGHT) submenu_getblockbyheight;;
  GETBLOCKBYHASH) submenu_getblockbyhash;;
  Back) echo "Back"; break;;
esac
done
}

function submenu_getblockbyheight {
    input_box "What height block to get" "Block number?" "1" HEIGHT
    getblockbyheight
}

function submenu_getblockbyhash {
    input_box "What blockhash to get" "Block hash?" "XXX" BLOCKHASH
    getblockbyhash
}