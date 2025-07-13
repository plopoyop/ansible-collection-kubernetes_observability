# victoriametrics

Install and configure VictoriaMetrics on kubernetes

## Table of content

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
  - [victoriametrics_single_replica_count](#victoriametrics_single_replica_count)
  - [victoriametrics_single_resources](#victoriametrics_single_resources)
  - [victoriametrics_single_retention_period](#victoriametrics_single_retention_period)
  - [victoriametrics_vmagent_chart_version](#victoriametrics_vmagent_chart_version)
  - [victoriametrics_vmagent_config_scrap_configs](#victoriametrics_vmagent_config_scrap_configs)
  - [victoriametrics_vmagent_config_scrape_interval](#victoriametrics_vmagent_config_scrape_interval)
  - [victoriametrics_vmagent_deployment_name](#victoriametrics_vmagent_deployment_name)
  - [victoriametrics_vmagent_enabled](#victoriametrics_vmagent_enabled)
  - [victoriametrics_vmagent_namespace](#victoriametrics_vmagent_namespace)
  - [victoriametrics_vmagent_remote_write](#victoriametrics_vmagent_remote_write)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`


## Default Variables

### victoriametrics_single_chart_version

Victoriametrics Single Server chart version

#### Default value

```YAML
victoriametrics_single_chart_version: 0.23.0
```

### victoriametrics_single_deployment_name

Victoriametrics Single Server deployment name

#### Default value

```YAML
victoriametrics_single_deployment_name: vms
```

### victoriametrics_single_enabled

Install Victoriametrics Single Server chart

#### Default value

```YAML
victoriametrics_single_enabled: true
```

### victoriametrics_single_extra_args

VictoriaMetrics Single Server resources requests and limits

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

### victoriametrics_single_ingress_enabled

Enable ingress for VictoriaMetrics Single Server

#### Default value

```YAML
victoriametrics_single_ingress_enabled: false
```

### victoriametrics_single_ingress_hostname

Hostname for VictoriaMetrics Single Server ingress

### victoriametrics_single_ingress_tls_enabled

Enable tls for VictoriaMetrics Single Server ingress

#### Default value

```YAML
victoriametrics_single_ingress_tls_enabled: false
```

### victoriametrics_single_ingress_tls_secret_name

Secret name for VictoriaMetrics Single Server ingress cert

#### Example usage

```YAML
victoriametrics_single_ingress_tls_secret_name: "victoriametrics-cert"
```

### victoriametrics_single_mode

VictoriaMetrics Single Server mode: deployment, statefulSet

#### Default value

```YAML
victoriametrics_single_mode: statefulSet
```

### victoriametrics_single_namespace

K8s namespace to install Victoriametrics Single Server chart

#### Default value

```YAML
victoriametrics_single_namespace: victoriametrics
```

### victoriametrics_single_persistant_volume_size

VictoriaMetrics Single Server Size of the volume
Should be calculated based on the metrics you send and retention policy you set.

#### Default value

```YAML
victoriametrics_single_persistant_volume_size: 16Gi
```

### victoriametrics_single_replica_count

Number of victoriametrics single replicas

#### Default value

```YAML
victoriametrics_single_replica_count: 1
```

### victoriametrics_single_resources

VictoriaMetrics Single Server resources requests and limits

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

#### Default value

```YAML
victoriametrics_single_retention_period: '1'
```

### victoriametrics_vmagent_chart_version

VMAgent chart version

#### Default value

```YAML
victoriametrics_vmagent_chart_version: 0.23.0
```

### victoriametrics_vmagent_config_scrap_configs

VMAgent scrape configuration

### victoriametrics_vmagent_config_scrape_interval

VMAgent scrape interval

#### Default value

```YAML
victoriametrics_vmagent_config_scrape_interval: 10s
```

### victoriametrics_vmagent_deployment_name

VMAgent deployment name

#### Default value

```YAML
victoriametrics_vmagent_deployment_name: vmagent
```

### victoriametrics_vmagent_enabled

Install VMAgent chart

#### Default value

```YAML
victoriametrics_vmagent_enabled: true
```

### victoriametrics_vmagent_namespace

K8s namespace to install VMAgent

#### Default value

```YAML
victoriametrics_vmagent_namespace: victoriametrics
```

### victoriametrics_vmagent_remote_write

generates `remoteWrite.*` flags and config maps with value content for values, that are of type list of map.
Each item should contain `url` param to pass validation.

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



## Dependencies

None.

## License

MLP2

## Author

Clément Hubert
