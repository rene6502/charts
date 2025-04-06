#!/bin/sh
echo "INFO: script $(basename $0)"

# can use http because this script runs in the vault-unseal sidecar
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=$(cat /vault/data/VAULT_TOKEN)

OUTPUT=$(vault secrets list)
if ! echo "$OUTPUT" | grep -q "^kvv2"; then
  echo "INFO: create - secrets engine kvv2"
  vault secrets enable -path=kvv2 kv-v2
else
  echo "INFO: exists - secrets engine kvv2"
fi      

POLICY=$(cat <<- EOF
path "kvv2/*" {
  capabilities = ["read", "list"]
}
EOF
)

OUTPUT=$(vault policy list)
if echo "$OUTPUT" | grep -q "^kvv2-read$"; then
  echo "INFO: exists - policy kvv2-read"
else
  echo "INFO: create - policy kvv2-read"
  echo "$POLICY" | vault policy write kvv2-read -
fi

OUTPUT=$(vault auth list)
if echo "$OUTPUT" | grep -q "^k8s-eso"; then
  echo "INFO: exists - auth method k8s-eso"
else
  echo "INFO: create - auth method k8s-eso"
  vault auth enable -path=k8s-eso kubernetes
fi

vault read auth/k8s-eso/config > /dev/null 2>&1
if [ "$?" == "0" ]; then
  echo "INFO: exists - config k8s-eso"
else
  echo "INFO: create - config k8s-eso"
  vault write auth/k8s-eso/config \
    kubernetes_host=https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT
fi

vault read auth/k8s-eso/role/secrets-read > /dev/null 2>&1
if [ "$?" == "0" ]; then
  echo "INFO: exists - role secrets-read"
else
  echo "INFO: create - role secrets-read"
  vault write auth/k8s-eso/role/secrets-read \
    bound_service_account_names=default \
    bound_service_account_namespaces="*" \
    policies=kvv2-read \
    ttl=1h
fi
