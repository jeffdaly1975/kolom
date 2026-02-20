#!/bin/sh

#
# 2026-02-14 Feb.Sat 11:04:23 Worker script to make eth_call to KOLAM to get information on a Kolam by TokenId
#

# USAGE:
# kolam_worker_tokenURI.sh 98328815286472208108725841938299315763074621854053660676912324279791346200393

# Contract name:          ? Kolam implementation?
# Contract address:       0xbFcdEB33cf38eB8b0b5A201b6c4b5b1d8329b5D3
# Implementation address: 

# Call function:          tokenURI()
# function hash:          0xc87b56dd

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



curl --request POST  \
     --url https://shape-mainnet.g.alchemy.com/v2/$ALCHEMY_API_KEY  \
     --header 'accept: application/json'  \
     --header 'content-type: application/json' \
     --data ' [ { "id":  1, "jsonrpc": "2.0", "method": "eth_call", "params": [ { "from": "0x620051B8553a724b742ae6ae9cC3585d29F49848", "to":   "0xbFcdEB33cf38eB8b0b5A201b6c4b5b1d8329b5D3", "data": "0xc87b56dd'$kTokenId'" }, "latest" ] }  ] '
# example calldata copied from shapescan                                                                                                                                                0x7a6eddfed964232080ffa0a2a811860141895352cc3c8bced00293ad640b6b5759c72f49

