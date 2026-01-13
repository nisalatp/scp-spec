# SCP-SPEC-DATA-03: Physical Data Schema (PostgreSQL)

## Purpose

This document defines physical data storage principles for PostgreSQL implementations.

## In Scope / Out of Scope

**In Scope**
- PostgreSQL schema conventions
- Table organization
- Data types and constraints

**Out of Scope**
- Vendor-specific extensions
- Query optimization techniques

## Definitions

- Physical Schema: Database-level tables and columns.
- Append-Only Table: Table where records are not updated or deleted.

## Rules (MUST/SHOULD/MAY)

- PostgreSQL MUST be used as the primary datastore.
- Identity records MUST NOT be deleted, only archived.
- Audit logs MUST be append-only.
- Foreign keys SHOULD be enforced where safe.
- JSONB MAY be used for metadata-driven fields.
- Table partitioning MUST be supported at MVP.
- Large objects MUST be stored in external object storage with references in Postgres.

## Security and Access Control Tables (Minimum)

These tables support role creation, scope-bound assignments, and permission grants or revokes.

**sec_permissions**
- permission_id (PK, UUID)
- code (verb.noun, unique)
- description
- version
- status (active, deprecated)
- created_at

**sec_roles**
- role_id (PK, UUID)
- tenant_id
- name (unique per tenant)
- scope_type (tenant, geo, vertical, program)
- status (draft, active, restricted, archived)
- version
- active_from
- active_until (nullable)
- created_by
- approved_by (nullable)
- approved_at (nullable)
- reviewed_by (nullable)
- reviewed_at (nullable)
- approval_state (pending, reviewed, approved, rejected)
- metadata (JSONB)

**sec_role_permissions**
- role_id (FK)
- permission_id (FK)
- effective_from
- effective_until (nullable)
- created_by

**sec_groups**
- group_id (PK, UUID)
- tenant_id
- name (unique per tenant)
- is_dynamic
- rule_expression (JSONB, nullable)
- status

**sec_group_members**
- group_id (FK)
- user_id (FK)
- effective_from
- effective_until (nullable)

**sec_group_roles**
- group_id (FK)
- role_id (FK)
- effective_from
- effective_until (nullable)

**sec_user_roles**
- user_id (FK)
- role_id (FK)
- tenant_id
- geo_id (nullable)
- vertical_id (nullable)
- program_id (nullable)
- effective_from
- effective_until (nullable)
- revoked_at (nullable)
- revoked_by (nullable)

**sec_deny_rules**
- deny_id (PK, UUID)
- tenant_id
- permission_id (FK)
- geo_id (nullable)
- vertical_id (nullable)
- program_id (nullable)
- reason_code
- created_by
- effective_from
- effective_until (nullable)
- revoked_by (nullable)
- revoked_at (nullable)

Scope constraints MUST be enforced:
- program_id MUST NOT be set without vertical_id.
- vertical_id and geo_id MUST NOT be set without tenant_id.

## Program Tables (Minimum)

**programs**
- program_id (PK, UUID)
- tenant_id
- program_code (unique per tenant)
- program_name
- primary_vertical_id
- status (draft, requested, reviewed, approved, active, restricted, suspended, deprecated, archived)
- active_from
- active_until (nullable)
- owner_id
- eligibility_definition (JSONB or metadata_ref)
- kpi_definitions (JSONB or metadata_ref)
- created_by
- created_at
- updated_at

**program_verticals**
- program_id (FK)
- vertical_id (FK)
- role (primary or participant)

**program_geo_scopes**
- program_id (FK)
- geo_id (FK)

**program_versions**
- program_id (FK)
- version_id
- change_summary
- changed_by
- changed_at

## Case Tables (Minimum)

**cases**
- case_id (PK, UUID)
- tenant_id
- primary_vertical_id
- program_id (nullable)
- subject_type (person or household)
- subject_id
- status (draft, submitted, verified, active, suspended, stabilized, closed, reopened, archived)
- status_reason (nullable)
- active_from
- active_until (nullable)
- created_by
- created_at
- updated_at

**case_verticals**
- case_id (FK)
- vertical_id (FK)
- role (primary or participant)
- opted_in (boolean)

**case_status_history**
- case_id (FK)
- status
- status_reason (nullable)
- changed_by
- changed_at

**case_assignments**
- case_id (FK)
- user_id (FK)
- assigned_role (nullable)
- effective_from
- effective_until (nullable)

**case_merges**
- case_id (FK)
- merged_case_id (FK)
- reason_code
- reason_text (nullable)
- merged_by
- merged_at

**case_splits**
- source_case_id (FK)
- new_case_id (FK)
- reason_code
- reason_text (nullable)
- split_by
- split_at

**case_owner_transfers**
- case_id (FK)
- from_vertical_id (FK)
- to_vertical_id (FK)
- approval_id (nullable)
- reason_code
- reason_text (nullable)
- transferred_by
- transferred_at

**case_conflicts**
- conflict_id (PK, UUID)
- tenant_id
- conflict_type (duplicate_support, other)
- subject_type (person, household)
- subject_id
- primary_case_id (FK)
- related_case_ids (JSONB)
- status (open, resolved, dismissed)
- resolution_code (nullable)
- resolution_notes (nullable)
- created_by
- created_at
- resolved_by (nullable)
- resolved_at (nullable)

## Workflow Tables (Minimum)

**workflow_definitions**
- workflow_definition_id (PK, UUID)
- tenant_id
- workflow_code (unique per tenant)
- workflow_name
- version_id
- status (draft, active, archived)
- steps (JSONB)
- created_by
- created_at

**workflow_instances**
- workflow_instance_id (PK, UUID)
- tenant_id
- workflow_definition_id (FK)
- target_type
- target_id
- status (pending, in_review, approved, rejected, cancelled, overridden)
- current_step_id
- created_by
- created_at
- updated_at

**approval_records**
- approval_id (PK, UUID)
- workflow_instance_id (FK)
- step_id
- approver_id
- decision (approved or rejected)
- decision_reason_code
- decision_reason_text (nullable)
- decided_at

## Form Tables (Minimum)

**form_definitions**
- form_id (PK, UUID)
- tenant_id
- form_code (unique per tenant)
- form_name
- scope_type (tenant, vertical, program)
- vertical_id (nullable)
- program_id (nullable)
- measurement_type (nullable, baseline or outcome or follow_up)
- measurement_scope (nullable, person or household or case or program)
- measurement_category (nullable)
- status (draft, requested, reviewed, approved, active, restricted, suspended, deprecated, archived)
- version_id
- fields (JSONB)
- created_by
- created_at
- updated_at

**form_versions**
- form_id (FK)
- version_id
- fields_snapshot (JSONB)
- published_by
- published_at

**form_submissions**
- submission_id (PK, UUID)
- form_id (FK)
- form_version_id
- target_type
- target_id
- measurement_type (nullable)
- measurement_scope (nullable)
- measurement_category (nullable)
- data_payload (JSONB)
- verification_status (pending, verified, rejected)
- verified_by (nullable)
- verified_at (nullable)
- version_id
- submitted_by
- submitted_at
- updated_at

**form_submission_versions**
- submission_id (FK)
- version_id
- data_payload (JSONB)
- changed_by
- changed_at

## Attachment Tables (Minimum)

**attachments**
- attachment_id (PK, UUID)
- tenant_id
- target_type
- target_id
- classification_level (nullable)
- vertical_id (nullable)
- program_id (nullable)
- status (pending_upload, uploaded, scanned, verified, archived)
- created_by
- created_at
- updated_at

**attachment_versions**
- attachment_id (FK)
- version_id
- file_name
- content_type
- size_bytes
- storage_key
- checksum
- scan_status (pending, passed, failed)
- ocr_status (pending, completed, failed, disabled)
- verified_at (nullable)
- verified_by (nullable)
- created_by
- created_at

## Consent Tables (Minimum)

**consents**
- consent_id (PK, UUID)
- tenant_id
- person_id
- vertical_id
- status (pending, active, rejected, expired, withdrawn)
- active_from
- active_until (nullable)
- grace_until (nullable)
- capture_mode (online, offline)
- reason_code (nullable)
- reason_text (nullable)
- verified_by (nullable)
- verified_at (nullable)
- version_id
- captured_by
- captured_at
- updated_at

**consent_versions**
- consent_id (FK)
- version_id
- status (pending, active, rejected, expired, withdrawn)
- active_from
- active_until (nullable)
- grace_until (nullable)
- capture_mode (online, offline)
- verified_by (nullable)
- verified_at (nullable)
- evidence_attachment_ids (JSONB)
- verification_document_attachment_id
- reason_code (nullable)
- reason_text (nullable)
- created_by
- created_at

## Integration Tables (Minimum)

**integrations**
- integration_id (PK, UUID)
- tenant_id
- integration_name
- partner_name
- partner_type
- status (draft, requested, reviewed, approved, active, restricted, suspended, deprecated, archived)
- active_from
- active_until (nullable)
- auth_client_id
- data_contract_id
- created_by
- created_at
- updated_at

**integration_verticals**
- integration_id (FK)
- vertical_id (FK)

**integration_contracts**
- contract_id (PK, UUID)
- integration_id (FK)
- version_id
- purpose
- data_categories (JSONB)
- field_list (JSONB)
- consent_requirements (JSONB)
- status (draft, active, archived)
- active_from
- active_until (nullable)
- created_by
- created_at

**integration_templates**
- template_id (PK, UUID)
- template_name
- partner_type
- vertical_ids (JSONB)
- contract_template (JSONB)
- status
- created_at

**integration_exchanges**
- exchange_id (PK, UUID)
- integration_id (FK)
- direction (push, pull)
- contract_id (FK)
- status (accepted, running, completed, failed)
- format (json, csv, xml)
- idempotency_key (nullable)
- payload_ref (nullable)
- created_at
- completed_at (nullable)

**webhook_subscriptions**
- webhook_id (PK, UUID)
- integration_id (FK)
- target_url
- event_types (JSONB)
- status (active, disabled)
- public_key_id
- active_from
- active_until (nullable)
- created_at

## Pipeline Tables (Minimum)

**pipeline_definitions**
- pipeline_id (PK, UUID)
- tenant_id
- pipeline_code (unique per tenant)
- pipeline_name
- direction (import, export)
- format (csv, xlsx)
- target_type
- mapping_definition (JSONB or schema_ref)
- integration_id (nullable)
- status (draft, requested, reviewed, approved, active, restricted, suspended, deprecated, archived)
- schedule (nullable)
- created_by
- created_at
- updated_at

**pipeline_runs**
- run_id (PK, UUID)
- pipeline_id (FK)
- status (queued, validating, running, completed, failed, rolled_back)
- input_file_ref (nullable)
- output_file_ref (nullable)
- validation_report_ref (nullable)
- started_at
- completed_at (nullable)
- initiated_by
- created_at

## Reporting Tables (Minimum)

**reportable_entities**
- entity_id (PK, UUID)
- tenant_id
- entity_name
- data_source
- allowed_fields (JSONB)
- joins (JSONB, nullable)
- classification (JSONB)
- vertical_scope (JSONB)
- geo_scope (JSONB, nullable)
- status (draft, active, deprecated, archived)
- version_id
- created_by
- created_at
- updated_at

**report_definitions**
- report_definition_id (PK, UUID)
- tenant_id
- report_name
- description (nullable)
- entity_ids (JSONB)
- fields (JSONB)
- filters (JSONB, nullable)
- group_by (JSONB, nullable)
- aggregates (JSONB, nullable)
- sort (JSONB, nullable)
- vertical_scope (JSONB)
- geo_scope (JSONB, nullable)
- status (draft, active, deprecated, archived)
- version_id
- validation_hash
- security_context_snapshot (JSONB)
- created_by
- created_at
- updated_at

**report_definition_versions**
- report_definition_id (FK)
- version_id
- definition_snapshot (JSONB)
- validation_hash
- created_by
- created_at

**report_runs**
- run_id (PK, UUID)
- report_definition_id (FK)
- status (queued, running, completed, failed)
- row_count (nullable)
- errors (JSONB, nullable)
- requested_by
- requested_at
- completed_at (nullable)

**report_run_exports**
- run_id (FK)
- format (csv, xlsx)
- file_ref
- generated_at

**report_schedules**
- schedule_id (PK, UUID)
- report_definition_id (FK)
- schedule
- format (csv, xlsx)
- recipients (JSONB, nullable)
- status (active, paused, archived)
- next_run_at
- created_by
- created_at
- updated_at

**chart_definitions**
- chart_id (PK, UUID)
- tenant_id
- chart_name
- source_report_definition_id (nullable)
- source_template_id (nullable)
- chart_type
- x_axis
- y_axis
- series (JSONB, nullable)
- filters (JSONB, nullable)
- group_by (JSONB, nullable)
- status (draft, active, deprecated, archived)
- version_id
- created_by
- created_at
- updated_at

**chart_definition_versions**
- chart_id (FK)
- version_id
- definition_snapshot (JSONB)
- created_by
- created_at

## Communication Tables (Minimum)

**communication_broadcasts**
- broadcast_id (PK, UUID)
- tenant_id
- broadcast_type (emergency, operational)
- vertical_id (nullable)
- target_type (person, household)
- target_filter (JSONB)
- channels (JSONB)
- consent_mode (strict, emergency_override)
- message_template_id (nullable)
- message_payload (JSONB, nullable)
- status (draft, requested, approved, sent, cancelled, failed, archived)
- created_by
- created_at
- approved_by (nullable)
- approved_at (nullable)
- sent_at (nullable)

**communication_broadcast_runs**
- run_id (PK, UUID)
- broadcast_id (FK)
- status (queued, running, completed, failed)
- targeted_count (nullable)
- delivered_count (nullable)
- errors_ref (nullable)
- started_at
- completed_at (nullable)

## Tenant Tables (Minimum)

**tenants**
- tenant_id (PK, UUID)
- tenant_name
- country_code
- data_residency_region
- status (active, suspended, archived)
- created_at
- updated_at

**tenant_config_versions**
- tenant_id (FK)
- config_version_id
- config_payload (JSONB)
- created_at

## Policy Tables (Minimum)

**policy_packs**
- policy_pack_id (PK, UUID)
- tenant_id
- vertical_id
- status (draft, requested, reviewed, approved, active, restricted, suspended, deprecated, archived)
- version_id
- active_from
- active_until (nullable)
- policy_rules (JSONB)
- created_by
- created_at
- updated_at

**policy_changes**
- policy_change_id (PK, UUID)
- policy_pack_id (FK)
- status (draft, requested, reviewed, approved, active, archived)
- active_from
- active_until (nullable)
- change_summary
- created_by
- created_at

## Core Tables (Minimum)

**persons**
- person_id (PK, UUID)
- tenant_id
- system_guid (unique)
- full_name
- date_of_birth (nullable)
- age_estimate (nullable)
- gender
- primary_contact (nullable)
- verification_status (provisional, verified)
- verified_by (nullable)
- verified_at (nullable)
- status (active, archived)
- created_by
- created_at
- updated_at

**person_identifiers**
- person_id (FK)
- tenant_id
- identity_type
- identity_number
- is_primary
- verified_at (nullable)

**households**
- household_id (PK, UUID)
- tenant_id
- household_name
- leader_id (FK)
- primary_geo_id (FK)
- address
- geo_lat (nullable)
- geo_lon (nullable)
- geo_accuracy (nullable)
- geo_captured_at (nullable)
- status (provisional, verified, archived)
- primary_household_id (nullable)
- annexure_code (nullable)
- created_by
- created_at
- updated_at

**household_memberships**
- household_id (FK)
- person_id (FK)
- relationship_type
- effective_from
- effective_until (nullable)
- verification_status

**family_relationships**
- person_id (FK)
- related_person_id (FK)
- relationship_type
- effective_from
- effective_until (nullable)
- verification_status

**geo_levels**
- level_id (PK, UUID)
- tenant_id
- level_type
- display_name
- order_index

**geo_nodes**
- geo_id (PK, UUID)
- tenant_id
- geo_name
- geo_code
- level_type
- parent_geo_id (nullable)
- status (draft, active, restricted, archived)
- effective_from
- effective_until (nullable)
- dispute_status (nullable)
- version_id
- centroid_lat (nullable)
- centroid_lon (nullable)
- boundary_ref (nullable)

**geo_node_versions**
- geo_id (FK)
- version_id
- snapshot (JSONB)
- changed_by
- changed_at

**geo_metric_definitions**
- metric_id (PK, UUID)
- tenant_id
- metric_code (unique per tenant)
- metric_name
- unit
- data_type
- source_type
- status (draft, active, deprecated, archived)
- created_at

**geo_metric_values**
- metric_value_id (PK, UUID)
- metric_id (FK)
- geo_id (FK)
- value
- value_date
- source_ref (nullable)
- status (active, corrected, archived)
- created_at

**community_centers**
- center_id (PK, UUID)
- tenant_id
- center_name
- center_type
- status (draft, active, restricted, archived)
- active_from
- active_until (nullable)
- verification_status
- address (nullable)
- primary_contact (nullable)
- verified_by (nullable)
- verified_at (nullable)
- owner_id
- created_by
- created_at
- updated_at

**community_center_geo**
- center_id (FK)
- geo_id (FK)

**community_center_verticals**
- center_id (FK)
- vertical_id (FK)

**facilities**
- facility_id (PK, UUID)
- tenant_id
- facility_name
- facility_type
- status (draft, requested, reviewed, approved, active, restricted, suspended, deprecated, archived)
- active_from
- active_until (nullable)
- primary_geo_id (FK)
- address (nullable)
- geo_lat (nullable)
- geo_lon (nullable)
- created_at
- updated_at

**facility_geo**
- facility_id (FK)
- geo_id (FK)

**facility_services**
- facility_id (FK)
- service_code
- service_name
- vertical_id (nullable)
- status (active, deprecated)

**infrastructure_projects**
- project_id (PK, UUID)
- tenant_id
- project_name
- project_type
- status (draft, requested, reviewed, approved, active, restricted, suspended, deprecated, archived)
- active_from
- active_until (nullable)
- primary_vertical_id (nullable)
- sponsor_org (nullable)
- created_at
- updated_at

**infrastructure_project_geos**
- project_id (FK)
- geo_id (FK)

**infrastructure_project_verticals**
- project_id (FK)
- vertical_id (FK)

**verticals**
- vertical_id (PK, UUID)
- tenant_id
- vertical_code (unique per tenant)
- vertical_name
- type (system, custom)
- status (draft, requested, reviewed, approved, active, restricted, suspended, deprecated, archived)
- owner_id
- policy_pack_id (nullable)
- created_by
- created_at
- updated_at

**vertical_aliases**
- vertical_id (FK)
- alias (unique per tenant)

## Constraints and Indexing (Minimum)

- persons.system_guid MUST be unique.
- person_identifiers MUST enforce unique (tenant_id, identity_type, identity_number).
- person_identifiers MUST enforce unique (person_id, identity_type, identity_number).
- households MUST enforce unique (tenant_id, household_name) when used as primary label.
- geo_nodes MUST enforce unique (tenant_id, geo_code).
- verticals MUST enforce unique (tenant_id, vertical_code).
- vertical_aliases MUST enforce unique (tenant_id, alias).
- community_centers SHOULD enforce unique (tenant_id, center_name).
- Foreign keys MUST be enforced for core relationships:
  - person_identifiers.person_id -> persons.person_id
  - households.leader_id -> persons.person_id
  - households.primary_geo_id -> geo_nodes.geo_id
  - household_memberships.household_id -> households.household_id
  - household_memberships.person_id -> persons.person_id
  - family_relationships.person_id -> persons.person_id
  - family_relationships.related_person_id -> persons.person_id
  - geo_nodes.parent_geo_id -> geo_nodes.geo_id
  - geo_node_versions.geo_id -> geo_nodes.geo_id
  - geo_metric_values.metric_id -> geo_metric_definitions.metric_id
  - geo_metric_values.geo_id -> geo_nodes.geo_id
  - community_center_geo.center_id -> community_centers.center_id
  - community_center_geo.geo_id -> geo_nodes.geo_id
  - community_center_verticals.center_id -> community_centers.center_id
  - community_center_verticals.vertical_id -> verticals.vertical_id
  - facilities.primary_geo_id -> geo_nodes.geo_id
  - facility_geo.facility_id -> facilities.facility_id
  - facility_geo.geo_id -> geo_nodes.geo_id
  - facility_services.facility_id -> facilities.facility_id
  - infrastructure_project_geos.project_id -> infrastructure_projects.project_id
  - infrastructure_project_geos.geo_id -> geo_nodes.geo_id
  - infrastructure_project_verticals.project_id -> infrastructure_projects.project_id
  - infrastructure_project_verticals.vertical_id -> verticals.vertical_id
  - service_encounters.person_id -> persons.person_id
  - service_encounters.facility_id -> facilities.facility_id
  - attendance_records.person_id -> persons.person_id
  - attendance_records.facility_id -> facilities.facility_id
  - vertical_aliases.vertical_id -> verticals.vertical_id
- Indexes SHOULD exist for:
  - person_identifiers (tenant_id, identity_number)
  - households (tenant_id, primary_geo_id)
  - households (tenant_id, geo_lat, geo_lon) when coordinates are captured
  - geo_nodes (tenant_id, parent_geo_id)
  - geo_nodes (tenant_id, centroid_lat, centroid_lon) when centroids are captured
  - facilities (tenant_id, primary_geo_id)
  - facilities (tenant_id, geo_lat, geo_lon) when coordinates are captured
  - geo_metric_values (metric_id, geo_id, value_date)
  - cases (tenant_id, primary_vertical_id, status)
  - consents (tenant_id, person_id, vertical_id, status)
  - attachments (tenant_id, target_type, target_id)
  - service_encounters (tenant_id, person_id, encounter_date)
  - attendance_records (tenant_id, person_id, period_start)
  - report_definitions, report_runs, report_schedules, and pipeline_runs (tenant_id, created_at)

## Agent and Visit Tables (Minimum)

**agents**
- agent_id (PK, UUID)
- tenant_id
- person_id
- role_classification
- status (active, suspended, archived)
- active_from
- active_until (nullable)
- created_by
- created_at
- updated_at

**agent_geo_scopes**
- agent_id (FK)
- geo_id (FK)
- effective_from
- effective_until (nullable)

**visits**
- visit_id (PK, UUID)
- tenant_id
- agent_id
- target_type
- target_id
- status (draft, submitted, verified, archived)
- visit_date
- created_by
- created_at
- updated_at

**visit_verticals**
- visit_id (FK)
- vertical_id (FK)
- role (primary or participant)

**visit_status_history**
- visit_id (FK)
- status
- changed_by
- changed_at

**service_encounters**
- encounter_id (PK, UUID)
- tenant_id
- person_id (FK)
- facility_id (nullable)
- encounter_type
- encounter_date
- vertical_id
- status
- recorded_by
- recorded_at

**attendance_records**
- attendance_id (PK, UUID)
- tenant_id
- person_id (FK)
- facility_id (nullable)
- period_start
- period_end
- attendance_rate (nullable)
- attendance_count (nullable)
- status
- recorded_by
- recorded_at

## Marketplace Access Tables (Minimum)

**marketplace_access_requests**
- access_request_id (PK, UUID)
- tenant_id
- organization_name
- request_purpose
- vertical_ids (JSONB)
- program_ids (JSONB, nullable)
- status (requested, approved, rejected)
- requested_by
- requested_at

**marketplace_access_grants**
- access_grant_id (PK, UUID)
- tenant_id
- access_request_id (FK)
- vertical_ids (JSONB)
- program_ids (JSONB, nullable)
- active_from
- active_until
- status (active, revoked, expired, archived)
- created_by
- created_at

## Donor Tables (Minimum)

**donors**
- donor_id (PK, UUID)
- tenant_id
- donor_name
- donor_type (organization, individual)
- status (draft, active, suspended, archived)
- anonymous (boolean)
- created_by
- created_at
- updated_at

**donor_programs**
- donor_id (FK)
- program_id (FK)
- vertical_id (FK)
- status (active, ended)

**donor_access_grants**
- donor_id (FK)
- vertical_id (FK)
- program_id (nullable)
- active_from
- active_until
- status (active, revoked, expired)

## Edge Cases

- Large JSONB payloads.
- Schema evolution with backward compatibility.

## Audit & Logs

- Schema migrations MUST be logged.
- DDL changes MUST be auditable.

## Open Questions

- None.

## References

- SPEC/10-data/06-retention-archival.md
- SPEC/02-architecture/07-performance-and-scale.md
