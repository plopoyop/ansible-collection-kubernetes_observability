# jaeger

Install and configure Jaeger on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [jaeger_chart_version](#jaeger_chart_version)
  - [jaeger_deployment_name](#jaeger_deployment_name)
  - [jaeger_enabled](#jaeger_enabled)
  - [jaeger_extra_env](#jaeger_extra_env)
  - [jaeger_image_tag](#jaeger_image_tag)
  - [jaeger_ingress_annotations](#jaeger_ingress_annotations)
  - [jaeger_ingress_class_name](#jaeger_ingress_class_name)
  - [jaeger_ingress_enabled](#jaeger_ingress_enabled)
  - [jaeger_ingress_hostname](#jaeger_ingress_hostname)
  - [jaeger_ingress_labels](#jaeger_ingress_labels)
  - [jaeger_ingress_tls_enabled](#jaeger_ingress_tls_enabled)
  - [jaeger_ingress_tls_secret_name](#jaeger_ingress_tls_secret_name)
  - [jaeger_namespace](#jaeger_namespace)
  - [jaeger_replicas](#jaeger_replicas)
  - [jaeger_resources](#jaeger_resources)
  - [jaeger_storage_cassandra](#jaeger_storage_cassandra)
  - [jaeger_storage_elasticsearch](#jaeger_storage_elasticsearch)
  - [jaeger_storage_type](#jaeger_storage_type)
  - [jaeger_uiconfig](#jaeger_uiconfig)
  - [jaeger_userconfig](#jaeger_userconfig)
- [Discovered Tags](#discovered-tags)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.17`

## Default Variables

### jaeger_chart_version

Jaeger chart version

**_Type:_** string<br />

#### Default value

```YAML
jaeger_chart_version: 4.7.0
```

### jaeger_deployment_name

Jaeger helm release name

**_Type:_** string<br />

#### Default value

```YAML
jaeger_deployment_name: jaeger
```

### jaeger_enabled

Install Jaeger chart

**_Type:_** boolean<br />

#### Default value

```YAML
jaeger_enabled: true
```

### jaeger_extra_env

Additional environment variables passed to the Jaeger container

**_Type:_** list<br />

#### Default value

```YAML
jaeger_extra_env: []
```

#### Example usage

```YAML
jaeger_extra_env:
  - name: "LOG_LEVEL"
    value: "debug"
```

### jaeger_image_tag

Override the Jaeger container image tag (leave empty to use the chart default)

**_Type:_** string<br />

#### Default value

```YAML
jaeger_image_tag: ''
```

### jaeger_ingress_annotations

Annotations applied to the Jaeger ingress

**_Type:_** dict<br />

#### Default value

```YAML
jaeger_ingress_annotations: {}
```

#### Example usage

```YAML
jaeger_ingress_annotations:
  kubernetes.io/ingress.class: "{{ jaeger_ingress_class_name }}"
  cert-manager.io/cluster-issuer: "letsencrypt-prod"
```

### jaeger_ingress_class_name

Ingress class name for Jaeger

**_Type:_** string<br />

### jaeger_ingress_enabled

Enable ingress for the Jaeger UI

**_Type:_** boolean<br />

#### Default value

```YAML
jaeger_ingress_enabled: false
```

### jaeger_ingress_hostname

Hostname for the Jaeger ingress

**_Type:_** string<br />

### jaeger_ingress_labels

Labels applied to the Jaeger ingress

**_Type:_** dict<br />

#### Default value

```YAML
jaeger_ingress_labels: {}
```

#### Example usage

```YAML
jaeger_ingress_labels:
  app: jaeger
```

### jaeger_ingress_tls_enabled

Enable TLS for the Jaeger ingress

**_Type:_** boolean<br />

#### Default value

```YAML
jaeger_ingress_tls_enabled: false
```

### jaeger_ingress_tls_secret_name

Secret name for the Jaeger TLS certificate

**_Type:_** string<br />

### jaeger_namespace

K8s namespace to install Jaeger chart

**_Type:_** string<br />

#### Default value

```YAML
jaeger_namespace: jaeger
```

### jaeger_replicas

Number of pod replicas for Jaeger

**_Type:_** int<br />

#### Default value

```YAML
jaeger_replicas: 1
```

### jaeger_resources

Resource requests/limits for Jaeger pods

**_Type:_** dict<br />

#### Default value

```YAML
jaeger_resources: {}
```

#### Example usage

```YAML
jaeger_resources:
  limits:
    cpu: 500m
    memory: 512Mi
  requests:
    cpu: 100m
    memory: 256Mi
```

### jaeger_storage_cassandra

Cassandra storage backend configuration (only used when jaeger_storage_type is "cassandra")

**_Type:_** dict<br />

#### Default value

```YAML
jaeger_storage_cassandra: {}
```

#### Example usage

```YAML
jaeger_storage_cassandra:
  host: "cassandra"
  port: 9042
  user: "jaeger"
  usePassword: true
  password: "changeme"
  keyspace: "jaeger_v1_dc1"
```

### jaeger_storage_elasticsearch

Elasticsearch storage backend configuration (only used when jaeger_storage_type is "elasticsearch")

**_Type:_** dict<br />

#### Default value

```YAML
jaeger_storage_elasticsearch: {}
```

#### Example usage

```YAML
jaeger_storage_elasticsearch:
  url: "http://elasticsearch:9200"
  user: "elastic"
  password: "changeme"
```

### jaeger_storage_type

Jaeger storage backend ("cassandra", "elasticsearch", or empty for the default in-memory backend)

**_Type:_** string<br />

#### Default value

```YAML
jaeger_storage_type: ''
```

### jaeger_uiconfig

Jaeger UI configuration (passed as-is to the chart `uiconfig` value)

**_Type:_** dict<br />

#### Default value

```YAML
jaeger_uiconfig: {}
```

### jaeger_userconfig

User configuration overriding service, extensions, receivers and exporters

**_Type:_** dict<br />

#### Default value

```YAML
jaeger_userconfig: {}
```

## Discovered Tags

**_helm_chart_**

**_helm_repository_**

**_install_**

**_jaeger_**

**_namespace_**

**_uninstall_**

## Dependencies

None.

## License

MPL-2.0

## Author

Clément Hubert
