# #!/usr/bin/env bash

# set -e

# if [ "$1" = "dirty" ]; then
#   echo "Dirty mode: not removing previous build files."
# else
#   rm -rf dist
# fi

# babel src --out-dir ./dist/src
# cp package.json dist
# mkdir -p dist/contracts/abis
# cp -R contracts/abis/ dist/contracts/abis
# cp -R contracts/addresses/ dist/contracts/addresses
# cp src/contract-info.json dist/src/contract-info.json
# cp src/testnet-addresses.json dist/src/testnet-addresses.json
# babel contracts --out-dir ./dist/contracts

###

set -e

if [ "$1" = "dirty" ]; then
  echo "Dirty mode: not removing previous build files."
else
  rm -rf dist
fi

babel -q contracts --out-dir ./dist/contracts
#babel -q contracts/addresses --out-dir ./dist/contracts/addresses
babel -q src --out-dir ./dist/src

copyfiles \
  README.md \
  LICENSE \
  package.json \
  contracts/abis/* \
  src/contract-info.json \
  src/testnet-addresses.json \
  contracts/addresses/* \
  dist
