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
--title "[ C A K E S H O P - C O N S O L E ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 25 120 14 \
BSK "Blockchain Starter Kit - seed node or mining node" \
BSK_1_HOST "Blockchain Starer Kit - single node seed & mining" \
KMD "(experimental) KMD - the Komodo ecosystem currency" \
BTC "(todo) - Bitcoin & other blockchains" \
KMDICE "KMDICE - the mineable provably fair chain" \
RICK "RICK - a test chain" \
MORTY "MORTY - a test chain" \
MM2 "(q3 2019) - Marketmaker 2 integration" \
PIRATE "(experimental) PIRATE - ARRR an enforced privary chain" \
ZEXO "ZEXO - Zaddex Hybrid DEX Exchange" \
KSB "KSB - Ecosystem stable coin from O-Crypto-Union" \
OUR "OUR - O-Crypto-Union" \
PGT "PGT - Pungo Token - the services company paying back to the community" \
OOT "OOT - Utrum Crypto Review Platform" \
RFOX "RedFOX Labs - The blockchain startup incubation project" \
MAINT "Maintenance menu" \
Exit "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion
case $menuitem in
	BSK_1_HOST) bsk1n;;
	BSK) bsk;;
	KMD) submenu_kmd;;
	KMDICE) CHAIN=KMDICE;submenu_chain;;
	RICK) CHAIN=RICK;submenu_chain;;
	MORTY) CHAIN=MORTY;submenu_chain;;
	ZEXO) CHAIN=ZEXO;submenu_chain;;
	KSB) CHAIN=KSB;submenu_chain;;
	OUR) CHAIN=OUR;submenu_chain;;
	PGT) CHAIN=PGT;submenu_chain;;
	OOT) CHAIN=OOT;submenu_chain;;
	RFOX) CHAIN=RFOX;submenu_chain;;
	PIRATE) submenu_pirate;;
	MAINT) submenu_maint;;
	Exit) echo "Bye"; break;;
esac
done
