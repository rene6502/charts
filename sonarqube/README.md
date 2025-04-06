# sonarqube

Helm chart for https://hub.docker.com/_/sonarqube

## Install
```bash
helm upgrade sonarqube sonarqube --repo https://rene6502.github.io/charts \
  --atomic --install --namespace default \
  --set ingress.enabled=true \
  --set ingress.hostname=sonarqube.example.com \
  --set ingress.annotations."cert-manager\.io/cluster-issuer"=platform-issuer \
  --set ingress.tls=true \
  --set persistence.enabled=true
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"sonarqube"` |  |
| image.tag | string | `"9-community"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` | Registry secret names as an array |
| nameOverride | string | `""` | String to partially override common.fullname |
| fullnameOverride | string | `""` | String to fully override common.fullname |
| namespaceOverride | string | `.Release.Namespace` | Override the namespace |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `9000` |  |
| ingress.enabled | bool | `false` | Enable ingress record generation |
| ingress.className | string | `""` |  |
| ingress.hostname | string | `"sonarqube.local"` | Default host for the ingress record (evaluated as template) |
| ingress.annotations | object | `{}` |  |
| ingress.tls | bool | `false` | Enable TLS configuration for the host defined at ingress.hostname parameter |
| ingress.secretName | string | `""` | Optional custom TLS secret name. If not set, defaults to "<hostname>-tls". |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.size | string | `"10Gi"` |  |
| persistence.storageClass | string | `""` |  |
