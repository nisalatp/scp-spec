# Program Manager

## Purpose
The Program Manager is responsible for the execution of a specific Program (e.g., "Flood Relief 2024") within a specific scope. Unlike a Vertical Owner who manages the entire domain, a Program Manager focuses on the delivery, KPIs, and operations of a single initiative.

## Responsibilities
- Monitor Program KPIs.
- Manage assigned Case Workers for the program.
- Review program-specific reporting.
- Ensure eligibility criteria are met.

## Associated Verticals
- **Standard Verticals**: Assigned to the Program's primary vertical.
- **Geo-Verticals**: Often scoped to a specific region (e.g., "District Coordinator").

## Scope Rules
- **Tenant scope**: Tenant-wide.
- **Geo scope**: Assigned Geo Node.
- **Vertical scope**: Primary Vertical of the Program.
- **Program scope**: **Strictly limited** to assigned Program(s).

## Permissions Summary
- **Allowed**: `program.read`, `report.view`, `case.view` (program context), `case.verify` (escalated).
- **Denied**: `policy.*`, `program.create` (Vertical Owner task).
- **Conditional**: Cannot view cases in the same vertical that are NOT part of their program (Program Scope enforcement).

## Data Access Boundaries
- **PII access**: Yes, for enrolled beneficiaries.
- **Sensitive health data**: Only if Program is Health-related.
- **Audit log visibility**: None.

## Consent Requirements
- Beneficiary must have consented to the Program (often implicit in Vertical consent or explicit enrollment).

## Audit Expectations
- KPI reviews and exports are logged.

## Typical Workflows / Use Cases
- **KPI Review**: Checking "Number of Kits Distributed" vs "Target".
- **Escalation**: Approving a case flagged by a Case Worker.

## Edge Cases
- Program ends (Active Until passed): Role essentially becomes read-only history.

## References
- `SPEC/03-domain/04-program-model.md`
