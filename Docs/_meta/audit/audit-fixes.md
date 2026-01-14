# Audit Fixes
**Format:**
- **ID:** FIX-001
- **Related Issue:** AUD-019
- **Lapse ID:** Lapses/diagrams/identity-archival-missing
- **Description:** Added `Archived` state to Identity Lifecycle.
- **Rationale:** SPEC explicit mandatory requirement (Soft Delete).
- **Status:** Applied

- **ID:** FIX-002
- **Related Issue:** AUD-017
- **Lapse ID:** Lapses/data-model/case-status-mismatch
- **Description:** Removed `InProgress` state from Case Lifecycle.
- **Rationale:** SPEC explicit status enum; `InProgress` was an invention.
- **Status:** Applied

- **ID:** FIX-003
- **Related Issue:** AUD-023
- **Lapse ID:** Lapses/scripts/invalid-vertical-scope
- **Description:** Changed Vertical Scope to "Data".
- **Rationale:** "core" is invalid. "Data" matches Birth Registry definition in SPEC.
- **Status:** Applied

- **ID:** FIX-005
- **Related Issue:** AUD-018
- **Lapse ID:** Lapses/diagrams/program-state-nesting
- **Description:** Flattened `Approved` state (removed nesting).
- **Rationale:** Aligns with SPEC status enum.
- **Status:** Applied

- **ID:** FIX-006
- **Related Issue:** AUD-022
- **Lapse ID:** Lapses/docs/missing-tech-docs
- **Description:** Scaffolded Front/Back/Deploy directories.
- **Rationale:** Fulfills Missing Artifacts requirement.
- **ID:** FIX-008
- **Related Issue:** AUD-001 ... AUD-016
- **Lapse ID:** Lapses/roles-permissions/undefined-matrix-roles
- **Description:** Remapped `COMPONENT_MATRIX.md` to use Standard Roles.
- **Rationale:** Governance Alignment.
- **Status:** Applied

- **ID:** REC-001 (Recommendation)
- **Related Issue:** AUD-021
- **Lapse ID:** Lapses/use-cases/uc-01-consent-mismatch
- **Description:** Deferred fix. Acknowledged SPEC Gap regarding Purpose-Based Consent.
- **Rationale:** User Decision (Option B).
- **Status:** Deferred

- **ID:** FIX-009
- **Related Issue:** AUD-021
- **Lapse ID:** Lapses/use-cases/uc-01-consent-mismatch
- **Description:** Updated SPEC-SEC-09 to explicitly allow Purpose-Based Consent.
- **Rationale:** Resolves Spec Gap; Validates UC-01.
- **Status:** Applied

---
