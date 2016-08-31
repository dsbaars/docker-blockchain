Docker Blockchain Images
========================

[![Build Status](https://travis-ci.org/dsbaars/docker-blockchain.svg?branch=master)](https://travis-ci.org/dsbaars/docker-blockchain)

__NOTE__: Not everything in this readme is relevant when you read this on Docker Hub.
The builds are performed automatically and multiple images exist in this repository.
Every build overwrites the specific README for that image, so that's why this one contains the information for all of them.
The sources of this image and others can be found on [https://github.com/dsbaars/docker-blockchain](https://github.com/dsbaars/docker-blockchain)

- bitcoin-segnet-src: bitcoind segnet4
- go-ethereum: multiple go-ethereum variants

Custom go-ethereum images
-------------------------

Custom [go-ethereum](https://github.com/ethereum/go-ethereum/) images, which use gosu.

[dsbaars/go-ethereum](https://hub.docker.com/r/dsbaars/go-ethereum): geth with gosu (1.9)
  - `alpine-stable`: built from git on alpine 3.4
  - `debian-source`: built from git on debian wheezy
  - `debian-source-develop`: built from git on debian wheezy (branch develop)
  - `debian-source-swarm`: built from git on debian wheezy (branch swarm)
  - `ubuntu-devppa`: install from dev PPA on ubuntu xenial


[dsbaars/go-ethereum-privatechain](https://hub.docker.com/r/dsbaars/go-ethereum-privatechain/): geth with gosu for private ethereum chains
  - `:develop`: extended from `debian-source-develop`
  - `:stable`: extended from `debian-source`

```yaml
version: '2'

services:
  customgeth:
    image: dsbaars/go-ethereum-privatechain:develop
    volumes:
      - /opt/customchain/data:/opt/geth
      - /opt/customchain/ethash:/home/geth/.ethereum
    ports:
      - 30303:30303
      - 8545:8545
      - 8546:8546
    environment:
      - NODE_NAME=private_node
      - NETWORK_ID=12345
      - GETH_USER=1001
```
