# Configure Retention Policy

## Description
Setting rules for how long logs must be kept (e.g., "Financial logs for 7 years", "Access logs for 1 year").

## Component
Audit Logging

## Actors / Roles
- **Umbrella Authority**
- **Compliance Officer**

## Permissions
- `audit.policy.manage`

## Scope Rules
- **Tenant Scope**.

## Main Flow
1.  **Actor**: Selects Category "Financial Transactions".
2.  **Actor**: Sets Retention "7 Years".
3.  **Action**: Save.
4.  **System**: Updates automated purge/archival jobs.

## Data Read / Written
- **RetentionPolicy**: Write.

## Audit & Compliance
- **Legal**: Failure to retain is a violation; Retaining too long (GDPR) can also be a violation.

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/02-architecture/06-eventing-and-audit-architecture.md`
