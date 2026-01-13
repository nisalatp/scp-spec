# SCP-SPEC-DATA-02: Logical Data Schema

## Purpose

This document defines the logical data model for SCP, independent of physical storage details.

## In Scope / Out of Scope

**In Scope**
- Core entities and relationships
- Logical constraints
- Reporting metadata entities

**Out of Scope**
- Physical table definitions
- Indexing strategies

## Definitions

- Logical Schema: Conceptual representation of data entities.
- Entity: A core data object such as Person or Household.
- Report Definition: Versioned configuration for report execution.
- Reportable Entity Registry: Approved models, fields, and joins for reporting.
- Chart Definition: Versioned configuration for report charts.

## Rules (MUST/SHOULD/MAY)

- Logical schema MUST align with the domain model.
- Entities MUST support global GUIDs.
- Relationships MUST be explicit and version-aware.
- Logical schema SHOULD support extension via metadata.
- Polymorphic entities MUST be supported.
- Derived fields MUST be represented explicitly.
- Polymorphic entities MAY be stored in a single table when governed by versioned metadata.
- Reporting metadata entities (report definitions, reportable registry, chart definitions) MUST be tenant-scoped and versioned.
- Reporting metadata MUST include vertical scoping, classification, and masking metadata.
- Report definitions MUST retain execution validation hashes and security context snapshots.
- Report execution logs MUST be append-only and retained per policy.

## Reporting Entities (Logical)

- ReportableEntity
  - entity_id (GUID)
  - tenant_id
  - entity_name
  - data_source
  - allowed_fields
  - joins (optional)
  - classification
  - vertical_scope
  - geo_scope (optional)
  - status
  - version_id
  - created_by, created_at
- ReportDefinition
  - report_definition_id (GUID)
  - tenant_id
  - report_name
  - description (nullable)
  - entity_ids
  - fields
  - filters (optional)
  - group_by (optional)
  - aggregates (optional)
  - sort (optional)
  - vertical_scope
  - geo_scope (optional)
  - status
  - version_id
  - validation_hash
  - security_context_snapshot
  - created_by, created_at
- ReportDefinitionVersion
  - report_definition_id
  - version_id
  - definition_snapshot
  - validation_hash
  - created_by, created_at
- ReportRun
  - run_id (GUID)
  - report_definition_id
  - status
  - row_count (nullable)
  - errors (nullable)
  - requested_by, requested_at
  - completed_at (nullable)
- ReportRunExport
  - run_id
  - format
  - file_ref
  - generated_at
- ReportSchedule
  - schedule_id (GUID)
  - report_definition_id
  - schedule
  - format
  - recipients (optional)
  - status
  - next_run_at
  - created_by, created_at
- ChartDefinition
  - chart_id (GUID)
  - tenant_id
  - chart_name
  - source_report_definition_id (nullable)
  - source_template_id (nullable)
  - chart_type
  - x_axis
  - y_axis
  - series (optional)
  - filters (optional)
  - group_by (optional)
  - status
  - version_id
  - created_by, created_at
- ChartDefinitionVersion
  - chart_id
  - version_id
  - definition_snapshot
  - created_by, created_at

## Communication Entities (Logical)

- CommunicationBroadcast
  - broadcast_id (GUID)
  - tenant_id
  - broadcast_type (emergency or operational)
  - vertical_id (nullable)
  - target_type (person or household)
  - target_filter (JSON)
  - channels (JSON)
  - consent_mode (strict or emergency_override)
  - message_template_id (nullable)
  - message_payload (JSON, nullable)
  - status (draft, requested, approved, sent, cancelled, failed, archived)
  - created_by, created_at
  - approved_by (nullable), approved_at (nullable)
  - sent_at (nullable)

- CommunicationBroadcastRun
  - run_id (GUID)
  - broadcast_id
  - status (queued, running, completed, failed)
  - targeted_count (nullable)
  - delivered_count (nullable)
  - errors_ref (nullable)
  - started_at, completed_at

## Program Entities (Logical)

- Program
  - program_id (GUID)
  - tenant_id
  - program_name
  - program_code
  - primary_vertical_id
  - status
  - active_from
  - active_until (nullable)
  - owner_id
  - eligibility_definition (metadata reference or JSON)
  - kpi_definitions (metadata reference or JSON)
  - created_by, created_at
- ProgramVertical
  - program_id
  - vertical_id
  - role (primary or participant)
- ProgramGeoScope
  - program_id
  - geo_id
- ProgramVersion
  - program_id
  - version_id
  - change_summary
  - changed_by, changed_at

## Case Entities (Logical)

- Case
  - case_id (GUID)
  - tenant_id
  - primary_vertical_id
  - program_id (nullable)
  - subject_type (person or household)
  - subject_id
  - status
  - status_reason (nullable)
  - active_from
  - active_until (nullable)
  - created_by, created_at
- CaseVertical
  - case_id
  - vertical_id
  - role (primary or participant)
  - opted_in (boolean)
- CaseStatusHistory
  - case_id
  - status
  - status_reason (nullable)
  - changed_by, changed_at
- CaseAssignment
  - case_id
  - assigned_to_user_id
  - assigned_role (optional)
  - effective_from
  - effective_until (nullable)
- CaseMerge
  - case_id
  - merged_case_id
  - reason_code
  - reason_text (nullable)
  - merged_by, merged_at
- CaseSplit
  - source_case_id
  - new_case_id
  - reason_code
  - reason_text (nullable)
  - split_by, split_at
- CaseOwnerTransfer
  - case_id
  - from_vertical_id
  - to_vertical_id
  - approval_id (nullable)
  - reason_code
  - reason_text (nullable)
  - transferred_by, transferred_at

- CaseConflict
  - conflict_id (GUID)
  - tenant_id
  - conflict_type (duplicate_support or other)
  - subject_type (person or household)
  - subject_id
  - primary_case_id
  - related_case_ids
  - status (open, resolved, dismissed)
  - resolution_code (nullable)
  - resolution_notes (nullable)
  - created_by, created_at
  - resolved_by (nullable), resolved_at (nullable)

## Workflow Entities (Logical)

- WorkflowDefinition
  - workflow_definition_id (GUID)
  - tenant_id
  - workflow_name
  - workflow_code
  - version_id
  - status
  - steps (ordered list with roles, conditions, approval_mode)
- WorkflowInstance
  - workflow_instance_id (GUID)
  - tenant_id
  - workflow_definition_id
  - target_type
  - target_id
  - status
  - current_step_id
  - created_by, created_at
- ApprovalRecord
  - approval_id (GUID)
  - workflow_instance_id
  - step_id
  - approver_id
  - decision
  - decision_reason_code
  - decision_reason_text
  - decided_at

## Form Entities (Logical)

- FormDefinition
  - form_id (GUID)
  - tenant_id
  - form_name
  - form_code
  - scope_type
  - vertical_id (nullable)
  - program_id (nullable)
  - measurement_type (nullable, baseline or outcome or follow_up)
  - measurement_scope (nullable, person or household or case or program)
  - measurement_category (nullable)
  - status
  - version_id
  - fields (metadata list)
  - created_by, created_at
- FormVersion
  - form_id
  - version_id
  - fields_snapshot
  - published_by, published_at
- FormSubmission
  - submission_id (GUID)
  - form_id
  - form_version_id
  - target_type
  - target_id
  - measurement_type (nullable)
  - measurement_scope (nullable)
  - measurement_category (nullable)
  - data_payload (JSON)
  - verification_status
  - verified_by (nullable)
  - verified_at (nullable)
  - version_id
  - submitted_by, submitted_at
- FormSubmissionVersion
  - submission_id
  - version_id
  - data_payload
  - changed_by, changed_at

## Core Entities (Logical)

- Person
  - person_id (GUID)
  - tenant_id
  - system_guid
  - full_name
  - date_of_birth or age_estimate
  - gender
  - primary_contact (nullable)
  - verification_status
  - verified_by (nullable)
  - verified_at (nullable)
  - status
  - created_by, created_at
- PersonIdentifier
  - person_id
  - tenant_id
  - identity_type
  - identity_number
  - is_primary
  - verified_at (nullable)
- Household
  - household_id (GUID)
  - tenant_id
  - household_name
  - leader_id
  - primary_geo_id
  - address
  - geo_lat (nullable)
  - geo_lon (nullable)
  - geo_accuracy (nullable)
  - geo_captured_at (nullable)
  - status
  - primary_household_id (nullable)
  - annexure_code (nullable)
  - created_by, created_at
- HouseholdMembership
  - household_id
  - person_id
  - relationship_type
  - effective_from
  - effective_until (nullable)
  - verification_status
- FamilyRelationship
  - person_id
  - related_person_id
  - relationship_type
  - effective_from
  - effective_until (nullable)
  - verification_status
- GeoLevel
  - level_id (GUID)
  - tenant_id
  - level_type
  - display_name
  - order_index
- GeoNode
  - geo_id (GUID)
  - tenant_id
  - geo_name
  - geo_code
  - level_type
  - parent_geo_id (nullable)
  - status
  - effective_from
  - effective_until (nullable)
  - dispute_status (nullable)
  - version_id
  - centroid_lat (nullable)
  - centroid_lon (nullable)
  - boundary_ref (nullable)
- GeoNodeVersion
  - geo_id
  - version_id
  - snapshot
  - changed_by, changed_at
- GeoMetricDefinition
  - metric_id (GUID)
  - tenant_id
  - metric_code
  - metric_name
  - unit
  - data_type
  - source_type
  - status
- GeoMetricValue
  - metric_value_id (GUID)
  - metric_id
  - geo_id
  - value
  - value_date
  - source_ref (nullable)
  - status
- CommunityCenter
  - center_id (GUID)
  - tenant_id
  - center_name
  - center_type
  - status
  - active_from
  - active_until (nullable)
  - owner_id
  - address (nullable)
  - primary_contact (nullable)
  - verification_status
  - verified_by (nullable)
  - verified_at (nullable)
- CommunityCenterGeo
  - center_id
  - geo_id
- CommunityCenterVertical
  - center_id
  - vertical_id
- Facility
  - facility_id (GUID)
  - tenant_id
  - facility_name
  - facility_type
  - status
  - active_from
  - active_until (nullable)
  - primary_geo_id
  - address (nullable)
  - geo_lat (nullable)
  - geo_lon (nullable)
- FacilityGeo
  - facility_id
  - geo_id
- FacilityService
  - facility_id
  - service_code
  - service_name
  - vertical_id (nullable)
  - status
- InfrastructureProject
  - project_id (GUID)
  - tenant_id
  - project_name
  - project_type
  - status
  - active_from
  - active_until (nullable)
  - primary_vertical_id (nullable)
  - sponsor_org (nullable)
- InfrastructureProjectGeo
  - project_id
  - geo_id
- InfrastructureProjectVertical
  - project_id
  - vertical_id
- Vertical
  - vertical_id (GUID)
  - tenant_id
  - vertical_code
  - vertical_name
  - type (system or custom)
  - status
  - owner_id
  - policy_pack_id (nullable)
  - created_by, created_at
- VerticalAlias
  - vertical_id
  - alias

## Attachment Entities (Logical)

- Attachment
  - attachment_id (GUID)
  - tenant_id
  - target_type
  - target_id
  - classification_level (nullable)
  - vertical_id (nullable)
  - program_id (nullable)
  - status
  - created_by, created_at
- AttachmentVersion
  - attachment_id
  - version_id
  - file_name
  - content_type
  - size_bytes
  - storage_key
  - checksum
  - scan_status
  - ocr_status
  - verified_at
  - verified_by (nullable)

## Consent Entities (Logical)

- Consent
  - consent_id (GUID)
  - tenant_id
  - person_id
  - vertical_id
  - status
  - active_from
  - active_until (nullable)
  - grace_until (nullable)
  - capture_mode
  - reason_code (nullable)
  - reason_text (nullable)
  - verified_by (nullable)
  - verified_at (nullable)
  - version_id
  - captured_by, captured_at
- ConsentVersion
  - consent_id
  - version_id
  - status
  - active_from
  - active_until (nullable)
  - grace_until (nullable)
  - capture_mode
  - evidence_attachment_ids
  - verification_document_attachment_id
  - reason_code (nullable)
  - reason_text (nullable)
  - created_by, created_at

## Integration Entities (Logical)

- Integration
  - integration_id (GUID)
  - tenant_id
  - integration_name
  - partner_name
  - partner_type
  - status
  - active_from
  - active_until (nullable)
  - auth_client_id
  - data_contract_id
  - created_by, created_at
- IntegrationVertical
  - integration_id
  - vertical_id
- IntegrationContract
  - contract_id (GUID)
  - integration_id
  - version_id
  - purpose
  - data_categories
  - field_list (JSON)
  - consent_requirements
  - status
- IntegrationTemplate
  - template_id (GUID)
  - template_name
  - partner_type
  - vertical_ids
  - contract_template (JSON)
  - status

- IntegrationExchange
  - exchange_id (GUID)
  - integration_id
  - direction (push or pull)
  - contract_id
  - status
  - format
  - idempotency_key (nullable)
  - payload_ref (optional)
  - created_at
  - completed_at (nullable)

- WebhookSubscription
  - webhook_id (GUID)
  - integration_id
  - target_url
  - event_types
  - status
  - public_key_id
  - active_from
  - active_until (nullable)

## Pipeline Entities (Logical)

- PipelineDefinition
  - pipeline_id (GUID)
  - tenant_id
  - pipeline_name
  - pipeline_code
  - direction
  - format
  - target_type
  - mapping_definition
  - integration_id (nullable)
  - status
  - schedule (optional)
  - created_by, created_at
- PipelineRun
  - run_id (GUID)
  - pipeline_id
  - status
  - input_file_ref (nullable)
  - output_file_ref (nullable)
  - validation_report_ref (nullable)
  - started_at, completed_at
  - initiated_by

## Tenant Entities (Logical)

- Tenant
  - tenant_id (GUID)
  - tenant_name
  - country_code
  - data_residency_region
  - status
  - created_at
- TenantConfig
  - tenant_id
  - config_version_id
  - config_payload (JSON)
  - updated_at

## Policy Entities (Logical)

- PolicyPack
  - policy_pack_id (GUID)
  - tenant_id
  - vertical_id
  - status
  - version_id
  - active_from
  - active_until (nullable)
- PolicyChange
  - policy_change_id (GUID)
  - policy_pack_id
  - status
  - active_from
  - active_until (nullable)
  - created_by, created_at

## Agent and Visit Entities (Logical)

- Agent
  - agent_id (GUID)
  - tenant_id
  - person_id
  - role_classification
  - status
  - active_from
  - active_until (nullable)
  - created_by, created_at
- AgentGeoScope
  - agent_id
  - geo_id
  - effective_from
  - effective_until (nullable)
- Visit
  - visit_id (GUID)
  - tenant_id
  - agent_id
  - target_type
  - target_id
  - status
  - visit_date
  - created_by, created_at
- VisitVertical
  - visit_id
  - vertical_id
  - role (primary or participant)
- VisitStatusHistory
  - visit_id
  - status
  - changed_by, changed_at

## Service and Attendance Entities (Logical)

- ServiceEncounter
  - encounter_id (GUID)
  - tenant_id
  - person_id
  - facility_id (nullable)
  - encounter_type
  - encounter_date
  - vertical_id
  - status
  - recorded_by, recorded_at
- AttendanceRecord
  - attendance_id (GUID)
  - tenant_id
  - person_id
  - facility_id (nullable)
  - period_start
  - period_end
  - attendance_rate (nullable)
  - attendance_count (nullable)
  - status
  - recorded_by, recorded_at

## Marketplace Access Entities (Logical)

- AccessRequest
  - access_request_id (GUID)
  - tenant_id
  - organization_name
  - request_purpose
  - vertical_ids
  - program_ids (optional)
  - status
  - requested_by, requested_at
- AccessGrant
  - access_grant_id (GUID)
  - tenant_id
  - access_request_id
  - vertical_ids
  - program_ids (optional)
  - active_from
  - active_until
  - status
  - created_by, created_at

## Donor Entities (Logical)

- Donor
  - donor_id (GUID)
  - tenant_id
  - donor_name
  - donor_type
  - status
  - anonymous
  - created_by, created_at
- DonorProgram
  - donor_id
  - program_id
  - vertical_id
  - status
- DonorAccessGrant
  - donor_id
  - vertical_id
  - program_id (optional)
  - active_from
  - active_until
  - status

## Edge Cases

- Optional attributes varying by country.
- Legacy fields retained for compatibility.
- Report definitions referencing deprecated fields.

## Audit & Logs

- Logical schema changes MUST be versioned.
- Mappings to physical schema SHOULD be traceable.
- Reporting metadata changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/01-domain-overview.md
- SPEC/06-platform-core/07-metadata-versioning.md
- SPEC/11-apis/11-reporting-api.md
