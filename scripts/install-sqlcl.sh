#!/bin/bash

mkdir $SQLCL_DIR

cd /tmp

unzip sqlcl*.zip
# Cleanup
rm -rf sqlcl*.zip

# The unzip will create a folder like: sqlcl
cd sqlcl

# Rename sql binary if provided
# Not required anymore since binary has now been renamed to sqlcl
if [ ! -z "$SQLCL_BIN_NAME" ]; then
  mv bin/sql bin/$SQLCL_BIN_NAME
fi

mv * $SQLCL_DIR

