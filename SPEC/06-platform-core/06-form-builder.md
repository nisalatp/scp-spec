# SCP-SPEC-CORE-06: Form Builder

## Purpose

This document defines the metadata-driven form builder used to collect structured data.

## In Scope / Out of Scope

**In Scope**
- Dynamic form definitions
- Field metadata
- Versioning

**Out of Scope**
- UI form editors
- Hardcoded schemas

## Definitions

- Form: A metadata-defined data collection schema.
- Field: A single data attribute.

## Rules (MUST/SHOULD/MAY)

- Forms MUST be versioned.
- Fields MUST support sensitivity classification.
- Forms SHOULD be reusable across programs.
- Deprecated forms MUST remain read-only.
- Forms MAY define validation rules.
- Conditional fields MUST be supported using **JSONLogic** standard for portable evaluation.
- Form migrations MUST follow internationally accepted standards and governance approval.
- Form lifecycle MUST be:
  Draft -> Requested -> Reviewed -> Approved -> Active -> (Restricted|Suspended|Deprecated) -> Archived
- Forms MAY be tenant-wide or scoped to a vertical and optional program.
- Forms MAY be flagged as baseline, follow_up, or outcome measurement forms with explicit measurement_scope.
- Submissions MUST be immutable once verified; updates MUST create new submission versions.
- New submission versions MUST reset verification status and require fresh verification.
- Form submissions SHOULD support repeatable sections and computed fields.

## Form Lifecycle Workflow

1. Create form definition in Draft.
2. Submit for governance review (Requested).
3. Review completes and marks the form as Reviewed.
4. Approve and activate (Approved -> Active).
5. Restrict or suspend when governance requires.
6. Deprecate to block new submissions while retaining read-only access.
7. Archive to lock all edits and preserve audit.

## Submission Versioning Rules

- Each submission MUST reference a fixed form version.
- Updates MUST create a new submission version with a link to the prior version.
- Verified submissions MUST remain immutable.
- New submission versions MUST be re-verified before use.

## Edge Cases

- Form changes during active cases.
- Legacy submissions referencing old versions.

## Audit & Logs

- Form creation and updates MUST be logged.
- Submissions MUST reference form version.

## Open Questions

- None.

## References

- SPEC/03-domain/09-forms-metadata-model.md
- SPEC/04-security/10-data-classification-and-masking.md
