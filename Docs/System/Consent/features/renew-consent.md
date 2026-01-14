# Renew / Extend Consent

## Description
Extending the validity period of an existing consent. This creates a NEW version of the consent record, preserving the history of the old one.

## Component
Consent Management

## Actors / Roles
- **Case Worker**

## Permissions
- `consent.renew`

## Scope Rules
- **Vertical Scope**.

## Preconditions
- Existing Active or Expired Consent.

## Main Flow
1.  **Actor**: Selects "Renew Consent".
2.  **Actor**: Re-confirms with Beneficiary.
3.  **Actor**: Captures New Evidence (if required by policy) or links old evidence.
4.  **System**:
    - archives `v1`.
    - creates `v2` with new dates.
    - `v2` becomes the `Active` record.

## Data Read / Written
- **ConsentRecord**: Write (New Version).

## Audit & Compliance
- **Continuity**: Ensures no gaps in legal coverage.

## Related Use Cases
- UC-12: Beneficiary Data Update

## References
- `SPEC/04-security/09-consent-and-data-sharing.md`
