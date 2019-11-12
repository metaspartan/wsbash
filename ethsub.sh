#!/bin/bash

echo Lets setup a new websocket connection! What network?

read -p 'Ethereum Network (e.g. rinkeby): ' network

echo What is your Infura.io Project ID?

read -p 'Infura.io Project ID: ' projectid

echo What is your Infura.io Project Secret?

read -p 'Infura.io Project Secret: ' projectsecret

echo Installing NodeJS

sudo apt-get install -y nodejs

echo Install wscat

npm install -g wscat

echo Wscat Version
wscat -V

echo Connecting to Infura Websocket and Subscribing to ETH $network Chain with ID $projectid and $projectsecret

wscat -c wss://$network.infura.io/ws/v3/$projectid -x '{"jsonrpc":"2.0", "id": 1, "method": "eth_subscribe", "params": ["newHeads"]}' --auth ":$projectsecret" --wait 999999