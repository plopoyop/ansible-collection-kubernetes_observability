# Ansible Collection Observability for Kubernetes - plopoyop.kubernetes_observability

## Description

This Ansible collection provides a set of roles to install and configure various observability tools on a Kubernetes cluster using their helm charts. The goal is to simplify and automate the deployment of these tools using Ansible.

## Contents

This collection includes multiple Ansible roles designed to install and configure essential tools for a Kubernetes cluster. Each role is designed to be as configurable as possible while providing default settings tailored to my specific usage.

## Disclaimer

The roles provided in this collection are developed based on my usage of the tools and my specific needs. While configuration options are available to adjust their behavior, not all possible options are necessarily supported.

Before using this collection in production, ensure that the default configurations meet your needs and adjust them if necessary.

## Prerequisites

- Ansible >= 2.9
- A running Kubernetes cluster
- Administrator access to cluster nodes (if required for certain installations)

## Installation

To install this collection, use the following command:

```sh
ansible-galaxy collection install plopoyop.kubernetes_observability
```

## Usage

You can call the roles from this collection in your Ansible playbooks as follows:

```yaml
- name: Install a tool on Kubernetes
  hosts: localhost
  roles:
    - role: plopoyop.kubernetes_observability.role_name
      vars:
        config_option: value
```

## Collection content
### List of Roles and Helm Chart Versions

| Role Name       | Helm Chart Version | Role Tag                                      | README Link                                 |
| ---------       | ------------------ | --------------------------------------------- | ------------------------------------        |
| grafana | v12.4.8      | `grafana`                                     | [View README](roles/grafana/README.md) |
| jaeger | v4.11.1      | `jaeger`                                      | [View README](roles/jaeger/README.md) |
| opentelemetry k8s stack | v0.16.0      | `opentelemetry`                               | [View README](roles/opentelemetry/README.md) |
| loki | v17.4.7      | `loki`                                        | [View README](roles/loki/README.md) |
| victoriametrics single | v0.40.1      | `victoriametrics` / `victoriametrics_single`  | [View README](roles/victoriametrics/README.md) |
| vmagent | v0.41.2      | `victoriametrics` / `victoriametrics_vmagent` | [View README](roles/victoriametrics/README.md) |
| victorialogs single | v0.13.8      | `victorialogs`                                | [View README](roles/victorialogs/README.md) |

### Tags

Every role in this collection ships tagged tasks so you can selectively run only what you need with `ansible-playbook --tags` or skip parts with `--skip-tags`.

Three kinds of tags are exposed:

- **Role tag** — named after the role itself (e.g. `grafana`, `jaeger`, `loki`, `opentelemetry`, `victorialogs`, `victoriametrics`). Use it to scope a run to a single tool. The `victoriametrics` role additionally exposes the sub-tags `victoriametrics_single` and `victoriametrics_vmagent` to target each component independently.
- **Action tag** — `install` or `uninstall`. The role's `*_enabled` variable controls which one runs:
  - When `<role>_enabled: true`, the setup tasks (tagged `install`) are executed.
  - When `<role>_enabled: false`, the cleanup tasks (tagged `uninstall`) are executed.
- **Task-type tag** — applied per task to scope a run to a specific phase (e.g. only create the namespace, only upgrade CRDs):

  | Tag               | Applied to                                                                                                  |
  | ----------------- | ----------------------------------------------------------------------------------------------------------- |
  | `namespace`       | Namespace creation/deletion                                                                                 |
  | `helm_repository` | Adding/removing helm repositories                                                                           |
  | `helm_chart`      | Helm chart install/upgrade/uninstall (and related `helm_info`)                                              |
  | `crds`            | CRD upgrade tasks (e.g. OpenTelemetry `upgrade_crd.yml`)                                                    |
  | `manifest`        | Other Kubernetes resources (e.g. OpenTelemetry Instrumentation custom resources)                            |

  Pure helper tasks (`set_fact`, `pause`, `uri` validations) carry only the role + action tags so they run alongside any phase that needs them.

> **Note:** the `victoriametrics` role only exposes the `install` action tag (no cleanup flow is provided) and is driven by two separate variables: `victoriametrics_single_enabled` and `victoriametrics_vmagent_enabled`.

#### Examples

Install only Grafana:

```sh
ansible-playbook playbook.yml --tags "grafana,install"
```

Install only the VictoriaMetrics vmagent component:

```sh
ansible-playbook playbook.yml --tags "victoriametrics_vmagent,install"
```

Run install actions for every role:

```sh
ansible-playbook playbook.yml --tags "install"
```

Uninstall only Loki (requires `loki_enabled: false`):

```sh
ansible-playbook playbook.yml --tags "loki,uninstall"
```

Run everything except OpenTelemetry:

```sh
ansible-playbook playbook.yml --skip-tags "opentelemetry"
```

Prepare prerequisites only (create namespace + add helm repo) without installing the chart, e.g. for Grafana:

```sh
ansible-playbook playbook.yml --tags "grafana,namespace,helm_repository"
```

Upgrade only the OpenTelemetry CRDs (skip the helm release and instrumentation manifests):

```sh
ansible-playbook playbook.yml --tags "opentelemetry,crds"
```

Uninstall Loki but keep its namespace:

```sh
ansible-playbook playbook.yml --tags "loki,uninstall" --skip-tags "namespace"
```

## Customization

Each role exposes variables to adjust the configuration of the installed tools. Refer to each role's documentation for available variables.

## Contributions

Contributions are welcome! Feel free to open issues or submit pull requests to improve the roles and add new features.

## Tools
[Devbox](https://www.jetify.com/docs/devbox) is used to make reproducible development environments
[Task](https://taskfile.dev/) as a task runner
[Renovate](https://github.com/renovatebot/renovate) to update dependencies

## License

This collection is distributed under the Mozilla Public License Version 2.0 license.
