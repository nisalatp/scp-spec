# 01 Prerequisites

This section lists the minimum requirements before deployment.

## 1. Access and Accounts

- Cloud provider account with billing enabled.
- Kubernetes cluster admin access.
- DNS control for the target domain.
- SMTP service credentials for outbound email.
- Keycloak admin account (created during setup).
- Object storage for attachments (S3 compatible or equivalent).

## 2. Tools You Must Install

Install these tools on your workstation:

- `kubectl`
- `helm`
- `docker`
- `git`

Optional but helpful:

- `psql` (PostgreSQL client)
- `k9s` (Kubernetes UI)

## 3. Information You Must Collect

Prepare these values before starting:

- Target domain name (example: `api.scp.gov`)
- TLS certificate strategy (managed or manual)
- Data residency region for each tenant
- SMTP host, port, username, password
- Keycloak domain (example: `auth.scp.gov`)
- Root account email addresses (for hashing in SCP config)

## 4. Policy and Governance Inputs

Confirm these with the governance team:

- Tenant creation approval process
- Vertical ownership assignments
- Consent text templates per vertical
- Audit log retention period

## Checklist

- All required accounts created
- All tools installed and working
- All required values recorded
- Governance approvals confirmed
