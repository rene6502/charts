#!/bin/sh
echo "INFO: script $(basename "$0")"

if [ -z "$VAULT_USERNAME" ]; then
  echo "INFO: VAULT_USERNAME not set"
  exit 0
fi

if [ -z "$VAULT_PASSWORD" ]; then
  echo "INFO: VAULT_PASSWORD not set"
  exit 0
fi

export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=$(cat /vault/data/VAULT_TOKEN)

POLICY=$(cat <<- EOF
path "*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
EOF
)

OUTPUT=$(vault policy list)
if echo "$OUTPUT" | grep -q "^admin"; then
  echo "INFO: exists - policy admin"
else
  echo "INFO: create - policy admin"
  echo "$POLICY" | vault policy write admin -
fi

OUTPUT=$(vault auth list)
if echo "$OUTPUT" | grep -q "^userpass"; then
  echo "INFO: exists - auth method userpass"
else
  echo "INFO: create - auth method userpass"
  vault auth enable -path=userpass userpass
fi

OUTPUT=$(vault list auth/userpass/users)
if echo "$OUTPUT" | grep -q "^$VAULT_USERNAME"; then
  echo "INFO: exists - user $VAULT_USERNAME"
else
  echo "INFO: create - user $VAULT_USERNAME"
  vault write auth/userpass/users/$VAULT_USERNAME password=$VAULT_PASSWORD policies=admin
fi  
