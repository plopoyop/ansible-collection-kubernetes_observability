# victoriametrics

Install and configure VictoriaMetrics on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [victoriametrics_single_chart_version](#victoriametrics_single_chart_version)
  - [victoriametrics_single_deployment_name](#victoriametrics_single_deployment_name)
  - [victoriametrics_single_enabled](#victoriametrics_single_enabled)
  - [victoriametrics_single_extra_args](#victoriametrics_single_extra_args)
  - [victoriametrics_single_ingress_annotation](#victoriametrics_single_ingress_annotation)
  - [victoriametrics_single_ingress_classname](#victoriametrics_single_ingress_classname)
  - [victoriametrics_single_ingress_enabled](#victoriametrics_single_ingress_enabled)
  - [victoriametrics_single_ingress_hostname](#victoriametrics_single_ingress_hostname)
  - [victoriametrics_single_ingress_tls_enabled](#victoriametrics_single_ingress_tls_enabled)
  - [victoriametrics_single_ingress_tls_secret_name](#victoriametrics_single_ingress_tls_secret_name)
  - [victoriametrics_single_mode](#victoriametrics_single_mode)
  - [victoriametrics_single_namespace](#victoriametrics_single_namespace)
  - [victoriametrics_single_persistant_volume_size](#victoriametrics_single_persistant_volume_size)
  - [victoriametrics_single_pod_annotations](#victoriametrics_single_pod_annotations)
  - [victoriametrics_single_replica_count](#victoriametrics_single_replica_count)
  - [victoriametrics_single_resources](#victoriametrics_single_resources)
  - [victoriametrics_single_retention_period](#victoriametrics_single_retention_period)
  - [victoriametrics_vmagent_additional_values](#victoriametrics_vmagent_additional_values)
  - [victoriametrics_vmagent_chart_version](#victoriametrics_vmagent_chart_version)
  - [victoriametrics_vmagent_config_scrap_configs](#victoriametrics_vmagent_config_scrap_configs)
  - [victoriametrics_vmagent_config_scrape_interval](#victoriametrics_vmagent_config_scrape_interval)
  - [victoriametrics_vmagent_deployment_name](#victoriametrics_vmagent_deployment_name)
  - [victoriametrics_vmagent_enabled](#victoriametrics_vmagent_enabled)
  - [victoriametrics_vmagent_extra_args](#victoriametrics_vmagent_extra_args)
  - [victoriametrics_vmagent_extra_scrape_configs](#victoriametrics_vmagent_extra_scrape_configs)
  - [victoriametrics_vmagent_extra_volume_mounts](#victoriametrics_vmagent_extra_volume_mounts)
  - [victoriametrics_vmagent_extra_volumes](#victoriametrics_vmagent_extra_volumes)
  - [victoriametrics_vmagent_namespace](#victoriametrics_vmagent_namespace)
  - [victoriametrics_vmagent_pod_annotations](#victoriametrics_vmagent_pod_annotations)
  - [victoriametrics_vmagent_remote_write](#victoriametrics_vmagent_remote_write)
- [Discovered Tags](#discovered-tags)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.17`

## Default Variables

### victoriametrics_single_chart_version

Victoriametrics Single Server chart version

**_Type:_** string<br />

#### Default value

```YAML
victoriametrics_single_chart_version: 0.41.0
```

### victoriametrics_single_deployment_name

Victoriametrics Single Server deployment name

**_Type:_** string<br />

#### Default value

```YAML
victoriametrics_single_deployment_name: vms
```

### victoriametrics_single_enabled

Install Victoriametrics Single Server chart

**_Type:_** boolean<br />

#### Default value

```YAML
victoriametrics_single_enabled: true
```

### victoriametrics_single_extra_args

VictoriaMetrics Single Server resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
victoriametrics_single_extra_args: {}
```

#### Example usage

```YAML
victoriametrics_single_extra_args:
  maxLabelsPerTimeseries:  60
```

### victoriametrics_single_ingress_annotation

Annotations for VictoriaMetrics Single Server ingress

**_Type:_** dict<br />

#### Default value

```YAML
victoriametrics_single_ingress_annotation: {}
```

#### Example usage

```YAML
victoriametrics_single_ingress_annotation:
  kubernetes.io/ingress.class: traefik
  kubernetes.io/tls-acme: 'true'
```

### victoriametrics_single_ingress_classname

Ingress classname for VictoriaMetrics Single Server
victoriametrics_single_ingress_classname: ""

**_Type:_** string<br />

### victoriametrics_single_ingress_enabled

Enable ingress for VictoriaMetrics Single Server

**_Type:_** boolean<br />

#### Default value

```YAML
victoriametrics_single_ingress_enabled: false
```

### victoriametrics_single_ingress_hostname

Hostname for VictoriaMetrics Single Server ingress

**_Type:_** string<br />

### victoriametrics_single_ingress_tls_enabled

Enable tls for VictoriaMetrics Single Server ingress

**_Type:_** boolean<br />

#### Default value

```YAML
victoriametrics_single_ingress_tls_enabled: false
```

### victoriametrics_single_ingress_tls_secret_name

Secret name for VictoriaMetrics Single Server ingress cert

**_Type:_** string<br />

#### Example usage

```YAML
victoriametrics_single_ingress_tls_secret_name: "victoriametrics-cert"
```

### victoriametrics_single_mode

VictoriaMetrics Single Server mode: deployment, statefulSet

**_Type:_** int<br />

#### Default value

```YAML
victoriametrics_single_mode: statefulSet
```

### victoriametrics_single_namespace

K8s namespace to install Victoriametrics Single Server chart

**_Type:_** string<br />

#### Default value

```YAML
victoriametrics_single_namespace: victoriametrics
```

### victoriametrics_single_persistant_volume_size

VictoriaMetrics Single Server Size of the volume
Should be calculated based on the metrics you send and retention policy you set.

**_Type:_** string<br />

#### Default value

```YAML
victoriametrics_single_persistant_volume_size: 16Gi
```

### victoriametrics_single_pod_annotations

Annotations for VictoriaMetrics Single Server pods

**_Type:_** dict<br />

#### Default value

```YAML
victoriametrics_single_pod_annotations: {}
```

#### Example usage

```YAML
victoriametrics_single_pod_annotations:
  prometheus.io/scrape: "true"
  prometheus.io/port: "8428"
```

### victoriametrics_single_replica_count

Number of victoriametrics single replicas

**_Type:_** int<br />

#### Default value

```YAML
victoriametrics_single_replica_count: 1
```

### victoriametrics_single_resources

VictoriaMetrics Single Server resources requests and limits

**_Type:_** dict<br />

#### Default value

```YAML
victoriametrics_single_resources: {}
```

#### Example usage

```YAML
victoriametrics_single_resources:
  limits:
    cpu: 500m
    memory: 512Mi
  requests:
    cpu: 500m
    memory: 512Mi
```

### victoriametrics_single_retention_period

Data retention period. Possible units character: h(ours), d(ays), w(eeks), y(ears), if no unit character specified - month.
The minimum retention period is 24h. See these [docs](https://docs.victoriametrics.com/single-server-victoriametrics/#retention)

**_Type:_** string<br />

#### Default value

```YAML
victoriametrics_single_retention_period: '1'
```

### victoriametrics_vmagent_additional_values

Additional vmagent helm values merged as-is

**_Type:_** dict<br />

#### Default value

```YAML
victoriametrics_vmagent_additional_values: {}
```

#### Example usage

```YAML
victoriametrics_vmagent_additional_values:
  extraObjects:
    - apiVersion: v1
      kind: Secret
      metadata:
        name: vmagent-basic-auth
      stringData:
        password: "{{ remote_write_password }}"
```

### victoriametrics_vmagent_chart_version

VMAgent chart version

**_Type:_** string<br />

#### Default value

```YAML
victoriametrics_vmagent_chart_version: 0.42.0
```

### victoriametrics_vmagent_config_scrap_configs

VMAgent scrape configuration

**_Type:_** dict<br />

### victoriametrics_vmagent_config_scrape_interval

VMAgent scrape interval

**_Type:_** string<br />

#### Default value

```YAML
victoriametrics_vmagent_config_scrape_interval: 10s
```

### victoriametrics_vmagent_deployment_name

VMAgent deployment name

**_Type:_** string<br />

#### Default value

```YAML
victoriametrics_vmagent_deployment_name: vmagent
```

### victoriametrics_vmagent_enabled

Install VMAgent chart

**_Type:_** boolean<br />

#### Default value

```YAML
victoriametrics_vmagent_enabled: true
```

### victoriametrics_vmagent_extra_args

Extra command-line flags for vmagent

**_Type:_** dict<br />

#### Default value

```YAML
victoriametrics_vmagent_extra_args: {}
```

#### Example usage

```YAML
victoriametrics_vmagent_extra_args:
  remoteWrite.forcePromProto: "true"
  remoteWrite.label: "cluster=tech"
```

### victoriametrics_vmagent_extra_scrape_configs

Additional scrape configs appended to the defaults

**_Type:_** list<br />

#### Default value

```YAML
victoriametrics_vmagent_extra_scrape_configs: []
```

#### Example usage

```YAML
victoriametrics_vmagent_extra_scrape_configs:
  - job_name: "kube-state-metrics"
    honor_labels: true
    kubernetes_sd_configs:
      - role: endpoints
        namespaces:
          names: ["opentelemetry"]
    relabel_configs:
      - source_labels: [__meta_kubernetes_service_name]
        regex: ".*kube-state-metrics"
        action: keep
```

### victoriametrics_vmagent_extra_volume_mounts

Extra volume mounts for vmagent container

**_Type:_** list<br />

#### Default value

```YAML
victoriametrics_vmagent_extra_volume_mounts: []
```

#### Example usage

```YAML
victoriametrics_vmagent_extra_volume_mounts:
  - name: "remote-write-auth"
    mountPath: "/etc/vmagent-auth"
    readOnly: true
```

### victoriametrics_vmagent_extra_volumes

Extra pod volumes for vmagent

**_Type:_** list<br />

#### Default value

```YAML
victoriametrics_vmagent_extra_volumes: []
```

#### Example usage

```YAML
victoriametrics_vmagent_extra_volumes:
  - name: "remote-write-auth"
    secret:
      secretName: "vmagent-basic-auth"
```

### victoriametrics_vmagent_namespace

K8s namespace to install VMAgent

**_Type:_** string<br />

#### Default value

```YAML
victoriametrics_vmagent_namespace: victoriametrics
```

### victoriametrics_vmagent_pod_annotations

Annotations for VMAgent pods

**_Type:_** dict<br />

#### Default value

```YAML
victoriametrics_vmagent_pod_annotations: {}
```

#### Example usage

```YAML
victoriametrics_vmagent_pod_annotations:
  prometheus.io/scrape: "true"
  prometheus.io/port: "8429"
```

### victoriametrics_vmagent_remote_write

generates `remoteWrite.*` flags and config maps with value content for values, that are of type list of map.
Each item should contain `url` param to pass validation.

**_Type:_** list<br />

#### Default value

```YAML
victoriametrics_vmagent_remote_write: []
```

#### Example usage

```YAML
victoriametrics_vmagent_remote_write:
  - url: http://vm-insert:8480/insert/0/prometheus
    urlRelabelConfig:
      - action: keep
        source_labels: [env]
        regex: "dev"
  - url: http://prometheus:8480/insert/0/prometheus
```

## Discovered Tags

**_helm_chart_**

**_helm_repository_**

**_install_**

**_namespace_**

**_victoriametrics_**

**_victoriametrics_single_**

**_victoriametrics_vmagent_**

## Dependencies

None.

## License

MPL-2.0

## Author

Clément Hubert
