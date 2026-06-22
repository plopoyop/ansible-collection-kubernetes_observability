# vmoperator

Install the VictoriaMetrics Operator chart and manage its custom
resources (VMAlert, VMAlertmanager, VMAuth, VMUser, VMRule) on
Kubernetes, plus an optional rules-only install of the
victoria-metrics-k8s-stack chart for the curated VMRule set.

## Table of contents

- [Requirements](#requirements)
- [Default Variables](#default-variables)
  - [vmoperator_admission_webhooks_cert_manager_enabled](#vmoperator_admission_webhooks_cert_manager_enabled)
  - [vmoperator_admission_webhooks_enabled](#vmoperator_admission_webhooks_enabled)
  - [vmoperator_chart_version](#vmoperator_chart_version)
  - [vmoperator_default_rules_additional_group_by_labels](#vmoperator_default_rules_additional_group_by_labels)
  - [vmoperator_default_rules_chart_version](#vmoperator_default_rules_chart_version)
  - [vmoperator_default_rules_deployment_name](#vmoperator_default_rules_deployment_name)
  - [vmoperator_default_rules_enabled](#vmoperator_default_rules_enabled)
  - [vmoperator_default_rules_extra_values](#vmoperator_default_rules_extra_values)
  - [vmoperator_default_rules_groups](#vmoperator_default_rules_groups)
  - [vmoperator_default_rules_namespace](#vmoperator_default_rules_namespace)
  - [vmoperator_deployment_name](#vmoperator_deployment_name)
  - [vmoperator_disable_prometheus_converter](#vmoperator_disable_prometheus_converter)
  - [vmoperator_enable_converter_owner_references](#vmoperator_enable_converter_owner_references)
  - [vmoperator_enabled](#vmoperator_enabled)
  - [vmoperator_extra_values](#vmoperator_extra_values)
  - [vmoperator_namespace](#vmoperator_namespace)
  - [vmoperator_resources](#vmoperator_resources)
  - [vmoperator_vmalert_datasource_url](#vmoperator_vmalert_datasource_url)
  - [vmoperator_vmalert_enabled](#vmoperator_vmalert_enabled)
  - [vmoperator_vmalert_evaluation_interval](#vmoperator_vmalert_evaluation_interval)
  - [vmoperator_vmalert_image_tag](#vmoperator_vmalert_image_tag)
  - [vmoperator_vmalert_name](#vmoperator_vmalert_name)
  - [vmoperator_vmalert_namespace](#vmoperator_vmalert_namespace)
  - [vmoperator_vmalert_notifier_url](#vmoperator_vmalert_notifier_url)
  - [vmoperator_vmalert_remote_write_url](#vmoperator_vmalert_remote_write_url)
  - [vmoperator_vmalert_replicas](#vmoperator_vmalert_replicas)
  - [vmoperator_vmalert_resources](#vmoperator_vmalert_resources)
  - [vmoperator_vmalert_rule_selector](#vmoperator_vmalert_rule_selector)
  - [vmoperator_vmalert_select_all_by_default](#vmoperator_vmalert_select_all_by_default)
  - [vmoperator_vmalertmanager_config](#vmoperator_vmalertmanager_config)
  - [vmoperator_vmalertmanager_enabled](#vmoperator_vmalertmanager_enabled)
  - [vmoperator_vmalertmanager_image_tag](#vmoperator_vmalertmanager_image_tag)
  - [vmoperator_vmalertmanager_name](#vmoperator_vmalertmanager_name)
  - [vmoperator_vmalertmanager_namespace](#vmoperator_vmalertmanager_namespace)
  - [vmoperator_vmalertmanager_persistent_volume_enabled](#vmoperator_vmalertmanager_persistent_volume_enabled)
  - [vmoperator_vmalertmanager_persistent_volume_size](#vmoperator_vmalertmanager_persistent_volume_size)
  - [vmoperator_vmalertmanager_replicas](#vmoperator_vmalertmanager_replicas)
  - [vmoperator_vmalertmanager_resources](#vmoperator_vmalertmanager_resources)
  - [vmoperator_vmauth_enabled](#vmoperator_vmauth_enabled)
  - [vmoperator_vmauth_image_tag](#vmoperator_vmauth_image_tag)
  - [vmoperator_vmauth_ingress_annotations](#vmoperator_vmauth_ingress_annotations)
  - [vmoperator_vmauth_ingress_class_name](#vmoperator_vmauth_ingress_class_name)
  - [vmoperator_vmauth_ingress_enabled](#vmoperator_vmauth_ingress_enabled)
  - [vmoperator_vmauth_ingress_hostname](#vmoperator_vmauth_ingress_hostname)
  - [vmoperator_vmauth_ingress_tls_enabled](#vmoperator_vmauth_ingress_tls_enabled)
  - [vmoperator_vmauth_ingress_tls_secret_name](#vmoperator_vmauth_ingress_tls_secret_name)
  - [vmoperator_vmauth_name](#vmoperator_vmauth_name)
  - [vmoperator_vmauth_namespace](#vmoperator_vmauth_namespace)
  - [vmoperator_vmauth_replicas](#vmoperator_vmauth_replicas)
  - [vmoperator_vmauth_resources](#vmoperator_vmauth_resources)
  - [vmoperator_vmauth_select_all_by_default](#vmoperator_vmauth_select_all_by_default)
  - [vmoperator_vmauth_unauthorized_access_config](#vmoperator_vmauth_unauthorized_access_config)
  - [vmoperator_vmauth_user_selector](#vmoperator_vmauth_user_selector)
  - [vmoperator_vmauth_users](#vmoperator_vmauth_users)
- [Discovered Tags](#discovered-tags)
- [Dependencies](#dependencies)
- [License](#license)
- [Author](#author)

---

## Requirements

- Minimum Ansible version: `2.17`

## Default Variables

### vmoperator_admission_webhooks_cert_manager_enabled

Let cert-manager issue the webhook TLS cert. Set to false if cert-manager
is not installed in the cluster (the chart will generate a self-signed
cert instead).

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_admission_webhooks_cert_manager_enabled: true
```

### vmoperator_admission_webhooks_enabled

Enable admission webhooks (validation of CRs). Requires cert-manager when
the chart uses its built-in cert-manager integration for webhook TLS.

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_admission_webhooks_enabled: true
```

### vmoperator_chart_version

victoria-metrics-operator chart version

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_chart_version: 0.51.0
```

### vmoperator_default_rules_additional_group_by_labels

Extra labels added to the `by()` clause of every alert/recording rule.
Useful when the cluster label is non-default (e.g. multi-cluster setup).

**_Type:_** list<br />

#### Default value

```YAML
vmoperator_default_rules_additional_group_by_labels: []
```

### vmoperator_default_rules_chart_version

victoria-metrics-k8s-stack chart version

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_default_rules_chart_version: 0.79.0
```

### vmoperator_default_rules_deployment_name

Helm release name for the rules-only install of k8s-stack

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_default_rules_deployment_name: vm-default-rules
```

### vmoperator_default_rules_enabled

Install the curated set of VMRule resources from the `victoria-metrics-k8s-stack`
chart (rules-only mode, all subcharts disabled).

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_default_rules_enabled: false
```

### vmoperator_default_rules_extra_values

Extra helm values merged on top of the templated values. Use for chart
settings not exposed by dedicated variables (runbookUrl, custom labels,
etc.).

**_Type:_** dict<br />

#### Default value

```YAML
vmoperator_default_rules_extra_values: {}
```

### vmoperator_default_rules_groups

Per-group toggles, merged into `defaultRules.groups.<name>.create`. Use to
disable rule groups that target components absent from your cluster (e.g.
`etcd`, `kubeScheduler`, `kubeControllerManager` on a managed K8s service).

**_Type:_** dict<br />

#### Default value

```YAML
vmoperator_default_rules_groups: {}
```

#### Example usage

```YAML
vmoperator_default_rules_groups:
  etcd:
    create: false
  kubeScheduler:
    create: false
  kubeControllerManager:
    create: false
```

### vmoperator_default_rules_namespace

Namespace where the VMRule resources are created

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_default_rules_namespace: victoriametrics
```

### vmoperator_deployment_name

Helm release name for the operator

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_deployment_name: vm-operator
```

### vmoperator_disable_prometheus_converter

When false (default), VMOperator watches Prometheus Operator CRDs
(ServiceMonitor, PrometheusRule, PodMonitor) and creates equivalent
VictoriaMetrics CRDs. Set true to disable if Prometheus Operator runs
side-by-side in the same cluster.

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_disable_prometheus_converter: false
```

### vmoperator_enable_converter_owner_references

When true, the converted VM CRs have the original Prom CRs as owner
references. Recommended to keep false: deleting a PrometheusRule would
cascade-delete its VMRule, which prevents picking up the VMRule manually
afterwards.

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_enable_converter_owner_references: false
```

### vmoperator_enabled

Install the VictoriaMetrics Operator chart.

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_enabled: false
```

### vmoperator_extra_values

Extra helm values merged on top of the templated values. Use for chart
settings not exposed by dedicated variables.

**_Type:_** dict<br />

#### Default value

```YAML
vmoperator_extra_values: {}
```

### vmoperator_namespace

K8s namespace where the operator runs (CRDs are cluster-scoped).

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_namespace: victoriametrics
```

### vmoperator_resources

Resource requests and limits for the operator pod

**_Type:_** dict<br />

#### Default value

```YAML
vmoperator_resources: {}
```

### vmoperator_vmalert_datasource_url

URL of the VictoriaMetrics instance used as the datasource for rule
evaluation queries. Has no default and is required when
`vmoperator_vmalert_enabled` is true (enforced by an assert); typically the
in-cluster VM Single service deployed by the `victoriametrics` role.

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmalert_datasource_url: ''
```

#### Example usage

```YAML
vmoperator_vmalert_datasource_url: "http://vms-victoria-metrics-single-server.victoriametrics.svc.cluster.local:8428"
```

### vmoperator_vmalert_enabled

Deploy a VMAlert custom resource. Requires `vmoperator_enabled: true` in
the same cluster.

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_vmalert_enabled: false
```

### vmoperator_vmalert_evaluation_interval

Default interval at which VMAlert evaluates rule groups

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmalert_evaluation_interval: 30s
```

### vmoperator_vmalert_image_tag

VMAlert container image tag (matches a released VictoriaMetrics version)

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmalert_image_tag: v1.140.0
```

### vmoperator_vmalert_name

Name of the VMAlert custom resource

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmalert_name: vmalert
```

### vmoperator_vmalert_namespace

Namespace where the VMAlert CR is applied

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmalert_namespace: victoriametrics
```

### vmoperator_vmalert_notifier_url

URL of the Alertmanager-compatible endpoint that receives fired alerts.
Leave empty to run in blackhole mode: alerts are discarded but recording
rules still evaluate (the operator's webhook rejects a VMAlert that has
neither a notifier nor blackhole mode).

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmalert_notifier_url: ''
```

### vmoperator_vmalert_remote_write_url

URL where VMAlert writes back the evaluated recording rules (typically
the same VictoriaMetrics instance as the datasource). Leave empty to
disable remote write.

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmalert_remote_write_url: ''
```

### vmoperator_vmalert_replicas

Number of VMAlert replicas

**_Type:_** int<br />

#### Default value

```YAML
vmoperator_vmalert_replicas: 1
```

### vmoperator_vmalert_resources

Resource requests and limits for the VMAlert pods

**_Type:_** dict<br />

#### Default value

```YAML
vmoperator_vmalert_resources: {}
```

### vmoperator_vmalert_rule_selector

Label selector for VMRule / PrometheusRule resources picked up by
VMAlert. Honored only when `select_all_by_default: false`.

**_Type:_** dict<br />

#### Default value

```YAML
vmoperator_vmalert_rule_selector: {}
```

### vmoperator_vmalert_select_all_by_default

When true, VMAlert picks up every VMRule (and PrometheusRule, if the
converter is enabled) cluster-wide regardless of labels/namespace. Set
to false and use `vmoperator_vmalert_rule_selector` for scoping by label.
Default true matches the "one VMAlert per cluster" use case.

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_vmalert_select_all_by_default: true
```

### vmoperator_vmalertmanager_config

Alertmanager YAML config (routes, receivers, inhibit rules, templates).
Rendered as-is into `spec.configRawYaml` of the CR. Leave empty for the
operator's default config.

**_Type:_** dict<br />

#### Default value

```YAML
vmoperator_vmalertmanager_config: {}
```

#### Example usage

```YAML
vmoperator_vmalertmanager_config:
  route:
    receiver: "default"
  receivers:
    - name: "default"
```

### vmoperator_vmalertmanager_enabled

Deploy a VMAlertmanager custom resource. Requires the operator.

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_vmalertmanager_enabled: false
```

### vmoperator_vmalertmanager_image_tag

Alertmanager container image tag

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmalertmanager_image_tag: v0.28.1
```

### vmoperator_vmalertmanager_name

Name of the VMAlertmanager custom resource

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmalertmanager_name: vmalertmanager
```

### vmoperator_vmalertmanager_namespace

Namespace where the VMAlertmanager CR is applied

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmalertmanager_namespace: victoriametrics
```

### vmoperator_vmalertmanager_persistent_volume_enabled

Persist Alertmanager state (nflog, silences) on a PVC

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_vmalertmanager_persistent_volume_enabled: false
```

### vmoperator_vmalertmanager_persistent_volume_size

Size of the persistent volume for Alertmanager state

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmalertmanager_persistent_volume_size: 2Gi
```

### vmoperator_vmalertmanager_replicas

Number of Alertmanager replicas (HA cluster gossip mode)

**_Type:_** int<br />

#### Default value

```YAML
vmoperator_vmalertmanager_replicas: 1
```

### vmoperator_vmalertmanager_resources

Resource requests and limits for the Alertmanager pods

**_Type:_** dict<br />

#### Default value

```YAML
vmoperator_vmalertmanager_resources: {}
```

### vmoperator_vmauth_enabled

Deploy a VMAuth custom resource and its associated VMUser CRs.

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_vmauth_enabled: false
```

### vmoperator_vmauth_image_tag

VMAuth container image tag (matches a released VictoriaMetrics version)

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmauth_image_tag: v1.145.0
```

### vmoperator_vmauth_ingress_annotations

Ingress annotations (cert-manager issuer, external-dns ttl, ingress
controller middlewares, etc.). VMAuth handles authentication itself
(`VMUser` CRs), so no basic-auth middleware needed.

**_Type:_** dict<br />

#### Default value

```YAML
vmoperator_vmauth_ingress_annotations: {}
```

### vmoperator_vmauth_ingress_class_name

Ingress class name (e.g. "traefik", "nginx")

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmauth_ingress_class_name: ''
```

### vmoperator_vmauth_ingress_enabled

Expose VMAuth via Kubernetes Ingress.

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_vmauth_ingress_enabled: false
```

### vmoperator_vmauth_ingress_hostname

DNS hostname for the VMAuth Ingress

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmauth_ingress_hostname: ''
```

### vmoperator_vmauth_ingress_tls_enabled

Enable TLS on the VMAuth Ingress

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_vmauth_ingress_tls_enabled: false
```

### vmoperator_vmauth_ingress_tls_secret_name

Secret name where the Ingress TLS cert is stored

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmauth_ingress_tls_secret_name: ''
```

### vmoperator_vmauth_name

Name of the VMAuth custom resource

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmauth_name: vmauth
```

### vmoperator_vmauth_namespace

Namespace for the VMAuth CR and its child Secrets / VMUser CRs.

**_Type:_** string<br />

#### Default value

```YAML
vmoperator_vmauth_namespace: victoriametrics
```

### vmoperator_vmauth_replicas

Number of VMAuth replicas

**_Type:_** int<br />

#### Default value

```YAML
vmoperator_vmauth_replicas: 2
```

### vmoperator_vmauth_resources

Resource requests and limits for the VMAuth pods

**_Type:_** dict<br />

#### Default value

```YAML
vmoperator_vmauth_resources: {}
```

### vmoperator_vmauth_select_all_by_default

If true, VMAuth picks up every VMUser CR in the cluster (regardless of
namespace or labels). Set to false and use
`vmoperator_vmauth_user_selector` if you want scoping by label.

**_Type:_** boolean<br />

#### Default value

```YAML
vmoperator_vmauth_select_all_by_default: true
```

### vmoperator_vmauth_unauthorized_access_config

Routes available without authentication (e.g. /health, /-/ready). Each
item is a url_map dict per the VMAuth schema. Leave empty for fully
authenticated VMAuth.

**_Type:_** list<br />

#### Default value

```YAML
vmoperator_vmauth_unauthorized_access_config: []
```

#### Example usage

```YAML
vmoperator_vmauth_unauthorized_access_config:
  - src_paths: ["/health"]
    url_prefix: ["http://vms-victoria-metrics-single-server.victoriametrics.svc:8428"]
```

### vmoperator_vmauth_user_selector

Label selector for VMUser resources picked up by VMAuth. Honored only when
`select_all_by_default: false`.

**_Type:_** dict<br />

#### Default value

```YAML
vmoperator_vmauth_user_selector: {}
```

### vmoperator_vmauth_users

List of VMUser definitions. Each item creates one VMUser CR plus a
password Secret. Fields:
- name (string, required) : VMUser CR name + username
- password (string, required) : plaintext password (typically pulled
from a vault file at the inventory layer)
- target_url (string, required) : backend URL the user is allowed to
reach (e.g. the in-cluster VictoriaMetrics service)
- target_paths (list of string) : path prefixes routed to target_url.
Defaults to `["/api/v1/write"]` (write-only access).
- extra_spec (dict) : extra fields merged into the VMUser spec for
advanced cases (rate-limit, headers, max_concurrent_requests, etc.)

**_Type:_** list<br />

#### Default value

```YAML
vmoperator_vmauth_users: []
```

#### Example usage

```YAML
vmoperator_vmauth_users:
  - name: "vmagent-edge-1"
    password: "<from-vault>"
    target_url: "http://vms-victoria-metrics-single-server.victoriametrics.svc.cluster.local:8428"
    target_paths: ["/api/v1/write"]
```

## Discovered Tags

**_custom_resource_**

**_helm_chart_**

**_helm_repository_**

**_install_**

**_namespace_**

**_preflight_**

**_secret_**

**_vmoperator_**

**_vmoperator_default_rules_**

**_vmoperator_operator_**

**_vmoperator_vmalert_**

**_vmoperator_vmalertmanager_**

**_vmoperator_vmauth_**

## Dependencies

None.

## License

MPL-2.0

## Author

Clément Hubert
