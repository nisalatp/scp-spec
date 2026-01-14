# Request Access

## Description
An external entity (NGO, Researcher) applying for permission to access specific SCP resources (e.g., "Anonymized Health Data for Research").

## Component
Marketplace Access

## Actors / Roles
- **External Partner**
- **Tenant Admin** (Proxy)

## Permissions
- `access.request` (Public/Portal)

## Scope Rules
- **Vertical Scope**: Request must specify which Vertical data is needed.

## Preconditions
- Organization must be verified (KYC).

## Main Flow
1.  **Actor**: Fills "Data Access Application".
2.  **Actor**: Selects Vertical "Health".
3.  **Actor**: Defines Purpose "Malaria Study 2024".
4.  **Actor**: Agrees to "Data Use Policy".
5.  **Action**: Submit.
6.  **System**: Sets `status = Requested`.

## Data Read / Written
- **AccessRequest**: Write.

## Related Use Cases
- UC-01: System Setup

## References
- `SPEC/03-domain/12-marketplace-access-model.md`
