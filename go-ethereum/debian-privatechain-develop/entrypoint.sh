#!/bin/bash
set -e

/usr/bin/geth --datadir $DATADIR init $GENISIS_JSON

if [ ! -d "$DATADIR/keystore/$NODE_NAME" ]; then
    if [ ! -z "$WALLET_PASSWORD" ]; then
      WALLET_PASSWORD=`date | md5sum`
      echo 'No existing account found and no password given so I will use $WALLET_PASSWORD'
    fi

    mkdir -p $DATADIR/keystore/$NODE_NAME
    $GETH --datadir $DATADIR --password <(echo -n $WALLET_PASSWORD) account new
fi

/usr/local/bin/gosu $GETH_USER /usr/local/bin/geth \
  --nodiscover \
  --networkid $NETWORK_ID \
  --datadir $DATADIR \
  "$@"
