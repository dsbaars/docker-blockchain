#!/bin/bash
set -e

/usr/local/bin/gosu $GETH_USER /usr/local/bin/geth \
  --nodiscover \
  --networkid $NETWORK_ID \
  --datadir $DATADIR \
  "$@"
