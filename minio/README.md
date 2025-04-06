# minio

Helm chart for https://github.com/minio/minio

## Install
```bash
helm upgrade minio minio --repo https://rene6502.github.io/charts \
  --atomic --install --namespace default \
  --set ingress.enabled=true \
  --set ingress.hostname=minio.example.com \
  --set ingress.annotations."cert-manager\.io/cluster-issuer"=platform-issuer \
  --set ingress.tls=true
```

## How to run Minio in legacy FS mode
- last version which supports legacy FS mode is RELEASE.2022-10-24T18-35-07Z
- https://geek-cookbook.funkypenguin.co.nz/blog/2022/09/01/run-minio-in-legacy-filesystem-mode/
- https://github.com/minio/minio/issues/15478

In data volume create the file `.minio.sys/format.json`
```
{"version":"1","format":"fs","id":"avoid-going-into-snsd-mode-legacy-is-fine-with-me","fs":{"version":"2"}}
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"minio/minio"` |  |
| image.tag | string | `"RELEASE.2022-10-24T18-35-07Z"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` | Registry secret names as an array |
| nameOverride | string | `""` | String to partially override common.fullname |
| fullnameOverride | string | `""` | String to fully override common.fullname |
| namespaceOverride | string | `.Release.Namespace` | Override the namespace |
| auth.secretName | string | `"minio"` |  |
| auth.accessKey | string | `"access-key"` |  |
| auth.secretKey | string | `"secret-key"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.minioPort | int | `9000` |  |
| service.webPort | int | `9001` |  |
| service.nodePorts.minio | string | `""` |  |
| service.nodePorts.web | string | `""` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.size | string | `"10Gi"` |  |
| persistence.storageClass | string | `""` |  |
| ingress.enabled | bool | `false` | Enable ingress record generation |
| ingress.className | string | `""` |  |
| ingress.hostname | string | `"minio.local"` | Default host for the ingress record (evaluated as template) |
| ingress.annotations | object | `{}` |  |
| ingress.tls | bool | `false` | Enable TLS configuration for the host defined at ingress.hostname parameter |
