#!/bin/ash
# #9: Unset TNS_ADMIN as causing issue if defined but has no value
if [ -z "$TNS_ADMIN" ]; then       
  echo "warning: \$TNS_ADMIN is empty, unsetting it"
  unset TNS_ADMIN
else
  echo "TNS_ADMIN: $TNS_ADMIN"
fi

# Call SQLcl with all the parameters used when calling sqlcl
sqlcl "$@"