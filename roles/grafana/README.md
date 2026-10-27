# grafana

Install and configure Grafana on kubernetes

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [grafana_admin_password](#grafana_admin_password)
  - [grafana_admin_user](#grafana_admin_user)
  - [grafana_alerting](#grafana_alerting)
  - [grafana_api_url](#grafana_api_url)
  - [grafana_api_validate_certs](#grafana_api_validate_certs)
  - [grafana_chart_version](#grafana_chart_version)
  - [grafana_dashboard_providers](#grafana_dashboard_providers)
  - [grafana_dashboards](#grafana_dashboards)
  - [grafana_datasources](#grafana_datasources)
  - [grafana_deployment_name](#grafana_deployment_name)
  - [grafana_enabled](#grafana_enabled)
  - [grafana_extra_helm_values](#grafana_extra_helm_values)
  - [grafana_ingress_annotations](#grafana_ingress_annotations)
  - [grafana_ingress_class_name](#grafana_ingress_class_name)
  - [grafana_ingress_enabled](#grafana_ingress_enabled)
  - [grafana_ingress_hostname](#grafana_ingress_hostname)
  - [grafana_ingress_labels](#grafana_ingress_labels)
  - [grafana_ingress_tls_enabled](#grafana_ingress_tls_enabled)
  - [grafana_ingress_tls_secret_name](#grafana_ingress_tls_secret_name)
  - [grafana_ini](#grafana_ini)
  - [grafana_mcp_chart_version](#grafana_mcp_chart_version)
  - [grafana_mcp_deployment_name](#grafana_mcp_deployment_name)
  - [grafana_mcp_disable_write](#grafana_mcp_disable_write)
  - [grafana_mcp_disabled_categories](#grafana_mcp_disabled_categories)
  - [grafana_mcp_enabled](#grafana_mcp_enabled)
  - [grafana_mcp_extra_args](#grafana_mcp_extra_args)
  - [grafana_mcp_extra_helm_values](#grafana_mcp_extra_helm_values)
  - [grafana_mcp_grafana_url](#grafana_mcp_grafana_url)
  - [grafana_mcp_resources](#grafana_mcp_resources)
  - [grafana_mcp_server_auth_enabled](#grafana_mcp_server_auth_enabled)
  - [grafana_mcp_service_account_name](#grafana_mcp_service_account_name)
  - [grafana_mcp_service_account_role](#grafana_mcp_service_account_role)
  - [grafana_mcp_token_secret_name](#grafana_mcp_token_secret_name)
  - [grafana_namespace](#grafana_namespace)
  - [grafana_notifiers](#grafana_notifiers)
  - [grafana_plugins](#grafana_plugins)
  - [grafana_replicas](#grafana_replicas)
  - [grafana_resources](#grafana_resources)
  - [grafana_service_accounts](#grafana_service_accounts)
  - [grafana_wait_install](#grafana_wait_install)
- [Discovered Tags](#discovered-tags)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.17`

## Default Variables

### grafana_admin_password

Password for Grafana admin user

**_Type:_** string<br />

### grafana_admin_user

Grafana admin user

**_Type:_** string<br />

#### Default value

```YAML
grafana_admin_user: admin
```

### grafana_alerting

Configure grafana alerting
ref: https://docs.grafana.com/alerting/set-up/provision-alerting-resources/file-provisioning/

**_Type:_** dict<br />

#### Default value

```YAML
grafana_alerting: {}
```

### grafana_api_url

Grafana base URL reachable from the Ansible controller, used to manage service accounts through the HTTP API.
Defaults to the ingress hostname when the ingress is enabled; must be set otherwise.

**_Type:_** string<br />

#### Default value

```YAML
grafana_api_url: "{{ (('https://' if grafana_ingress_tls_enabled else 'http://') ~ grafana_ingress_hostname) if grafana_ingress_enabled else '' }}"
```

#### Example usage

```YAML
grafana_api_url: "https://grafana.example.com"
```

### grafana_api_validate_certs

Validate the TLS certificate of grafana_api_url

**_Type:_** boolean<br />

#### Default value

```YAML
grafana_api_validate_certs: true
```

### grafana_chart_version

Grafana chart version

**_Type:_** string<br />

#### Default value

```YAML
grafana_chart_version: 14.0.1
```

### grafana_dashboard_providers

Configure grafana dashboard providers
ref: http://docs.grafana.org/administration/provisioning/#dashboards

**_Type:_** dict<br />

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

**_Type:_** dict<br />

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

**_Type:_** dict<br />

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

**_Type:_** string<br />

#### Default value

```YAML
grafana_deployment_name: grafana
```

### grafana_enabled

Install Grafana chart

**_Type:_** boolean<br />

#### Default value

```YAML
grafana_enabled: true
```

### grafana_extra_helm_values

Extra Helm values to pass chart-level fields not covered by a dedicated variable

**_Type:_** dict<br />

#### Default value

```YAML
grafana_extra_helm_values: {}
```

#### Example usage

```YAML
grafana_extra_helm_values:
  assertNoLeakedSecrets: false
  envFromSecret: "grafana-oauth-env"
```

### grafana_ingress_annotations

Annotations for Grafana ingress

**_Type:_** dict<br />

#### Example usage

```YAML
grafana_ingress_annotations:
  kubernetes.io/ingress.class: "{{ grafana_ingress_class_name }}"
  kubernetes.io/tls-acme: "{{ grafana_ingress_tls_enabled }}"
```

### grafana_ingress_class_name

Ingress classname for Grafana

**_Type:_** string<br />

### grafana_ingress_enabled

Enable ingress for Grafana

**_Type:_** boolean<br />

#### Default value

```YAML
grafana_ingress_enabled: false
```

### grafana_ingress_hostname

Hostname for Grafana ingress

**_Type:_** string<br />

### grafana_ingress_labels

Labels for Grafana ingress

**_Type:_** dict<br />

#### Example usage

```YAML
grafana_ingress_labels:
  app: grafana
```

### grafana_ingress_tls_enabled

Enable TLS for Grafana ingress

**_Type:_** boolean<br />

#### Default value

```YAML
grafana_ingress_tls_enabled: false
```

### grafana_ingress_tls_secret_name

Secret name for Grafana TLS certificate

**_Type:_** string<br />

### grafana_ini

Grafana's primary configuration
ref: http://docs.grafana.org/installation/configuration/

**_Type:_** dict<br />

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

### grafana_mcp_chart_version

Grafana MCP chart version

**_Type:_** string<br />

#### Default value

```YAML
grafana_mcp_chart_version: 0.33.0
```

### grafana_mcp_deployment_name

Grafana MCP Helm release name

**_Type:_** string<br />

#### Default value

```YAML
grafana_mcp_deployment_name: grafana-mcp
```

### grafana_mcp_disable_write

Disable MCP write tools (create/update operations)

**_Type:_** boolean<br />

#### Default value

```YAML
grafana_mcp_disable_write: true
```

### grafana_mcp_disabled_categories

MCP tool categories to disable

**_Type:_** list<br />

#### Default value

```YAML
grafana_mcp_disabled_categories: []
```

#### Example usage

```YAML
grafana_mcp_disabled_categories:
  - "oncall"
  - "incident"
  - "sift"
```

### grafana_mcp_enabled

Install the Grafana MCP server (grafana-mcp chart) next to Grafana, without ingress.
A dedicated service account and its token Secret are created automatically. Setting it back to false
uninstalls the release and deletes the service account and its token.

**_Type:_** boolean<br />

#### Default value

```YAML
grafana_mcp_enabled: false
```

### grafana_mcp_extra_args

Extra mcp-grafana command line arguments, appended after the streamable-http transport flag

**_Type:_** list<br />

#### Default value

```YAML
grafana_mcp_extra_args: []
```

#### Example usage

```YAML
grafana_mcp_extra_args:
  - "--allowed-hosts=localhost:18000,127.0.0.1:18000"
```

### grafana_mcp_extra_helm_values

Extra Helm values for the grafana-mcp chart

**_Type:_** dict<br />

#### Default value

```YAML
grafana_mcp_extra_helm_values: {}
```

### grafana_mcp_grafana_url

In-cluster Grafana URL used by the MCP server. The default follows the Grafana chart fullname rule;
override it when using `fullnameOverride` or a custom service port.

**_Type:_** string<br />

#### Default value

```YAML
grafana_mcp_grafana_url: http://{{ grafana_deployment_name if 'grafana' in grafana_deployment_name else grafana_deployment_name ~ '-grafana' }}.{{ grafana_namespace }}.svc:80
```

### grafana_mcp_resources

Resources for the MCP server pod

**_Type:_** dict<br />

#### Default value

```YAML
grafana_mcp_resources: {}
```

#### Example usage

```YAML
grafana_mcp_resources:
  limits:
    memory: 256Mi
  requests:
    cpu: 50m
    memory: 64Mi
```

### grafana_mcp_server_auth_enabled

Require a bearer token on the MCP HTTP endpoint. The chart generates the token once and keeps it
in the `<grafana_mcp_deployment_name>` Secret (key `server-token`).

**_Type:_** boolean<br />

#### Default value

```YAML
grafana_mcp_server_auth_enabled: true
```

### grafana_mcp_service_account_name

Name of the Grafana service account used by the MCP server

**_Type:_** string<br />

#### Default value

```YAML
grafana_mcp_service_account_name: grafana-mcp
```

### grafana_mcp_service_account_role

Grafana role of the MCP service account (Viewer, Editor, Admin)

**_Type:_** string<br />

#### Default value

```YAML
grafana_mcp_service_account_role: Viewer
```

### grafana_mcp_token_secret_name

Kubernetes Secret (in grafana_namespace) holding the MCP service account token

**_Type:_** string<br />

#### Default value

```YAML
grafana_mcp_token_secret_name: grafana-mcp-token
```

### grafana_namespace

K8s namespace to install Grafana chart

**_Type:_** string<br />

#### Default value

```YAML
grafana_namespace: grafana
```

### grafana_notifiers

Configure notifiers
ref: http://docs.grafana.org/administration/provisioning/#alert-notification-channels

**_Type:_** dict<br />

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

**_Type:_** list<br />

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

**_Type:_** int<br />

#### Default value

```YAML
grafana_replicas: 1
```

### grafana_resources

Annotations for Grafana ingress

**_Type:_** dict<br />

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

### grafana_service_accounts

Grafana service accounts managed through the API (admin basic auth).
`role` is one of Viewer, Editor, Admin, None (default Viewer), `state` is present or absent (default present).
With `token`, a token is created once and stored in a Kubernetes Secret; it is recreated only when the Secret
is missing or the token has expired. The token value is never printed.
On renewal the old token is revoked before the new one is created: consumers get 401 errors until they
reload the Secret (the MCP pod is restarted automatically in the same run).
Management is partial: an account removed from the list is left untouched in Grafana, along with its
Secret. Set `state: absent` to delete it.

**_Type:_** list<br />

#### Default value

```YAML
grafana_service_accounts: []
```

#### Example usage

```YAML
grafana_service_accounts:
  - name: "claude-ro"
    role: "Viewer"
  - name: "ci-dashboards"
    role: "Editor"
    token:
      secret_name: "grafana-ci-token"
      secret_namespace: "ci"
      secret_key: "token"
      seconds_to_live: 7776000
  - name: "legacy"
    state: "absent"
```

### grafana_wait_install

Wait for the Grafana helm release to be ready. Enabled by default only when service accounts
(or the MCP server) are managed, since their API calls need a running Grafana.

**_Type:_** boolean<br />

#### Default value

```YAML
grafana_wait_install: '{{ grafana_service_accounts | length > 0 or grafana_mcp_enabled }}'
```

## Discovered Tags

**_always_**

**_helm_chart_**

**_helm_repository_**

**_manifest_**

**_namespace_**

## Dependencies

None.

## License

MPL-2.0

## Author

Clément Hubert
