# Field Agent

## Description
The **Field Agent** is the primary user of the mobile application. They operate in the field (often offline) to identify households, register beneficiaries, conduct surveys, and deliver services.

## Responsibilities
- **Data Collection**: Registering Households and Persons.
- **Service Delivery**: Recording visits and distributing benefits.
- **Verification**: Verifying identities and claims in the field.

## Access Scope
- **Scope**: Specific Geo Locations (e.g., Assigned Villages/Districts).

## Mapped Features & Permissions

| Component | Feature | Permissions |
| :--- | :--- | :--- |
| **Field Operations** | [Manage Agent Profile](../../Docs/System/Field-Operations/features/manage-agent-profile.md) | `profile.view` |
| **Field Operations** | [Execute Field Visit](../../Docs/System/Field-Operations/features/execute-field-visit.md) | `visit.execute` |
| **Field Operations** | [Offline Sync](../../Docs/System/Field-Operations/features/offline-sync.md) | `sync.perform` |
| **Identity (Person & Household)** | [Register Household](../../Docs/System/Identity/features/register-household.md) | `household.create` |
| **Identity (Person & Household)** | [Manage Membership](../../Docs/System/Identity/features/manage-membership.md) | `member.add`, `member.remove` |
| **Workflows & Case Management** | [Create Case](../../Docs/System/Workflows-Case-Management/features/create-case.md) | `case.create` |
| **Facility Registry** | [Register Facility](../../Docs/System/Facility-Registry/features/register-facility.md) | `facility.create` (if permitted) |

## Key Workflows
1.  **House-to-House Survey**: Registering all households in an assigned village using the mobile app.
2.  **Emergency Response**: Distributing aid packs and recording the transaction via scanning a QR code.
3.  **Case Follow-up**: Visiting a flagged household to verify children's school attendance.
