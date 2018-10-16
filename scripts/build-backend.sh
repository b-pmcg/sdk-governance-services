# #!/usr/bin/env bash

set -e

if [ "$1" = "dirty" ]; then
  echo "Dirty mode: not removing previous build files."
else
  rm -rf dist
fi

babel -q contracts --out-dir ./dist/contracts
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
