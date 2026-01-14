# Scope & Governance: Form Builder

## Scope Rules

### 1. Vertical Scope
- A Health Form belongs to the Health Vertical.
- Education Vertical cannot modify Health Forms.

## Governance Examples
1.  **Allowed**: Health Director adds "Blood Type" to "Health Profile" form.
2.  **Denied**: Education Director tries to delete "National ID" from "Registration" form (Core Form).
3.  **Allowed**: Version `v2` replaces `v1`. `v1` remains "Active" for legacy cases until explicit deprecation.

## Governance Logic
- **Approvals**: Significant changes (removing fields, adding PII) require Approval Workflow triggered by the Builder.
