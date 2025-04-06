# vaultwarden

Helm chart for https://github.com/BytemarkHosting/docker-vaultwarden

## Install
```bash
helm upgrade vaultwarden vaultwarden --repo https://rene6502.github.io/charts \
  --atomic --install --namespace default \
  --set ingress.enabled=true \
  --set ingress.hostname=vaultwarden.example.com \
  --set ingress.annotations."cert-manager\.io/cluster-issuer"=platform-issuer \
  --set ingress.tls=true
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"vaultwarden/server"` |  |
| image.tag | string | `"1.33.2"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` | Registry secret names as an array |
| nameOverride | string | `""` | String to partially override common.fullname |
| fullnameOverride | string | `""` | String to fully override common.fullname |
| namespaceOverride | string | `.Release.Namespace` | Override the namespace |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `80` |  |
| ingress.enabled | bool | `false` | Enable ingress record generation |
| ingress.className | string | `""` |  |
| ingress.hostname | string | `"vaultwarden.local"` | Default host for the ingress record (evaluated as template) |
| ingress.annotations | object | `{}` |  |
| ingress.tls | bool | `false` | Enable TLS configuration for the host defined at ingress.hostname parameter |
| ingress.secretName | string | `""` | Optional custom TLS secret name. If not set, defaults to "<hostname>-tls". |
| persistence.existingClaim | string | `""` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.size | string | `"10Gi"` |  |
| persistence.storageClass | string | `""` |  |
| auth.secretName | string | `"vaultwarden"` |  |
| auth.tokenKey | string | `"password"` |  |
| env.SIGNUPS_ALLOWED | bool | `false` |  |
| env.INVITATIONS_ALLOWED | bool | `false` |  |
