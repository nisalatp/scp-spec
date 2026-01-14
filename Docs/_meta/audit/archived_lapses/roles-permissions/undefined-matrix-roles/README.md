# Lapse: Undefined Matrix Roles

**Audit ID:** AUD-001 to AUD-016
**Area:** Roles & Permissions
**Status:** OPEN

## Description
The `Docs/System/COMPONENT_MATRIX.md` assigns component ownership to specific functional titles (e.g., "National ID Authority", "Surveyor General", "Privacy Officer") which are NOT defined as System Roles in `Docs/Roles/`.

## Mismatches
The following roles appear in the Matrix but exist nowhere else in the Role definitions:
- National ID Authority
- Surveyor General
- Privacy Officer
- Security Lead
- Program Designer
- DevOps
- Field Manager
- Comms Officer
- System Architect
- Policy Maker
- Umbrella Admin
- Community Leader
- Planner
- Domain Analyst

## Naming Inconsistencies
- `Vertical Admin` (Matrix) vs `Vertical Owner` (Roles)
- `Finance Officer` (Matrix) vs `Finance Manager` (Roles)

## Impact
Governance ambiguity. It is unclear if these are just "personas" or actual RBAC roles. If they are roles, they need permission sets. If they are personas, the Matrix should map them to the technical Role (e.g., `Tenant Admin`).
