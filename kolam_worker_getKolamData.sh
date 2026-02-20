#!/bin/sh

#
# 2026-02-13 Feb.Fri 11:43:47 Worker script to make eth_call to KOLAM to get information on a Kolam by TokenId
#

# USAGE:
# kolam_worker_getKolamData.sh 98328815286472208108725841938299315763074621854053660676912324279791346200393

# Contract name:          ? Kolam implementation?
# Contract address:       0xbFcdEB33cf38eB8b0b5A201b6c4b5b1d8329b5D3
# Implementation address: 

# Call function:          getKolamData()
# function hash:          0x7a6eddfe

# Check if .env file exists
if [ -f .env ]; then
    . .env  # Load the .env file (can also use: source .env)
else
    echo "Error: .env file not found" >&2
    exit 1
fi

# Check if ALCHEMY_API_KEY is set
if [ -z "$ALCHEMY_API_KEY" ]; then
    echo "Error: ALCHEMY_API_KEY is not set" >&2
    exit 1
fi

if [ $# -ne 1 ]; then
    echo "usage: TokenID"
    exit 1
fi

kTokenId=$1



# OUTPUT LOOKS LIKE THIS:
### Lisas-MacBook-Pro-2:otom lisadaly$ ./tempmineables.alchemy.sh 
### [{"jsonrpc":"2.0","id":1,"result":"0x0000000000000000000000000000000000000000000000000000000000000015"}
### ,{"jsonrpc":"2.0","id":2,"result":"0x000000000000000000000000000000000000000000000000000000000000001c"}
### ...

curl --request POST  \
     --url https://shape-mainnet.g.alchemy.com/v2/$ALCHEMY_API_KEY  \
     --header 'accept: application/json'  \
     --header 'content-type: application/json' \
     --data ' [ { "id":  1, "jsonrpc": "2.0", "method": "eth_call", "params": [ { "from": "0x620051B8553a724b742ae6ae9cC3585d29F49848", "to":   "0xbFcdEB33cf38eB8b0b5A201b6c4b5b1d8329b5D3", "data": "0x7a6eddfe'$kTokenId'" }, "latest" ] }  ] '
# example calldata copied from shapescan                                                                                                                                                0x7a6eddfed964232080ffa0a2a811860141895352cc3c8bced00293ad640b6b5759c72f49

