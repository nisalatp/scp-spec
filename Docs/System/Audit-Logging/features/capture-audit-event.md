# Capture Audit Event (Trace)

## Description
The automated recording of "Who did what". This is invoked by every other component (Auth, Case, Finance) whenever a state change occurs.

## Component
Audit Logging

## Actors / Roles
- **System** (Internal Service)

## Permissions
- `audit.write` (Service Account Only)

## Scope Rules
- **Universal**: All domains must report here.

## Main Flow
1.  **Event**: User "Saman" approves Case #123.
2.  **Source System**: Emits Event `CaseApproved`.
3.  **Audit Service**:
    - Receives Event.
    - Enriches with Tenant "LK", Vertical "Health".
    - Standardizes Format.
    - Writes to Immutable Storage.

## Data Read / Written
- **AuditLogEntry**: Write.

## Audit & Compliance
- **Integrity**: Logs must be Tamper-Evident (Hash Chained).

## Related Use Cases
- **All**.

## References
- `SPEC/02-architecture/06-eventing-and-audit-architecture.md`
