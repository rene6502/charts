# GitLab

Helm chart for [GitLab Community Edition](https://gitlab.com/gitlab-org/gitlab)

## Install
```bash
helm upgrade gitlab gitlab --repo https://rene6502.github.io/charts \
  --atomic --install --namespace default \
  --set ingress.enabled=true \
  --set ingress.hostname=gitlab.example.com \
  --set ingress.tls=true \
  --set ingress.annotations."cert-manager\.io/cluster-issuer"=platform-issuer \
  --set registry.ingress.enabled=true \
  --set registry.ingress.hostname=registry.example.com \
  --set registry.ingress.tls=true \
  --set registry.ingress.annotations."cert-manager\.io/cluster-issuer"=platform-issuer \
  --set persistence.enabled=true
```

## Login
Login with `root` and initial root password.
```bash
kubectl exec deploy/gitlab --namespace default -- cat /etc/gitlab/initial_root_password
```

## Disable Tracking
- Select Admin / Select Settings / Metrics and Profiling
  - Expand Usage statistics \
    [-] Enable version check \
    [-] Enable Service Ping
  - Expand Event tracking \
    [-] Enable event tracking

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"gitlab/gitlab-ce"` |  |
| image.tag | string | `"latest"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` | Registry secret names as an array |
| nameOverride | string | `""` | String to partially override common.fullname |
| fullnameOverride | string | `""` | String to fully override common.fullname |
| namespaceOverride | string | `.Release.Namespace` | Override the namespace |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `80` |  |
| ingress.enabled | bool | `false` | Enable ingress record generation |
| ingress.className | string | `""` |  |
| ingress.hostname | string | `"gitlab.local"` | Default host for the ingress record (evaluated as template) |
| ingress.annotations | object | `{}` |  |
| ingress.tls | bool | `false` | Enable TLS configuration for the host defined at ingress.hostname parameter |
| ingress.secretName | string | `""` | Optional custom TLS secret name. If not set, defaults to "<hostname>-tls". |
| registry.service.type | string | `"ClusterIP"` |  |
| registry.service.port | int | `5001` |  |
| registry.ingress.enabled | bool | `false` | Enable ingress record generation |
| registry.ingress.className | string | `""` |  |
| registry.ingress.hostname | string | `"registry.local"` | Default host for the ingress record (evaluated as template) |
| registry.ingress.annotations | object | `{}` |  |
| registry.ingress.tls | bool | `false` | Enable TLS configuration for the host defined at ingress.hostname parameter |
| registry.ingress.secretName | string | `""` | Optional custom TLS secret name. If not set, defaults to "<hostname>-tls". |
| persistence.enabled | bool | `false` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.size | string | `"10Gi"` |  |
| persistence.storageClass | string | `""` |  |
