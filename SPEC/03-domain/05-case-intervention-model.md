# SCP-SPEC-DOM-05: Case and Intervention Model

## Purpose

This document defines the Case (Intervention) model, representing actionable engagements with people or households.

## In Scope / Out of Scope

**In Scope**
- Case lifecycle
- Multi-vertical participation
- Case ownership

**Out of Scope**
- Financial disbursement logic (MVP excluded)
- External case management tools

## Definitions

- Case: A managed intervention instance.
- Primary Vertical: Vertical owning the case.
- Suspension Reason: Coded reason for entering the Suspended state.

## Rules (MUST/SHOULD/MAY)

- Each case MUST have exactly one primary vertical.
- Cases MAY include participant verticals.
- Case lifecycle MUST follow:
  Draft -> Submitted -> Verified -> Active -> Suspended -> Stabilized -> Closed -> Reopened -> Active -> Archived
- Stabilized cases MUST require manual closure.
- If consent is withdrawn for the primary vertical, the case MUST be auto-suspended (locked, no further actions) once withdrawal is effective and flagged with the suspension reason.
- Cases MUST NOT be created for unverified subjects (person or household).
- If consent expires for the primary vertical, the case MUST be read-only during the tenant-configured grace period, then auto-suspended.
- Cases auto-suspended due to consent expiry MUST use the CONSENT_EXPIRED reason.
- Suspended cases MUST be read-only for non-ROOT users and MUST be restored automatically to the prior state if consent is re-granted, unless another suspension reason remains active.
- Suspended MAY be entered from any active state and restored to the prior state when conditions allow.
- If consent is withdrawn for any participant vertical, the entire case MUST be auto-suspended and flagged with the suspension reason.
- During consent grace periods, cases MUST be read-only with no workflow actions.
- Case suspension state MUST record a suspension reason.
- Suspension reasons MUST use a global fixed list, including CONSENT_WITHDRAWN, CONSENT_EXPIRED, GEO_REVIEW, and POLICY_SUSPENSION.
- POLICY_SUSPENSION MUST remain a flat reason without sub-categories.
- Suspension reasons MUST be immutable once set.
- Any exception to suspension reason immutability MUST require umbrella approval.
- If consent is renewed within the grace period, a pending CONSENT_EXPIRED suspension MUST be lifted.
- Cases MUST support merge and split operations under governed workflows.
- Cases MUST support transfer of primary vertical ownership via governed workflow.
- Abandoned cases MUST be flagged and archived after governance review.
- Cases MUST be checked for duplicate support conflicts before activation and flagged for manual review when detected.

## Case Lifecycle Workflow

1. Case is created in Draft by a permitted role in the primary vertical.
2. Case is submitted for verification (Submitted).
3. Verification completes and moves case to Verified.
4. Verified cases move to Active when approved to proceed.
5. Active cases MAY move to Suspended due to consent, policy, or geo review.
6. Active cases move to Stabilized when objectives are met.
7. Stabilized cases move to Closed by manual action.
8. Closed cases MAY be Reopened and then return to Active.
9. Closed cases are archived and retained as read-only history.

## Cross-Vertical Participation Workflow

1. A primary vertical creates the case and defines initial participant verticals (optional).
2. Participant verticals MUST explicitly opt in before accessing or acting.
3. Participant verticals MAY initiate actions subject to permissions and intersection rules.
4. All case actions MUST pass the strictest intersection of participating vertical policies.
5. If any participant vertical exits or is removed, access and actions MUST be re-evaluated.

## Minimum Required Fields

- case_id (system GUID)
- tenant_id
- primary_vertical_id
- participant_vertical_ids (optional)
- subject_type (person or household)
- subject_id (person_id or household_id)
- program_id (optional)
- status (draft, submitted, verified, active, suspended, stabilized, closed, reopened, archived)
- status_reason (nullable)
- active_from
- active_until (nullable)
- geo_scope_ids (optional)
- created_by, created_at

## Edge Cases

- Conflicting updates from multiple verticals.
- Cases reopened after closure.

## Audit & Logs

- All case state transitions MUST be logged.
- Cross-vertical access MUST be traceable.

## Open Questions

- None.

## References

- SPEC/03-domain/06-workflow-approval-model.md
- SPEC/04-security/09-consent-and-data-sharing.md
