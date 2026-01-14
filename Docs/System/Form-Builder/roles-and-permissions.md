# Roles & Permissions: Form Builder

## Participating Roles
- **Vertical Owner**: Designs forms for their domain (e.g., "Health Check").
- **Platform Admin**: Manages cross-cutting forms (e.g., "Registration").
- **Umbrella Authority**: Approves sensitive form changes.
- **Developer**: Commits `forms.yaml` (Code-first approach).

## Permission Matrix

| Action | Resource | Scope Conditions | Allowed Roles | Denied Roles | Notes |
|---|---|---|---|---|---|
| `create` | `form` | Vertical-Scoped | Vertical Owner | - | Within own domain |
| `publish` | `form` | Tenant | Platform Admin | - | Impacts operations |
| `view` | `form` | Tenant | All Authenticated | - | Schemas are public |
| `delete` | `form` | Any | **No** | All | Immutable history |

## Consent Interactions
- **Privacy Design**: Form Builder allows tagging fields as `PII` or `Sensitive`. This tag drives the Masking Engine at runtime.

## Deny Wins
- Standard rules.
