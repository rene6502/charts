# kube-vip

Helm chart for https://github.com/kube-vip/kube-vip

## Install
```bash
helm upgrade kube-vip kube-vip --repo https://rene6502.github.io/charts \
  --atomic --install --namespace default \
  --set env.vip_interface=ens18 \
  --set config.range-global=172.16.1.64-172.16.1.79
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"kube-vip/kube-vip"` |  |
| image.tag | string | `"v0.9.0"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecrets | list | `[]` | Registry secret names as an array |
| nameOverride | string | `""` | String to partially override common.fullname |
| fullnameOverride | string | `""` | String to fully override common.fullname |
| namespaceOverride | string | `.Release.Namespace` | Override the namespace |
| env.vip_arp | bool | `true` |  |
| env.vip_interface | string | `""` |  |
| env.prometheus_server | string | `":2112"` |  |
| env.port | int | `6443` |  |
| env.dns_mode | string | `"first"` |  |
| env.svc_enable | bool | `true` |  |
| env.svc_leasename | string | `"plndr-svcs-lock"` |  |
| env.vip_leasename | string | `"plndr-cp-lock"` |  |
| env.vip_leaderelection | bool | `true` |  |
| env.vip_leaseduration | int | `5` |  |
| env.vip_renewdeadline | int | `3` |  |
| env.vip_retryperiod | int | `1` |  |
| envValueFrom.vip_nodename.fieldRef.fieldPath | string | `"spec.nodeName"` |  |
| config | object | `{}` |  |
