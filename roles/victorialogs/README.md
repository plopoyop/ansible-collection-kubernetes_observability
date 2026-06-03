# victorialogs

Install and configure VictoriaLogs single on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [victorialogs_affinity](#victorialogs_affinity)
  - [victorialogs_chart_version](#victorialogs_chart_version)
  - [victorialogs_deployment_name](#victorialogs_deployment_name)
  - [victorialogs_enabled](#victorialogs_enabled)
  - [victorialogs_extra_args](#victorialogs_extra_args)
  - [victorialogs_extra_env](#victorialogs_extra_env)
  - [victorialogs_ingress_annotations](#victorialogs_ingress_annotations)
  - [victorialogs_ingress_classname](#victorialogs_ingress_classname)
  - [victorialogs_ingress_enabled](#victorialogs_ingress_enabled)
  - [victorialogs_ingress_hostname](#victorialogs_ingress_hostname)
  - [victorialogs_ingress_labels](#victorialogs_ingress_labels)
  - [victorialogs_ingress_tls_enabled](#victorialogs_ingress_tls_enabled)
  - [victorialogs_ingress_tls_secret_name](#victorialogs_ingress_tls_secret_name)
  - [victorialogs_namespace](#victorialogs_namespace)
  - [victorialogs_node_selector](#victorialogs_node_selector)
  - [victorialogs_persistent_volume_access_modes](#victorialogs_persistent_volume_access_modes)
  - [victorialogs_persistent_volume_enabled](#victorialogs_persistent_volume_enabled)
  - [victorialogs_persistent_volume_size](#victorialogs_persistent_volume_size)
  - [victorialogs_persistent_volume_storage_class](#victorialogs_persistent_volume_storage_class)
  - [victorialogs_pod_annotations](#victorialogs_pod_annotations)
  - [victorialogs_pod_labels](#victorialogs_pod_labels)
  - [victorialogs_replica_count](#victorialogs_replica_count)
  - [victorialogs_resources](#victorialogs_resources)
  - [victorialogs_retention_disk_space_usage](#victorialogs_retention_disk_space_usage)
  - [victorialogs_retention_period](#victorialogs_retention_period)
  - [victorialogs_service_monitor_enabled](#victorialogs_service_monitor_enabled)
  - [victorialogs_service_port](#victorialogs_service_port)
  - [victorialogs_service_type](#victorialogs_service_type)
  - [victorialogs_tolerations](#victorialogs_tolerations)
- [Discovered Tags](#discovered-tags)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.17`

## Default Variables

### victorialogs_affinity

Affinity rules for the VictoriaLogs single pod

**_Type:_** dict<br />

#### Default value

```YAML
victorialogs_affinity: {}
```

### victorialogs_chart_version

VictoriaLogs single chart version

**_Type:_** string<br />

#### Default value

```YAML
victorialogs_chart_version: 0.13.6
```

### victorialogs_deployment_name

VictoriaLogs single helm release name

**_Type:_** string<br />

#### Default value

```YAML
victorialogs_deployment_name: vlogs
```

### victorialogs_enabled

Install VictoriaLogs single chart

**_Type:_** boolean<br />

#### Default value

```YAML
victorialogs_enabled: true
```

### victorialogs_extra_args

Additional CLI flags to pass to the VictoriaLogs binary

**_Type:_** dict<br />

#### Default value

```YAML
victorialogs_extra_args: {}
```

#### Example usage

```YAML
victorialogs_extra_args:
  search.maxQueryDuration: "30s"
```

### victorialogs_extra_env

Additional environment variables passed to the VictoriaLogs container

**_Type:_** list<br />

#### Default value

```YAML
victorialogs_extra_env: []
```

#### Example usage

```YAML
victorialogs_extra_env:
  - name: "GOMAXPROCS"
    value: "2"
```

### victorialogs_ingress_annotations

Annotations applied to the VictoriaLogs single ingress

**_Type:_** dict<br />

#### Default value

```YAML
victorialogs_ingress_annotations: {}
```

#### Example usage

```YAML
victorialogs_ingress_annotations:
  kubernetes.io/ingress.class: "traefik"
  cert-manager.io/cluster-issuer: "letsencrypt-prod"
```

### victorialogs_ingress_classname

Ingress class name for VictoriaLogs single

**_Type:_** string<br />

### victorialogs_ingress_enabled

Enable ingress for VictoriaLogs single

**_Type:_** boolean<br />

#### Default value

```YAML
victorialogs_ingress_enabled: false
```

### victorialogs_ingress_hostname

Hostname for the VictoriaLogs single ingress

**_Type:_** string<br />

### victorialogs_ingress_labels

Labels applied to the VictoriaLogs single ingress

**_Type:_** dict<br />

#### Default value

```YAML
victorialogs_ingress_labels: {}
```

### victorialogs_ingress_tls_enabled

Enable TLS for the VictoriaLogs single ingress

**_Type:_** boolean<br />

#### Default value

```YAML
victorialogs_ingress_tls_enabled: false
```

### victorialogs_ingress_tls_secret_name

Secret name for the VictoriaLogs single TLS certificate

**_Type:_** string<br />

### victorialogs_namespace

K8s namespace to install VictoriaLogs single chart

**_Type:_** string<br />

#### Default value

```YAML
victorialogs_namespace: victorialogs
```

### victorialogs_node_selector

Node selector for the VictoriaLogs single pod

**_Type:_** dict<br />

#### Default value

```YAML
victorialogs_node_selector: {}
```

### victorialogs_persistent_volume_access_modes

Access modes for the VictoriaLogs single persistent volume

**_Type:_** list<br />

#### Default value

```YAML
victorialogs_persistent_volume_access_modes:
  - ReadWriteOnce
```

### victorialogs_persistent_volume_enabled

Enable persistent volume for VictoriaLogs single

**_Type:_** boolean<br />

#### Default value

```YAML
victorialogs_persistent_volume_enabled: true
```

### victorialogs_persistent_volume_size

Size of the VictoriaLogs single persistent volume

**_Type:_** string<br />

#### Default value

```YAML
victorialogs_persistent_volume_size: 10Gi
```

### victorialogs_persistent_volume_storage_class

StorageClass to use for the VictoriaLogs single persistent volume (empty to use the cluster default)

**_Type:_** string<br />

#### Default value

```YAML
victorialogs_persistent_volume_storage_class: ''
```

### victorialogs_pod_annotations

Annotations applied to the VictoriaLogs single pod

**_Type:_** dict<br />

#### Default value

```YAML
victorialogs_pod_annotations: {}
```

### victorialogs_pod_labels

Labels applied to the VictoriaLogs single pod

**_Type:_** dict<br />

#### Default value

```YAML
victorialogs_pod_labels: {}
```

### victorialogs_replica_count

Number of VictoriaLogs single replicas

**_Type:_** int<br />

#### Default value

```YAML
victorialogs_replica_count: 1
```

### victorialogs_resources

Resources requests and limits for the VictoriaLogs single pod

**_Type:_** dict<br />

#### Default value

```YAML
victorialogs_resources: {}
```

#### Example usage

```YAML
victorialogs_resources:
  limits:
    cpu: 500m
    memory: 512Mi
  requests:
    cpu: 100m
    memory: 256Mi
```

### victorialogs_retention_disk_space_usage

Maximum disk space usage for the retained logs (e.g. "10GB"). Empty means unlimited.

**_Type:_** string<br />

#### Default value

```YAML
victorialogs_retention_disk_space_usage: ''
```

### victorialogs_retention_period

Data retention period. Possible units character: h(ours), d(ays), w(eeks), y(ears), if no unit character specified - month.
See [the docs](https://docs.victoriametrics.com/victorialogs/#retention).

**_Type:_** string<br />

#### Default value

```YAML
victorialogs_retention_period: '1'
```

### victorialogs_service_monitor_enabled

Enable a Prometheus-operator ServiceMonitor for VictoriaLogs single

**_Type:_** boolean<br />

#### Default value

```YAML
victorialogs_service_monitor_enabled: false
```

### victorialogs_service_port

Service port for the VictoriaLogs single service

**_Type:_** int<br />

#### Default value

```YAML
victorialogs_service_port: 9428
```

### victorialogs_service_type

Service type for the VictoriaLogs single service

**_Type:_** string<br />

#### Default value

```YAML
victorialogs_service_type: ClusterIP
```

### victorialogs_tolerations

Tolerations for the VictoriaLogs single pod

**_Type:_** list<br />

#### Default value

```YAML
victorialogs_tolerations: []
```

## Discovered Tags

**_helm_chart_**

**_helm_repository_**

**_install_**

**_namespace_**

**_uninstall_**

**_victorialogs_**

## Dependencies

None.

## License

MPL-2.0

## Author

Clément Hubert
