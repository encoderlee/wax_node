#!/usr/bin/env bash

# Home inside docker
NODEOS_HOME=/root/.local/share/eosio/nodeos

# WAX data folder root on the host running this docker image
HOST_WAX_HOME=`pwd`

if [ -z "$1" ]; then
	docker run -t --sig-proxy=true \
		-v $HOST_WAX_HOME/data:$NODEOS_HOME/data \
		-v $HOST_WAX_HOME/config.ini:$NODEOS_HOME/config/config.ini \
		-v $HOST_WAX_HOME/genesis.json:$NODEOS_HOME/config/genesis.json \
		-p 127.0.0.1:8888:8888 \
		-p 9876:9876 \
		waxteam/production:v2.0.13wax03 \
		nodeos
else
	echo "start from snapshot: $1"
	docker run -t --sig-proxy=true \
		-v $HOST_WAX_HOME/data:$NODEOS_HOME/data \
		-v $HOST_WAX_HOME/config.ini:$NODEOS_HOME/config/config.ini \
		-v $HOST_WAX_HOME/genesis.json:$NODEOS_HOME/config/genesis.json \
		-v $HOST_WAX_HOME/$1:$NODEOS_HOME/$1 \
		-p 127.0.0.1:8888:8888 \
		-p 9876:9876 \
		waxteam/production:v2.0.13wax03 \
		nodeos --snapshot $NODEOS_HOME/$1
fi

