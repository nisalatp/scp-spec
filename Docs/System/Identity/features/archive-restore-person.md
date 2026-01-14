# Archive / Restore Person

## Description
Soft-deleting a person record (e.g., Deceased, Created in Error). Restoring requires high-level privileges.

## Component
Identity (Person Registry)

## Actors / Roles
- **Case Worker** (Archive/Mark Deceased)
- **Tenant Admin** (Restore)

## Permissions
- `person.archive`
- `person.restore`

## Scope Rules
- **Geo Scope**.

## Main Flow (Archive)
1.  **Case Worker**: Selects "Mark as Deceased".
2.  **System**: Sets `status = Deceased`.
3.  **System**: Stops all future benefits calculation.

## Main Flow (Restore)
1.  **Tenant Admin**: Views "Archived" list.
2.  **Action**: Clicks "Restore".
3.  **System**: Sets `status = Verified`. Audit Log "Restored by Admin".

## Data Read / Written
- **Person**: Update Status.

## Audit & Compliance
- **Right to be Forgotten**: Archival is usually sufficient, but GDPR may require "Anonymization" (Scrubbing PII) which is a distinct 'Purge' feature.

## Related Use Cases
- UC-90: Death Registration

## References
- `SPEC/06-platform-core/03-person-registry.md`
