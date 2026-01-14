# Scope & Governance: Notifications & Email

## Scope Rules

### 1. Tenant Isolation
- Notification Service runs in the context of a Tenant.
- Sending via "Sri Lanka SMTP" for "India Tenant" is impossible (Credentials are siloed).

## Governance Examples
1.  **Allowed**: System sends "Password Reset" to Staff (Administrative, implies consent).
2.  **Denied**: System sends "Health Tips" to Person P who withdrew consent (Marketing/Info, requires consent).
3.  **Allowed**: System sends "Emergency Flood Warning" (Override allowed by Safety Policy).

## Governance Logic
- **Rate Limiting**: To prevent spam/bill-shock, tenants have quotas (e.g., 1000 SMS/day).
