#!/bin/bash

echo "Starting IPFS Daemon, then sleeping for 10 seconds"
ipfs daemon & 
sleep 10

echo "Pinning Wanderers metadata - takes ~30 seconds"
ipfs pin add QmNnWrwfAbsnWvyTgGpaYLdh1oAkBR5B74MjwZh8stTL97 --progress

echo "Pinning Wanderers MP4s - this is likely to take 2+ hours!"
ipfs pin add QmWeXmth66wkCT5RYeBG9p1mnHgzAkTxoAtBdPy3CzE6o8 --progress
