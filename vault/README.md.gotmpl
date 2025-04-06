# vault

Umbrella helm chart for https://github.com/hashicorp/vault
>Warning: very opinionated!
- Unseal with sidecar which stores unseal key and root token in persistent volume
- Optionally creates admin user

## Install
```bash
helm upgrade vault vault --repo https://rene6502.github.io/charts \
  --atomic --install --create-namespace --namespace vault \
  --set vault.server.enabled=true \
  --set vault.server.dataStorage.enabled=true \
  --set vault.server.ingress.enabled=true \
  --set vault.server.ingress.hosts[0].host=vault.example.com \
  --set vault.server.ingress.annotations."cert-manager\.io/cluster-issuer"=platform-issuer \
  --set vault.server.ingress.tls[0].hosts[0]=vault.example.com \
  --set vault.server.ingress.tls[0].secretName=vault-tls \
  --set vault.ui.enabled=true \
  --set vault.injector.enabled=false \
  --set adminUser.username=admin \
  --set adminUser.password=********
```

## Get root token
```bash
kubectl exec -it vault-0 -c unseal --namespace platform -- /bin/sh -c "cat /vault/data/VAULT_TOKEN"
```

## Values

| Key                | Type   | Default | Description    |
| ------------------ | ------ | ------- | -------------- |
| adminUser.username | string | `""`    | Admin username |
| adminUser.password | string | `""`    | Admin password |
