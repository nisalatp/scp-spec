# SCP-SPEC-VERT-01: System Verticals

## Purpose

This document defines system verticals that are always enabled in SCP and form the mandatory, non-removable interest domains across all tenants.

## In Scope / Out of Scope

**In Scope**
- Definition of mandatory system verticals
- Core responsibilities of each system vertical

**Out of Scope**
- Vertical-specific program implementations
- UI representation of verticals

## Definitions

- System Vertical: A platform-defined vertical that cannot be removed or disabled.
- Interest Domain: The thematic area a vertical represents.

## Rules (MUST/SHOULD/MAY)

- The following system verticals MUST always exist and be enabled:
  - Health and Environment
  - Education, Sports, and Skill Development
  - Economy and Livelihood
  - Finance
  - Data
- System verticals MUST be immutable in identity.
- System verticals MUST follow the standard vertical lifecycle.
- Tenants MUST NOT disable system verticals.
- System vertical behavior MAY be configured within allowed limits.
- Additional system verticals MAY be introduced in the future through umbrella authority approval and governed change control.
- New system verticals MUST be documented, versioned, and seeded for all tenants once approved.

## Baseline Required Data by System Vertical

This baseline lists the minimum person, family, and household data commonly required by each system vertical, aligned with international best practices and enhanced using Muslimaid SCP v2 data capture. Terminology is neutral and avoids religion- or culture-specific labels. Tenants MAY extend these requirements through governed forms and policy packs.

| System Vertical | Person Required Data (Baseline) | Household Required Data (Baseline) | Family Required Data (Baseline) |
| --- | --- | --- | --- |
| Health and Environment | GUID, full_name, title, gender, date_of_birth, person_age, identity_type, identity_number, contacts, health_records (criteria_id, value, record_date, start_date, end_date, active), health_cost (has_cost, cost_type, cost_value, cost_end_date), chronic_conditions, disability_status, pregnancy_status, vaccination_status | household_name, address, phone, area_mahalla, leader_id, status, members_count, water_source, sanitation_type, cooking_fuel, environmental_risk_flags | guardian_relationships, dependents_list, caregiver_links |
| Education, Sports, and Skill Development | identity, education_records (institution, level, qualification_name, field_of_study, specialization, grade, certification_date, certificate_number, is_verified, funding_source, course_fee), enrolments (school, academic_year, grade, status, admission_number), exam_results, subject_registrations, activity_participation (role, level, achievement), skills (skill, proficiency) | household_name, address, school_age_count, education_assets (internet, device_access) | guardian_relationships, dependents_list, school_guardian_links |
| Economy and Livelihood | identity, work_history (workplace, work_type, job_title, employment_type, start_date, end_date, salary, currency, working_hours_per_week, is_verified), current_occupation_status, occupation_categories (ISCO), employment_skills, employment_references, performance_reviews, career_milestones, properties (type, value, ownership_type) | household_name, address, household_income_band, expenses (amount, currency, recurrence), livelihood_assets, dependents_count, food_security_status | dependents_list, primary_earner_links |
| Finance | identity, financial_obligations, bank_account_status, mobile_wallet_status, charitable_commitments, charitable_payments, mutual_aid_subscriptions, expenses, benefit_eligibility | household_name, address, household_budget_band, financial_risk_flags, benefit_receipt_status, household_contributions | dependents_list, household_finance_responsible |
| Data | GUID, full_name, title, gender, marital_status, date_of_birth, person_age, identity_type, identity_number, nationality, language, belief_affiliation, place_of_birth, birth_village, ancestry_status, ancestry_group, affiliation_change_info, birth_certificate_info, contacts, consent_status_by_vertical, identity_verification_status, add_details | household_name, address, phone, area_mahalla, guid, leader_id, status, membership_links, joint_household_info, community_center_links, data_sharing_restrictions | relationships (father, mother, spouse), family_membership_links, guardian_relationships |

## Edge Cases

- Jurisdictions restricting certain interventions within a system vertical.
- System vertical temporarily restricted due to compliance issues.

## Audit & Logs

- System vertical configuration changes MUST be logged.
- Attempts to disable system verticals MUST be rejected and logged.

## Open Questions

- None.

## References

- SPEC/01-vision/04-verticals-concept.md
- SPEC/05-governance/03-vertical-governance.md
