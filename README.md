# docker-sqlcl

Oracle SQLcl docker container

<!-- TOC depthFrom:2 -->autoauto- [Install](#install)auto- [Run](#run)auto- [Volumes](#volumes)autoauto<!-- /TOC -->

## Install

[Download Oracle SQLcl](http://www.oracle.com/technetwork/developer-tools/sqlcl/downloads/index.html)

```bash
git clone https://github.com/martindsouza/docker-sqlcl

cd docker-sqlcl

# *** Copy the downloaded sqlcl.zip file into this directory ***

docker build -t martindsouza/docker-sqlcl:19.2.1 -t martindsouza/docker-sqlcl:latest .
```

## Run

The following is focused on MacOS / Linux users.

- Create alias

```bash
alias sqlcl="docker run -it --rm \
  --network="host" \
  -v `pwd`:/sqlcl \
  -v ~/Documents/Oracle/:/oracle \
  martindsouza/docker-sqlcl:latest"
```

To persist add the `alias` command to `~/.bash_profile`. If using [zsh](https://ohmyz.sh/) then use `~/.zshrc`.

A few things about the parameters:


Parameter | Description
---------|----------
`--network="host"` |  This will mimic the current host networking (with the goal of acting like a binary)
`-v ``pwd``:/sqlcl` | This will set the current directory that `sqlcl` is run to the one that the container is looking at
`-v ~/Documents/Oracle/:/oracle` | _(optional)_ for `login.sql` to load startup scripts

- Then to run execute: `sqlcl <connection string>`


### `login.sql

TODO how to reference a login.sql

## Volumes

Volume | Description
---------|----------
`/sqlcl` | This is the folder that SQLcl will reference
`/oracle` | This is the folder that you will put `login.sql` and can load `alias` from here. Ex: `alias load /oracle/sqlcl-alias.xml`. Note the reference is to the container's local `/oracle` folder and not your full path. 