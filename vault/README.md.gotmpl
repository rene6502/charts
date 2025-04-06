# vault

Umbrella helm chart for https://github.com/hashicorp/vault
- Unseal with sidecar which stores unseal key and root token in persistent volume
- Optionally creates admin user
- Optionally creates kubernetes auth method for External Secrets Operator

## Install
```bash
kubectl create secret generic vault-admin --dry-run=client --namespace platform -o yaml \
  --from-literal=username=$VAULT_USERNAME \
  --from-literal=password=$VAULT_PASSWORD \
  | kubectl apply -f -

helm upgrade vault vault --repo https://rene6502.github.io/charts \
  --atomic --install --create-namespace --namespace vault \
  --set vault.server.enabled=true \
  --set vault.server.dataStorage.enabled=true \
  --set vault.server.ingress.enabled=true \
  --set "vault.server.ingress.hosts[0].host=vault.example.com" \
  --set vault.server.ingress.annotations."cert-manager\.io/cluster-issuer"=platform-issuer \
  --set "vault.server.ingress.tls[0].hosts[0]=vault.example.com" \
  --set "vault.server.ingress.tls[0].secretName=vault-tls" \
  --set vault.ui.enabled=true \
  --set vault.injector.enabled=false \
  --set eso.enabled=true
```

## Get root token
```bash
kubectl exec -it vault-0 -c unseal --namespace platform -- /bin/sh -c "cat /vault/data/VAULT_TOKEN"
```

## Create admin user
Create a secret with name `vault-admin` and the fields `username` and `password` before installing the chart.

## Values
| Key         | Type    | Default | Description                                  |
| ----------- | ------- | ------- | -------------------------------------------- |
| eso.enabled | boolean | `false` | enable External Secrets Operator auth method |
