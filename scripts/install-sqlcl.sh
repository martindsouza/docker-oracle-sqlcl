#!/bin/ash

mkdir $SQLCL_DIR

cd /tmp

unzip sqlcl*.zip
# Cleanup
rm -rf sqlcl*.zip

# The unzip will create a folder like: sqlcl
cd sqlcl*

# Rename 2sql binary if provided
if [ ! -z "$SQLCL_BIN_NAME" ]; then
  mv bin/sql bin/$SQLCL_BIN_NAME
fi

mv * $SQLCL_DIR

