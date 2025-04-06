# tls-secret

Helm chart for creating a ExternalSecret for an Ingress TLS secret.

## Install
```bash
helm upgrade example-tls tls-secret --repo https://rene6502.github.io/charts \
  --atomic --install --namespace default \
  --set name=example-tls
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| name | string | `"default"` |  |
| store.name | string | `"vault-backend"` |  |
| store.kind | string | `"ClusterSecretStore"` |  |
| source.key | string | `"ingress-tls"` |  |
| source.cert | string | `"cert"` |  |
| source.privkey | string | `"privkey"` |  |
