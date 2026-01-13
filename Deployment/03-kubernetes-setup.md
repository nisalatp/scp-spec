# 03 Kubernetes Setup

This section sets up the Kubernetes environment for SCP.

## 1. Create Namespaces

Use separate namespaces:

- `scp-core`
- `scp-keycloak`
- `scp-monitoring`

## 2. Storage Classes

Create storage classes for:

- PostgreSQL (fast persistent storage)
- Object storage gateway (if used inside cluster)
- Logs and audit storage (append only)

## 3. Network Policies

Apply network policies to:

- Isolate Keycloak from general pods
- Allow SCP API to reach Keycloak
- Block cross namespace traffic by default

## 4. Ingress

Set up ingress with TLS:

- `api.<domain>` for SCP API
- `auth.<domain>` for Keycloak

## 5. Observability

Deploy basic monitoring:

- Metrics (Prometheus or equivalent)
- Logs (centralized log store)
- Tracing (optional)

## Checklist

- Namespaces created
- Storage classes ready
- Network policies applied
- Ingress works with TLS
- Monitoring deployed
