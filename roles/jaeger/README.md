# jaeger

Install and configure Jaeger on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [jaeger_chart_version](#jaeger_chart_version)
  - [jaeger_deployment_name](#jaeger_deployment_name)
  - [jaeger_enabled](#jaeger_enabled)
  - [jaeger_extra_env](#jaeger_extra_env)
  - [jaeger_extra_volume_mounts](#jaeger_extra_volume_mounts)
  - [jaeger_extra_volumes](#jaeger_extra_volumes)
  - [jaeger_image_tag](#jaeger_image_tag)
  - [jaeger_ingress_annotations](#jaeger_ingress_annotations)
  - [jaeger_ingress_class_name](#jaeger_ingress_class_name)
  - [jaeger_ingress_enabled](#jaeger_ingress_enabled)
  - [jaeger_ingress_hostname](#jaeger_ingress_hostname)
  - [jaeger_ingress_labels](#jaeger_ingress_labels)
  - [jaeger_ingress_tls_enabled](#jaeger_ingress_tls_enabled)
  - [jaeger_ingress_tls_secret_name](#jaeger_ingress_tls_secret_name)
  - [jaeger_namespace](#jaeger_namespace)
  - [jaeger_persistence_access_modes](#jaeger_persistence_access_modes)
  - [jaeger_persistence_enabled](#jaeger_persistence_enabled)
  - [jaeger_persistence_mount_path](#jaeger_persistence_mount_path)
  - [jaeger_persistence_name](#jaeger_persistence_name)
  - [jaeger_persistence_size](#jaeger_persistence_size)
  - [jaeger_persistence_storage_class](#jaeger_persistence_storage_class)
  - [jaeger_persistence_volume_name](#jaeger_persistence_volume_name)
  - [jaeger_replicas](#jaeger_replicas)
  - [jaeger_resources](#jaeger_resources)
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
jaeger_chart_version: 4.11.1
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

### jaeger_extra_volume_mounts

Extra volume mounts for the Jaeger container (rendered as
jaeger.extraVolumeMounts), in addition to the managed persistence mount.

**_Type:_** list<br />

#### Default value

```YAML
jaeger_extra_volume_mounts: []
```

### jaeger_extra_volumes

Extra volumes added to the Jaeger pod (rendered as jaeger.extraVolumes), in
addition to the managed persistence volume.

**_Type:_** list<br />

#### Default value

```YAML
jaeger_extra_volumes: []
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

#### Default value

```YAML
jaeger_ingress_class_name: ''
```

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

#### Default value

```YAML
jaeger_ingress_hostname: ''
```

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

#### Default value

```YAML
jaeger_ingress_tls_secret_name: ''
```

### jaeger_namespace

K8s namespace to install Jaeger chart

**_Type:_** string<br />

#### Default value

```YAML
jaeger_namespace: jaeger
```

### jaeger_persistence_access_modes

Access modes of the badger PersistentVolumeClaim.

**_Type:_** list<br />

#### Default value

```YAML
jaeger_persistence_access_modes:
  - ReadWriteOnce
```

### jaeger_persistence_enabled

Create and mount a PersistentVolumeClaim so the embedded badger storage
survives pod restarts. Keep jaeger_replicas at 1 (badger is single-writer).

**_Type:_** boolean<br />

#### Default value

```YAML
jaeger_persistence_enabled: false
```

### jaeger_persistence_mount_path

Mount path of the badger volume inside the Jaeger container. Point the badger
`directories` (keys/values) in jaeger_userconfig under this path.

**_Type:_** string<br />

#### Default value

```YAML
jaeger_persistence_mount_path: /badger
```

### jaeger_persistence_name

Name of the PersistentVolumeClaim created when jaeger_persistence_enabled.

**_Type:_** string<br />

#### Default value

```YAML
jaeger_persistence_name: '{{ jaeger_deployment_name }}-data'
```

### jaeger_persistence_size

Requested size of the badger PersistentVolumeClaim.

**_Type:_** string<br />

#### Default value

```YAML
jaeger_persistence_size: 10Gi
```

### jaeger_persistence_storage_class

StorageClass for the badger PVC (empty = cluster default StorageClass).

**_Type:_** string<br />

#### Default value

```YAML
jaeger_persistence_storage_class: ''
```

### jaeger_persistence_volume_name

Name of the pod volume/volumeMount used for the badger PVC.

**_Type:_** string<br />

#### Default value

```YAML
jaeger_persistence_volume_name: jaeger-data
```

### jaeger_replicas

Number of pod replicas for Jaeger

**_Type:_** int<br />

#### Default value

```YAML
jaeger_replicas: 1
```

### jaeger_resources

Resource requests/limits for the Jaeger Deployment

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

### jaeger_uiconfig

Jaeger UI configuration JSON (rendered as a ConfigMap, mounted at
`/etc/jaeger/ui-config.json`). See https://www.jaegertracing.io/docs/latest/deployment/frontend-ui/

**_Type:_** dict<br />

#### Default value

```YAML
jaeger_uiconfig: {}
```

### jaeger_userconfig

Jaeger 2.x config YAML (rendered as a ConfigMap, passed to the binary
via `--config /etc/jaeger/user-config.yaml`). This is the ONLY hook to
configure storage backend (badger / ES / Cassandra), receivers, exporters,
extensions and sampling on Jaeger 2.x.

**_Type:_** dict<br />

#### Default value

```YAML
jaeger_userconfig: {}
```

#### Example usage

```YAML
jaeger_userconfig:
  service:
    extensions: [jaeger_storage, jaeger_query]
    pipelines:
      traces:
        receivers: [otlp]
        exporters: [jaeger_storage_exporter]
  extensions:
    jaeger_storage:
      backends:
        some_storage:
          badger:
            directories:
              keys: "/tmp/jaeger/keys"
              values: "/tmp/jaeger/values"
            ephemeral: true
```

## Discovered Tags

**_helm_chart_**

**_helm_repository_**

**_install_**

**_jaeger_**

**_namespace_**

**_persistence_**

**_uninstall_**

## Dependencies

None.

## License

MPL-2.0

## Author

Clément Hubert
