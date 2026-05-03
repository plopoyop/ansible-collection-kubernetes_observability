# loki

Install and configure Grafana on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [loki_auth_enabled](#loki_auth_enabled)
  - [loki_chart_version](#loki_chart_version)
  - [loki_deployment_mode](#loki_deployment_mode)
  - [loki_enable_tracing](#loki_enable_tracing)
  - [loki_enabled](#loki_enabled)
  - [loki_ingester_config](#loki_ingester_config)
  - [loki_ingress_annotations](#loki_ingress_annotations)
  - [loki_ingress_class_name](#loki_ingress_class_name)
  - [loki_ingress_enabled](#loki_ingress_enabled)
  - [loki_ingress_tls_enabled](#loki_ingress_tls_enabled)
  - [loki_limits_config](#loki_limits_config)
  - [loki_minio_enabled](#loki_minio_enabled)
  - [loki_namespace](#loki_namespace)
  - [loki_querier_config](#loki_querier_config)
  - [loki_readiness_probe](#loki_readiness_probe)
  - [loki_release_name](#loki_release_name)
  - [loki_schema_config](#loki_schema_config)
  - [loki_single_binary_replication_factor](#loki_single_binary_replication_factor)
  - [loki_single_binary_resources](#loki_single_binary_resources)
  - [loki_storage_azure_account_key](#loki_storage_azure_account_key)
  - [loki_storage_azure_account_name](#loki_storage_azure_account_name)
  - [loki_storage_azure_connection_string](#loki_storage_azure_connection_string)
  - [loki_storage_azure_container_name](#loki_storage_azure_container_name)
  - [loki_storage_azure_endpoint_suffix](#loki_storage_azure_endpoint_suffix)
  - [loki_storage_azure_request_timeout](#loki_storage_azure_request_timeout)
  - [loki_storage_azure_use_managed_identity](#loki_storage_azure_use_managed_identity)
  - [loki_storage_azure_user_assigned_id](#loki_storage_azure_user_assigned_id)
  - [loki_storage_chunks_directory](#loki_storage_chunks_directory)
  - [loki_storage_filesystem_directory](#loki_storage_filesystem_directory)
  - [loki_storage_rules_directory](#loki_storage_rules_directory)
  - [loki_storage_s3_access_key_id](#loki_storage_s3_access_key_id)
  - [loki_storage_s3_bucket_name](#loki_storage_s3_bucket_name)
  - [loki_storage_s3_endpoint](#loki_storage_s3_endpoint)
  - [loki_storage_s3_force_path_style](#loki_storage_s3_force_path_style)
  - [loki_storage_s3_http_config](#loki_storage_s3_http_config)
  - [loki_storage_s3_insecure](#loki_storage_s3_insecure)
  - [loki_storage_s3_region](#loki_storage_s3_region)
  - [loki_storage_s3_secret_access_key](#loki_storage_s3_secret_access_key)
  - [loki_storage_type](#loki_storage_type)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.17`

## Default Variables

### loki_auth_enabled

Enable Loki authentication

**_Type:_** boolean<br />

#### Default value

```YAML
loki_auth_enabled: false
```

### loki_chart_version

Grafana chart version

**_Type:_** string<br />

#### Default value

```YAML
loki_chart_version: 6.55.0
```

### loki_deployment_mode

Loki deployment mode : SingleBinary / SimpleScalable / Distributed
Only SingleBinary is handle by this role for now

**_Type:_** string<br />

#### Default value

```YAML
loki_deployment_mode: SingleBinary
```

### loki_enable_tracing

Enable tracing

**_Type:_** boolean<br />

#### Default value

```YAML
loki_enable_tracing: false
```

### loki_enabled

Install Loki chart

**_Type:_** boolean<br />

#### Default value

```YAML
loki_enabled: true
```

### loki_ingester_config

Ingester configuration

**_Type:_** dict<br />

#### Example usage

```YAML
loki_ingester_config:
  chunk_encoding: "snappy"
```

### loki_ingress_annotations

Annotation for Loki ingress

**_Type:_** dict<br />

#### Example usage

```YAML
loki_ingress_annotations:
  kubernetes.io/ingress.class: "{{ loki_ingress_class_name }}"
  kubernetes.io/tls-acme: "false"
```

### loki_ingress_class_name

Ingress classname for Loki gateway

**_Type:_** string<br />

#### Example usage

```YAML
loki_ingress_class_name: "traefik"
```

### loki_ingress_enabled

Enable ingress for Loki gateway

**_Type:_** boolean<br />

#### Default value

```YAML
loki_ingress_enabled: false
```

### loki_ingress_tls_enabled

Enable TLS for Loki ingress

**_Type:_** boolean<br />

#### Example usage

```YAML
loki_ingress_tls_enabled: false
```

### loki_limits_config

Limit config

**_Type:_** dict<br />

#### Default value

```YAML
loki_limits_config:
  allow_structured_metadata: true
  volume_enabled: true
```

### loki_minio_enabled

Enable minio as object storage

**_Type:_** boolean<br />

#### Default value

```YAML
loki_minio_enabled: false
```

### loki_namespace

K8s namespace to install Loki chart

**_Type:_** string<br />

#### Default value

```YAML
loki_namespace: loki
```

### loki_querier_config

Querier configuration

**_Type:_** dict<br />

#### Example usage

```YAML
loki_querier_config:
  max_concurrent: 4
```

### loki_readiness_probe

Loki service readiness probe

**_Type:_** dict<br />

#### Example usage

```YAML
loki_readiness_probe:
  initialDelaySeconds: 120
  periodSeconds: 60
  timeoutSeconds: 30
  failureThreshold: 10
```

### loki_release_name

Loki helm release name

**_Type:_** string<br />

#### Default value

```YAML
loki_release_name: loki
```

### loki_schema_config

Schema config for Loki

**_Type:_** dict<br />

#### Example usage

```YAML
loki_schema_config:
  configs:
    - from: "2024-04-01"
      store: tsdb
      object_store: s3
      schema: v13
      index:
        prefix: loki_index_
        period: 24h
```

### loki_single_binary_replication_factor

Number of replica for SingleBinary deployment
https://grafana.com/docs/loki/latest/setup/install/helm/install-monolithic/?pg=oss-loki&plcmt=quick-links#single-replica-or-multiple-replicas

**_Type:_** int<br />

#### Default value

```YAML
loki_single_binary_replication_factor: 1
```

### loki_single_binary_resources

CPU and memory resource request and limit for SingleBinary deployment

**_Type:_** dict<br />

#### Example usage

```YAML
loki_single_binary_resources:
  requests:
    memory: 2Gi
  limits:
    memory: 4Gi
```

### loki_storage_azure_account_key

Azure storage account key

**_Type:_** string<br />

### loki_storage_azure_account_name

Azure storage account name

**_Type:_** string<br />

### loki_storage_azure_connection_string

Connection String for assure storage
If set, the values of `account-name` and
`endpoint-suffix` values will not be used. Use this method over `account-key`
if you need to authenticate via a SAS token. Or if you use the Azurite
emulator.

**_Type:_** dict<br />

### loki_storage_azure_container_name

Name of the storage account blob container used to store chunks. This
container must be created before running cortex.

**_Type:_** string<br />

### loki_storage_azure_endpoint_suffix

Azure storage endpoint suffix without schema. The storage account name will be
prefixed to this value to create the FQDN

**_Type:_** dict<br />

### loki_storage_azure_request_timeout

Timeout for requests made against azure blob storage

**_Type:_** string<br />

### loki_storage_azure_use_managed_identity

Use Managed Identity to authenticate to the Azure storage account.

**_Type:_** boolean<br />

### loki_storage_azure_user_assigned_id

User assigned identity ID to authenticate to the Azure storage account

**_Type:_** string<br />

### loki_storage_chunks_directory

Directory for filesystem chunks storage

**_Type:_** string<br />

#### Default value

```YAML
loki_storage_chunks_directory: /var/loki/chunks
```

### loki_storage_filesystem_directory

Directory for filesystem storage

**_Type:_** string<br />

#### Default value

```YAML
loki_storage_filesystem_directory: /tmp/loki
```

### loki_storage_rules_directory

Directory for filesystem rules storage

**_Type:_** string<br />

#### Default value

```YAML
loki_storage_rules_directory: /var/loki/rules
```

### loki_storage_s3_access_key_id

Access key Id for S3 storage

**_Type:_** string<br />

### loki_storage_s3_bucket_name

S3 storage bucket name

**_Type:_** string<br />

### loki_storage_s3_endpoint

S3 Endpoint to connect to

**_Type:_** string<br />

### loki_storage_s3_force_path_style

Force the request to use path-style addressing

**_Type:_** boolean<br />

### loki_storage_s3_http_config

additional HTTP config for S3 Storage
loki_storage_s3_http_config:example: >
loki_storage_s3_http_config:
timeout: 30s
insecure_skip_verify: true

**_Type:_** dict<br />

### loki_storage_s3_insecure

Disable https on s3 connection

**_Type:_** boolean<br />

### loki_storage_s3_region

S3 region to use

**_Type:_** string<br />

### loki_storage_s3_secret_access_key

Secret access key for S3 storage

**_Type:_** string<br />

### loki_storage_type

Storage backend for loki : only S3 or Azure

**_Type:_** string<br />

#### Example usage

```YAML
loki_storage_type: "s3"
```

## Dependencies

None.

## License

MPL-2.0

## Author

Clément Hubert
