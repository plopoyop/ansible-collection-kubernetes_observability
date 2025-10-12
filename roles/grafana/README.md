# grafana

Install and configure Grafana on kubernetes

## Table of content

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [grafana_admin_password](#grafana_admin_password)
  - [grafana_admin_user](#grafana_admin_user)
  - [grafana_alerting](#grafana_alerting)
  - [grafana_chart_version](#grafana_chart_version)
  - [grafana_dashboard_providers](#grafana_dashboard_providers)
  - [grafana_dashboards](#grafana_dashboards)
  - [grafana_datasources](#grafana_datasources)
  - [grafana_deployment_name](#grafana_deployment_name)
  - [grafana_enabled](#grafana_enabled)
  - [grafana_ingress_annotations](#grafana_ingress_annotations)
  - [grafana_ingress_class_name](#grafana_ingress_class_name)
  - [grafana_ingress_enabled](#grafana_ingress_enabled)
  - [grafana_ingress_hostname](#grafana_ingress_hostname)
  - [grafana_ingress_labels](#grafana_ingress_labels)
  - [grafana_ingress_tls_enabled](#grafana_ingress_tls_enabled)
  - [grafana_ingress_tls_secret_name](#grafana_ingress_tls_secret_name)
  - [grafana_ini](#grafana_ini)
  - [grafana_namespace](#grafana_namespace)
  - [grafana_notifiers](#grafana_notifiers)
  - [grafana_plugins](#grafana_plugins)
  - [grafana_replicas](#grafana_replicas)
  - [grafana_resources](#grafana_resources)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.1`


## Default Variables

### grafana_admin_password

Password for Grafana admin user

### grafana_admin_user

Grafana admin user

#### Default value

```YAML
grafana_admin_user: admin
```

### grafana_alerting

Configure grafana alerting
ref: https://docs.grafana.com/alerting/set-up/provision-alerting-resources/file-provisioning/

#### Default value

```YAML
grafana_alerting: {}
```

### grafana_chart_version

Grafana chart version

#### Default value

```YAML
grafana_chart_version: 10.1.0
```

### grafana_dashboard_providers

Configure grafana dashboard providers
ref: http://docs.grafana.org/administration/provisioning/#dashboards

#### Default value

```YAML
grafana_dashboard_providers: {}
```

#### Example usage

```YAML
grafana_dashboard_providers
  dashboardproviders.yaml:
    apiVersion: 1
    providers:
    - name: 'default'
      orgId: 1
      folder: ''
      type: file
      disableDeletion: false
      editable: true
      options:
        path: /var/lib/grafana/dashboards/default
```

### grafana_dashboards

Configure grafana dashboard to import
ref: https://grafana.com/dashboards

#### Default value

```YAML
grafana_dashboards: {}
```

#### Example usage

```YAML
grafana_dashboards:
  default:
    some-dashboard:
      json: |
        $RAW_JSON
    custom-dashboard:
      file: dashboards/custom-dashboard.json
    prometheus-stats:
      gnetId: 2
      revision: 2
      datasource: Prometheus
```

### grafana_datasources

Configure grafana datasources
ref: http://docs.grafana.org/administration/provisioning/#datasources

#### Default value

```YAML
grafana_datasources: {}
```

#### Example usage

```YAML
grafana_datasources:
  apiVersion: 1
  datasources:
  - name: Prometheus
    type: prometheus
    url: http://prometheus-prometheus-server
    access: proxy
    isDefault: true
  - name: CloudWatch
    type: cloudwatch
    access: proxy
    uid: cloudwatch
    editable: false
    jsonData:
      authType: default
      defaultRegion: us-east-1
  deleteDatasources: []
  - name: Prometheus
```

### grafana_deployment_name

Grafana deployment name

#### Default value

```YAML
grafana_deployment_name: grafana
```

### grafana_enabled

Install Grafana chart

#### Default value

```YAML
grafana_enabled: true
```

### grafana_ingress_annotations

Annotations for Grafana ingress

#### Example usage

```YAML
grafana_ingress_annotations:
  kubernetes.io/ingress.class: "{{ grafana_ingress_class_name }}"
  kubernetes.io/tls-acme: "{{ grafana_ingress_tls_enabled }}"
```

### grafana_ingress_class_name

Ingress classname for Grafana

### grafana_ingress_enabled

Enable ingress for Grafana

#### Default value

```YAML
grafana_ingress_enabled: false
```

### grafana_ingress_hostname

Hostname for Grafana ingress

### grafana_ingress_labels

Labels for Grafana ingress

#### Example usage

```YAML
grafana_ingress_labels:
  app: grafana
```

### grafana_ingress_tls_enabled

Enable TLS for Grafana ingress

#### Default value

```YAML
grafana_ingress_tls_enabled: false
```

### grafana_ingress_tls_secret_name

Secret name for Grafana TLS certificate

### grafana_ini

Grafana's primary configuration
ref: http://docs.grafana.org/installation/configuration/

#### Default value

```YAML
grafana_ini: {}
```

#### Example usage

```YAML
grafana_ini:
  plugins:
   allow_loading_unsigned_plugins: victoriametrics-datasource
```

### grafana_namespace

K8s namespace to install Grafana chart

#### Default value

```YAML
grafana_namespace: grafana
```

### grafana_notifiers

Configure notifiers
ref: http://docs.grafana.org/administration/provisioning/#alert-notification-channels

#### Default value

```YAML
grafana_notifiers: {}
```

#### Example usage

```YAML
grafana_notifiers:
  notifiers.yaml:
    notifiers:
    - name: email-notifier
      type: email
      uid: email1
      # either:
      org_id: 1
      # or
      org_name: Main Org.
      is_default: true
      settings:
        addresses: an_email_address@example.com
```

### grafana_plugins

Grafana plugins to install

#### Default value

```YAML
grafana_plugins: []
```

#### Example usage

```YAML
grafana_plugins:
  - digrich-bubblechart-panel
  - grafana-clock-panel
```

### grafana_replicas

Number of pod replicas for Grafana

#### Default value

```YAML
grafana_replicas: 1
```

### grafana_resources

Annotations for Grafana ingress

#### Default value

```YAML
grafana_resources: {}
```

#### Example usage

```YAML
grafana_resources:
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 100m
    memory: 128Mi
```



## Dependencies

None.

## License

MLP2

## Author

Clément Hubert
