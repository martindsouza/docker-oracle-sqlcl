# docker-sqlcl

Oracle SQLcl docker container

<!-- TOC depthFrom:2 -->autoauto- [Install](#install)auto- [Run](#run)auto- [Volumes](#volumes)autoauto<!-- /TOC -->

## Install

[Download Oracle SQLcl](http://www.oracle.com/technetwork/developer-tools/sqlcl/downloads/index.html)

```bash
git clone https://github.com/martindsouza/docker-sqlcl

cd docker-sqlcl

# *** Copy the downloaded sqlcl.zip file into this directory ***

docker build -t martindsouza/docker-sqlcl:18.1.0 -t martindsouza/docker-sqlcl:latest.
```

## Run

The following is focused on MacOS / Linux users.

- Create alias

```bash
alias sqlcl="docker run -it --rm \
  --network="host" \
  -v `pwd`:/sqlcl \
  martindsouza/docker-sqlcl:latest"
```

A few things about the parameters:


Parameter | Description
---------|----------
`--network="host"` |  This will mimic the current host networking (with the goal of acting like a binary)
`-v `pwd`:/sqlcl` | This will set the current directory that `sqlcl` is run to the one that the container is looking at

- Then to run execute: `sqlcl <connection string>`

## Volumes

Volume | Description
---------|----------
`/sqlcl` | This is the folder that SQLcl will 