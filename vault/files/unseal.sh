#!/bin/sh
echo "INFO: script $(basename "$0")"
export VAULT_ADDR=http://localhost:8200

WAIT=0
INITIALIZED=$(vault status | grep Initialized | awk '{ print $2 }')
while [ "$INITIALIZED" != "true" ] && [ "$INITIALIZED" != "false" ]; do
  echo "INFO: waiting for vault (${WAIT}s) ..."
  sleep 1
  WAIT=$((WAIT + 1))
  INITIALIZED=$(vault status | grep Initialized | awk '{ print $2 }')
done

echo "INFO: INITIALIZED=$INITIALIZED"
if [ "$INITIALIZED" = "false" ]; then
  echo "INFO: initialize vault"
  vault operator init -key-shares=1 -key-threshold=1 > /tmp/init.out
  echo "INFO: save vault key and token to data volume"
  VAULT_KEY=$(grep "Unseal Key 1" /tmp/init.out | awk -F': ' '{print $2}')
  VAULT_TOKEN=$(grep "Initial Root Token" /tmp/init.out | awk -F': ' '{print $2}')
  echo -n "$VAULT_KEY" > /vault/data/VAULT_KEY
  echo -n "$VAULT_TOKEN" > /vault/data/VAULT_TOKEN
fi

INITIALIZED=$(vault status | grep Initialized | awk '{ print $2 }')
if [ "$INITIALIZED" = "false" ]; then
  echo "ERROR: initialize failed"
  exit 1
fi

SEALED=$(vault status | grep Sealed | awk '{ print $2 }')
echo "INFO: SEALED=$SEALED"
if [ "$SEALED" = "true" ]; then
  echo "INFO: unseal vault"
  VAULT_KEY=$(cat /vault/data/VAULT_KEY)
  vault operator unseal "$VAULT_KEY"
fi

SEALED=$(vault status | grep Sealed | awk '{ print $2 }')
if [ "$SEALED" = "true" ]; then
  echo "ERROR: vault unseal failed"
  exit 1
fi

echo "INFO: vault unsealed"
