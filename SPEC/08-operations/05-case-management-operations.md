# SCP-SPEC-OPS-05: Case Management Operations

## Purpose

This document defines operational handling of cases and interventions.

## In Scope / Out of Scope

**In Scope**
- Case assignment
- Status transitions
- Inter-vertical coordination

**Out of Scope**
- Clinical or legal case management systems

## Definitions

- Case: An operational intervention instance.
- Case Owner: Primary vertical responsible.

## Rules (MUST/SHOULD/MAY)

- Cases MUST follow the defined lifecycle.
- Only authorized roles MAY update case status.
- Multi-vertical cases MUST respect intersection rules.
- Case closure SHOULD require verification.
- Consent withdrawal for the primary vertical MUST auto-suspend the case.
- Consent expiration for the primary vertical MUST make the case read-only for the tenant-configured grace period, then auto-suspend.
- Case auto-suspension due to consent withdrawal MUST notify case owners.
- Consent-based auto-suspension notifications MUST be sent to case owners only.
- Suspended cases MUST be read-only for non-ROOT users and MUST be restored automatically to the prior state when consent is re-granted.
- Consent withdrawal from any participant vertical MUST auto-suspend the entire case.
- No workflow actions or status updates MAY occur during the consent grace period.
- Case auto-restore after consent re-grant MUST notify case owners.
- Cases flagged by geo re-evaluation MUST be auto-suspended until manual review completes.
- Auto-suspended cases MUST pause scheduled notifications and reminders.
- Auto-suspended cases MUST record a suspension reason.
- Case auto-restore MUST NOT occur while a geo re-evaluation suspension is active.
- ROOT edits on suspended cases MAY include an optional reason code or ticket ID.
- Geo re-evaluation suspensions MUST use a GEO_REVIEW reason code.
- Duplicate support checks MUST run before activation and during case transfers.
- Cases flagged as duplicates MUST be restricted for manual review before activation.
- Case owners MUST be able to view suspension reasons.
- Suspension notifications to case owners MUST include the suspension reason.
- GEO_REVIEW suspensions MUST allow read-only access for case owners.
- POLICY_SUSPENSION MAY be initiated by tenant admins, subject to governance controls.
- Automated case escalations MUST be supported.
- Cases MUST be transferable between owners via governed workflow.

## Edge Cases

- Case reopened after closure.
- Partial completion across verticals.

## Audit & Logs

- Case updates MUST be logged.
- Status transitions MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/05-case-intervention-model.md
- SPEC/04-security/05-authz-engine-evaluation.md
