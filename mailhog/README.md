# mailhog

Helm chart for https://github.com/mailhog/MailHog

## Install
```bash
helm upgrade mailhog mailhog --repo https://rene6502.github.io/charts \
  --atomic --install --namespace default \
  --set ingress.enabled=true \
  --set ingress.hostname=mailhog.example.com \
  --set ingress.annotations."cert-manager\.io/cluster-issuer"=platform-issuer \
  --set ingress.tls=true
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"mailhog/mailhog"` |  |
| image.tag | string | `"v1.0.1"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` | Registry secret names as an array |
| nameOverride | string | `""` | String to partially override common.fullname |
| fullnameOverride | string | `""` | String to fully override common.fullname |
| namespaceOverride | string | `.Release.Namespace` | Override the namespace |
| service.type | string | `"ClusterIP"` |  |
| service.smtpPort | int | `1025` |  |
| service.httpPort | int | `8025` |  |
| service.nodePorts.http | string | `""` |  |
| service.nodePorts.smtp | string | `""` |  |
| ingress.enabled | bool | `false` | Enable ingress record generation |
| ingress.className | string | `""` |  |
| ingress.hostname | string | `"mailhog.local"` | Default host for the ingress record (evaluated as template) |
| ingress.annotations | object | `{}` |  |
| ingress.tls | bool | `false` | Enable TLS configuration for the host defined at ingress.hostname parameter |
| ingress.secretName | string | `""` | Optional custom TLS secret name. If not set, defaults to "<hostname>-tls". |
