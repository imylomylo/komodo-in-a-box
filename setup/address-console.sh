
function submenu_address {
while true
do
echo "Address functions for $CHAIN blockchain:"
### display main menu ###
dialog --clear  --help-button --backtitle "Cakeshop Console using pubkey $DEVPUBKEY" \
--title "[ S T A R T E R - K I T - A D D R E S S - C O N S O L E ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 25 120 14 \
GETUTXOS "getaddressutxos - get address utxos for $DEVADDRESS on $CHAIN" \
Back "Back" 2>"${INPUT}"

menuitem=$(<"${INPUT}")

# make decsion
case $menuitem in
  GETUTXOS) getaddressutxos;;
  Back) echo "Back"; break;;
esac
done
}
