# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

all: clean remove install update solc build dappbuild

# Install proper solc version.
solc:; nix-env -f https://github.com/dapphub/dapptools/archive/master.tar.gz -iA solc-static-versions.solc_0_8_11

# Clean the repo
clean  :; forge clean

# Remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

# Install the Modules
install :; 
	forge install dapphub/ds-test 
	forge install OpenZeppelin/openzeppelin-contracts

# Update Dependencies
update:; forge update

# Builds
build  :; forge clean && forge build --optimize --optimize-runs 1000000
dappbuild :; dapp build