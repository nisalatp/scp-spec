# SCP-SPEC-DOM-09: Forms and Metadata Model

## Purpose

This document defines the dynamic forms and metadata system used to collect and manage data in SCP.

## In Scope / Out of Scope

**In Scope**
- Form definitions
- Metadata attributes
- Versioning

**Out of Scope**
- UI form builders
- Static hardcoded forms

## Definitions

- Form: A structured data collection schema.
- Metadata Attribute: A configurable data field.

## Rules (MUST/SHOULD/MAY)

- Forms MUST be versioned.
- Attributes MUST support sensitivity tagging.
- Forms SHOULD be reusable across programs.
- Deprecated forms MAY remain read-only.
- Conditional fields MUST be supported.
- Form migrations MUST follow internationally accepted standards and governance approval.
- Form lifecycle MUST be:
  Draft -> Requested -> Reviewed -> Approved -> Active -> (Restricted|Suspended|Deprecated) -> Archived
- Forms MAY be tenant-wide or scoped to a vertical and optional program.
- Forms MAY be flagged as baseline, follow_up, or outcome measurement forms.
- Measurement forms MUST declare measurement_scope (person, household, case, or program).
- Submissions MUST be immutable once verified; updates MUST create a new submission version with audit history.
- New submission versions MUST reset verification status and require fresh verification.
- Forms SHOULD support repeatable sections and computed fields.

## Form Lifecycle Workflow

1. Form definition is created in Draft by a tenant admin or vertical owner.
2. Form is submitted for governance review (Requested).
3. Review completes and marks the form as Reviewed.
4. Umbrella approves or rejects; approved forms become Approved.
5. Approved forms are activated (Active) and may accept submissions.
6. Forms MAY be Restricted or Suspended by governance.
7. Forms MAY be Deprecated to prevent new submissions while keeping read-only access.
8. Archived forms are immutable and retained for audit.

## Minimum Required Fields

### Form Definition

- form_id (system GUID)
- tenant_id
- form_name
- form_code (unique per tenant)
- scope_type (tenant, vertical, program)
- vertical_id (nullable)
- program_id (nullable)
- measurement_type (nullable, baseline or outcome or follow_up)
- measurement_scope (nullable)
- measurement_category (nullable)
- status (draft, requested, reviewed, approved, active, restricted, suspended, deprecated, archived)
- version_id
- fields (metadata list)
- created_by, created_at

### Form Submission

- submission_id (system GUID)
- form_id
- form_version_id
- target_type (person, household, case, program, or other)
- target_id
- measurement_type (nullable)
- measurement_scope (nullable)
- measurement_category (nullable)
- submitted_by, submitted_at
- data_payload (JSON)
- verification_status (pending, verified, rejected)
- version_id

## Edge Cases

- Form changes mid-case.
- Backward compatibility of submissions.

## Audit & Logs

- Form changes MUST be logged.
- Submissions MUST reference form versions.

## Open Questions

- None.

## References

- SPEC/06-platform-core/06-form-builder.md
- SPEC/04-security/10-data-classification-and-masking.md
