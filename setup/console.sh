cd $INSTALL_DIR
if [ ! -f ~/.devwallet ]; then
  setup_devwallet
fi
if [ ! -f ~/.dev2wallet ]; then
  setup_dev2wallet
fi
source setup/komodo-api/control.sh
source setup/chain.sh
source setup/kmd.sh
source setup/pirate.sh
source setup/maint.sh
source setup/tokens-console.sh
source setup/oracles-console.sh
source setup/faucet-console.sh
source setup/rewards-console.sh
source setup/wallet-console.sh
source setup/address-console.sh
source setup/blockchain-console.sh

while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Cakeshop Console" \
--title "[ S T A R T E R - K I T - C O N S O L E ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 25 120 14 \
BSK_1_HOST "Blockchain Starer Kit - single node seed & mining" \
BSK "Blockchain Starter Kit - seed node or mining node" \
RICK "RICK - a test chain" \
MORTY "MORTY - a test chain" \
MM2 "(q3 2020) - Marketmaker 2 integration" \
MAINT "Maintenance menu" \
Exit "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	BSK_1_HOST) bsk1n;;
	BSK) bsk;;
	RICK) CHAIN=RICK;submenu_chain;;
	MORTY) CHAIN=MORTY;submenu_chain;;
	MAINT) submenu_maint;;
	Exit) echo "Bye"; break;;
esac
done
