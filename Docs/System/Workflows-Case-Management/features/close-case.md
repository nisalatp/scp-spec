# Close Case

## Description
Finalizing an intervention when objectives are met (Stabilized) or when the beneficiary is no longer eligible.

## Component
Workflows & Case Management

## Actors / Roles
- **Case Worker**
- **System** (Auto-closure logic)

## Permissions
- `case.close`

## Scope Rules
- **Vertical Scope**.

## Preconditions
- Case should be `Stabilized` (Best Practice) or `Active`.

## Main Flow
1.  **Actor**: Selects Case.
2.  **Action**: Close Case.
3.  **Actor**: Enters Reason "Goals Achieved" or "Moved out of District".
4.  **System**:
    - Sets `status = Closed`.
    - Stops pending payments/services.

## Data Read / Written
- **Case**: Update.

## Audit & Compliance
- **Retention**: Closed cases are kept for Audit but moved to "Cold" storage logic over time.

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/03-domain/05-case-intervention-model.md`
