# nfs-volume

Helm chart for creating a PVC/PV connected to an NFS server

## Install
```bash
helm upgrade nfs-volume nfs-volume --repo https://rene6502.github.io/charts \
  --atomic --install --namespace default \
  --set name=example
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| name | string | `"default"` |  |
| server | string | `"172.16.1.2"` |  |
| path | string | `"/share/data"` |  |
| capacity | string | `"10Gi"` |  |
| accessMode | string | `"ReadWriteOnce"` |  |
| reclaimPolicy | string | `"Retain"` |  |
| sc.enabled | bool | `true` |  |
| pv.enabled | bool | `true` |  |
| pvc.enabled | bool | `true` |  |
