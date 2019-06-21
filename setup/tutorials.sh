cd $INSTALL_DIR
if [ ! -f ~/.devwallet ]; then
  setup_devwallet
fi
if [ ! -f ~/.dev2wallet ]; then
  setup_dev2wallet
fi
source setup/wallet-console.sh
#source setup/kmdice.sh
source setup/rick.sh
source setup/morty.sh
#source setup/zexo.sh
#source setup/kmd.sh
#source setup/ksb.sh
#source setup/pirate.sh
source setup/maint.sh
#source setup/beer.sh
#source setup/pizza.sh
source setup/tokens-console.sh
source setup/oracles-console.sh
source setup/faucet-console.sh
source setup/rewards-console.sh

while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Komodo Tutorials Console" \
--title "[ K O M O D O - T U T O R I A L S ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 25 120 14 \
TUTORIALS "Blockchain Starter Kit & Guided Tutorials for Komodo Smart Chains" \
RICK "RICK - a test chain" \
MORTY "MORTY - a test chain" \
MAINT "Maintenance menu" \
Exit "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	TUTORIALS) tutorials;;
	RICK) submenu_rick;;
	MORTY) submenu_morty;;
	MAINT) submenu_maint;;
	Exit) echo "Bye"; break;;
esac
done
