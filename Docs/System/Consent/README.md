# Consent Management

## Purpose
The Consent Management component acts as the digital guardian of beneficiary rights. It enforces the principle that "Ownership of Data belongs to the Beneficiary". No PII data can be accessed by a Vertical without an active, verified Consent record.

## Responsibilities
- **Capture**: Recording explicit consent with evidence (signature/photo).
- **Enforcement**: Blocking access when consent is missing, expired, or withdrawn.
- **Versioning**: Maintaining a legal audit trail of consent changes.
- **Lifecycle**: Handling Expiry, Grace Periods, and Notifications.

## In Scope / Out of Scope
**In Scope**:
- Per-Person, Per-Vertical Consent.
- Offline Capture & Sync.
- Withdrawal workflows.
- Evidence storage.

**Out of Scope**:
- Managing the text of the legal agreement (CMS function).
- "Cookies" or website tracking consent (this is for Domain Data).

## Owned Data / Owned Policies
- **Data**: `ConsentRecord`, `ConsentEvidence`.
- **Policies**: Grace Period Policy, Reminder Schedule.

## Dependent Components
- **Identity**: Links to `Person`.
- **AuthZ**: Queries Consent for every PII access.
- **Verticals**: Consent is scoped to a Vertical.

## Exposed Interfaces (APIs / Events)
- `GET /consent/{person_id}/{vertical_id}` (Check status).
- `POST /consent` (Capture).
- Event: `ConsentGrant`, `ConsentWithdrawn`, `ConsentExpired`.

## Related Diagrams (UML/C4)
- `C4/03-component.puml` (Consent Manager).
- `UML/Sequences/authz-evaluation.puml` (Shows Consent Check step).

## Related Use Cases
- **UC-01**: Emergency access (Override).
- **Registration**: Capturing initial consent.

## References
- `SPEC/04-security/09-consent-and-data-sharing.md`
