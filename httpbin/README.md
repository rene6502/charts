# httpbin

Helm chart for https://github.com/mccutchen/go-httpbin

## Install
```bash
helm upgrade httpbin httpbin --repo https://rene6502.github.io/charts \
  --atomic --install --namespace default \
  --set ingress.enabled=true \
  --set ingress.hostname=httpbin.example.com \
  --set ingress.annotations."cert-manager\.io/cluster-issuer"=platform-issuer \
  --set ingress.tls=true
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"mccutchen/go-httpbin"` |  |
| image.tag | float | `2.18` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` | Registry secret names as an array |
| nameOverride | string | `""` | String to partially override common.fullname |
| fullnameOverride | string | `""` | String to fully override common.fullname |
| namespaceOverride | string | `.Release.Namespace` | Override the namespace |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `8080` |  |
| ingress.enabled | bool | `false` | Enable ingress record generation |
| ingress.className | string | `""` |  |
| ingress.hostname | string | `"httpbin.local"` | Default host for the ingress record (evaluated as template) |
| ingress.annotations | object | `{}` |  |
| ingress.tls | bool | `false` | Enable TLS configuration for the host defined at ingress.hostname parameter |
| ingress.secretName | string | `""` | Optional custom TLS secret name. If not set, defaults to "<hostname>-tls". |
