# FB-001: Household Registration Form

## Purpose
Primary Data Collection Interface for registering a new Household (Beneficiary Unit) into the SCP. Used by Registrars (Field Agents).

## Scope
*   **Vertical**: Platform Core (Tenant-Wide).
*   **Target**: `Household` and `Person` entities.
*   **Workflow**: `Registration` -> `Biometric Verification` (UC-18).

## Build Instructions (Form Builder)
1.  **Create Form**: Select "New Form", Type="Registration", Scope="Global".
2.  **Section 1: Location**:
    *   Add `GPS Field`: "Household Coordinates".
    *   Add `Text Field`: "Address / Landmark".
3.  **Section 2: Head of Household**:
    *   Add `Group`: "Head Details".
    *   Add `Text`: Name, NIC.
    *   Add `Date`: DOB.
    *   Add `Biometric`: Fingerprint Capture.
4.  **Section 3: Family Members**:
    *   Add `Repeatable Group`: "Members".
    *   Fields: Name, Relation (Enum: Spouse, Child, Parent), DOB.
5.  **Bindings**: Map inputs to `Household` Entity.
6.  **Permissions**: Role=`Registrar`.
