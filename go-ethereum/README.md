Custom go-ethereum images
====================================

Custom [go-ethereum](https://github.com/ethereum/go-ethereum/) images, which use gosu.

- `alpine-stable`: built from git on alpine 3.4
- `debian-source`: built from git on debian wheezy
- `debian-source-develop`: built from git on debian wheezy (branch develop)
- `ubuntu-devppa`: install from dev PPA on ubuntu xenial


docker-compose example
---------------------

````Docker
version: '2'

services:
  testnet:
    image: dsbaars/go-ethereum:debian-src-develop
    volumes:
      - /opt/geth:/opt/geth
      - /opt/ethash:/home/geth/.ethereum
    ports:
      - 30303:30303
      - 8545:8545
      - 8546:8546
    command:  --testnet --shh --datadir /opt/geth --fast --ipcdisable --rpc --rpcapi "eth,net,web3" --rpcaddr "0.0.0.0" --wsaddr "0.0.0.0"

````
