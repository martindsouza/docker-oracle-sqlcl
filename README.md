# Oracle SQLcl Docker Image

- [Install](#install)
- [Run](#run)
- [Volumes](#volumes)
- [`/oracle/` Folder](#oracle-folder)
  - [`login.sql`](#loginsql)
  - [Aliases](#aliases)

## Install

[Download Oracle SQLcl](http://www.oracle.com/technetwork/developer-tools/sqlcl/downloads/index.html)

```bash
git clone https://github.com/martindsouza/docker-oracle-sqlcl

cd docker-oracle-sqlcl

# *** Copy the downloaded sqlcl.zip file into this directory ***

docker build -t martindsouza/docker-oracle-sqlcl:19.2.1 -t martindsouza/docker-oracle-sqlcl:latest .
```

## Run

The following is focused on MacOS / Linux users.

- Create alias

```bash
alias sqlcl="docker run -it --rm \
  --network="host" \
  -v `pwd`:/sqlcl \
  -v ~/Documents/Oracle/:/oracle \
  martindsouza/docker-oracle-sqlcl:latest"
```

To persist add the `alias` command to `~/.bash_profile`. If using [zsh](https://ohmyz.sh/) then add to `~/.zshrc`.

A few things about the parameters:


Parameter | Description
---------|----------
`--network="host"` |  This will mimic the current host networking (with the goal of acting like a binary)
`-v ``pwd``:/sqlcl` | This will set the current directory that `sqlcl` is run to the one that the container is looking at
`-v ~/Documents/Oracle/:/oracle` | _(optional)_ for `login.sql` to load startup scripts

- To execute: `sqlcl <connection string>`



## Volumes

Volume | Description
---------|----------
`/sqlcl` | This is the folder that SQLcl will reference
`/oracle` | This is the folder that you will put `login.sql` and can load `alias` from here. Ex: `alias load /oracle/sqlcl-alias.xml`. Note the reference is to the container's local `/oracle` folder and not your full path. 


## `/oracle/` Folder

The container has a mapped volume called `/oracle/`. In it you can add files for SQLcl to reference. The listings below cover each type of file.

### `login.sql`

`login.sql` allows you to store commands that you'd like SQLcl to run on init. An example is:

```sql
-- Add a reminder where to find this file on your laptop
-- Again in the Container it's mapped to /oracle/login.sql
prompt Settings in ~/Documents/Oracle/login.sql
prompt Remember this is in a Container and all referenced files must be from Containers point of view

set serveroutput on
set sqlformat ansiconsole

-- Alias will be covered below
prompt To manage aliases: ~/Documents/Oracle/sqlcl-alias.xml
alias load /oracle/sqlcl-alias.xml
```

### Aliases

SQLcl allow for aliases (not to be confused with Bash based aliases). Theres' lots of great examples on how to use them and one of the better ones is found [here](https://mikesmithers.wordpress.com/2019/06/25/sqlcl-alias-because-you-cant-remember-everything/).

To load an alias see the previous `login.sql` file example. You should store aliases in the same folder as `login.sql` as it is all mapped to the `/oracle/` folder in the Container