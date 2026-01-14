# Lapse: Implicit Operational Roles

## Description
The roles **Case Worker** and **Program Manager** are referenced in functional workflows (`SPEC/03-domain`) and Permission Catalog scopiing rules (`SPEC/04-security/06-permission-catalog.md`), but are not explicitly named in the `SPEC/04-security/07-scopes-groups-roles.md` definitions section.

## Evidence
- `SPEC/03-domain/05-case-intervention-model.md` refers to "permitted role in the primary vertical" for case creation.
- `SPEC/04-security/06-permission-catalog.md` defines `case.*` and `program.*` permissions but doesn't explicitly link them to a standard role.

## Impact
- Ambiguity in role implementation. Developers might create inconsistent "Case Manager" vs "Case Worker" roles.

## Proposed Remediation
- Update `SPEC/04-security/07-scopes-groups-roles.md` to explicitly list **Case Worker** and **Program Manager** as standard template roles.

## Status
- **Remediated**: 2026-01-14
- **Action**: Standard roles (Case Worker, Program Manager) defined in `Docs/Roles/` and cross-referenced in all 20+ Use Cases and C4 diagrams.
