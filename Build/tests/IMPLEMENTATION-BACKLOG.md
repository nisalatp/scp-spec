# System Implementation Backlog

This backlog maps the system components and features to implementation-ready tasks with traceability to Use Cases and Permissions.

## Epic: Identity (Person & Household)
| Feature | Acceptance Criteria | UC Reference | Roles/Permissions |
| :--- | :--- | :--- | :--- |
| **Register Person** | - Supports offline capture.<br>- Captures PII, Biometrics, and Consent.<br>- Performs deduplication logic. | UC-101 | Agent, Worker / `person.create` |
| **Register Household** | - Captures GPS coordinates.<br>- Links multiple Persons to a single Household ID. | UC-101 | Field Agent / `household.create` |
| **Verify Identity** | - Transition status from `PROVISIONAL` to `VERIFIED`.<br>- Manual review of deduplication conflicts. | UC-101 | Case Worker / `person.verify` |

## Epic: Workflows & Case Management
| Feature | Acceptance Criteria | UC Reference | Roles/Permissions |
| :--- | :--- | :--- | :--- |
| **Define Program** | - Configurable eligibility criteria.<br>- Links to a specific Vertical. | UC-102 | Program Manager / `program.create` |
| **Approve Program** | - Multi-stage authorization workflow.<br>- Final launch status update. | UC-102 | Vertical Owner / `program.approve` |
| **Process Case** | - State machine transitions (Pending -> Approved).<br>- Automated task assignment to workers. | UC-103 | Case Worker / `case.update` |

## Epic: Finance & Disbursements
| Feature | Acceptance Criteria | UC Reference | Roles/Permissions |
| :--- | :--- | :--- | :--- |
| **Authorize Payment** | - Verify budget availability.<br>- Digital signature of payment batch. | UC-104 | Finance Manager / `budget.authorize` |
| **Record Disbursement**| - Append to immutable payment ledger.<br>- Generate receipt notification. | UC-104 | System / `finance.record` |

## Epic: Integrations Layer
| Feature | Acceptance Criteria | UC Reference | Roles/Permissions |
| :--- | :--- | :--- | :--- |
| **Register Partner** | - Profile creation with whitelist of allowed scopes. | UC-105 | Tenant Admin / `integration.register` |
| **Configure Webhook** | - Endpoint URL and secret signing key setup. | UC-105 | Integration Mgr / `webhook.configure` |

## Epic: Platform Core
| Feature | Acceptance Criteria | UC Reference | Roles/Permissions |
| :--- | :--- | :--- | :--- |
| **Audit Log Search** | - Filter by Actor, Resource, and Timestamp.<br>- Export to CSV/PDF for compliance. | - | Auditor / `audit.view-all` |
| **Consent PIP** | - Backend interceptor that blocks PII access without valid consent. | - | System / `consent.verify` |
