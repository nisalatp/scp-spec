# SCP-SPEC-DOM-13: Service Encounters and Attendance

## Purpose

This document defines service encounters and attendance records required for health and education analytics and eligibility checks.

## In Scope / Out of Scope

**In Scope**
- Health service encounters
- Education attendance records
- Facility linkage

**Out of Scope**
- Full clinical records
- Learning management systems

## Definitions

- Service Encounter: A recorded interaction between a person and a facility or provider.
- Attendance Record: A time-bound record of participation in education.

## Rules (MUST/SHOULD/MAY)

- Encounters MUST be tenant-scoped and linked to a person.
- Encounters SHOULD reference a facility when available.
- Encounter types MUST be coded (antenatal, immunization, consultation, other).
- Attendance MUST be recorded per period with an attendance_rate or attendance_count.
- Attendance records MUST be auditable and versioned when corrected.
- Encounters and attendance MUST respect consent and vertical scoping.

## Minimum Required Fields

**Service Encounter**
- encounter_id (system GUID)
- tenant_id
- person_id
- facility_id (nullable)
- encounter_type
- encounter_date
- vertical_id
- status
- recorded_by, recorded_at

**Attendance Record**
- attendance_id (system GUID)
- tenant_id
- person_id
- facility_id (school, nullable)
- period_start
- period_end
- attendance_rate (percentage) or attendance_count
- status
- recorded_by, recorded_at

## Edge Cases

- Encounter recorded without facility reference.
- Attendance data provided by external systems with delayed timestamps.

## Audit & Logs

- Encounter creation and updates MUST be logged.
- Attendance corrections MUST be auditable.

## Open Questions

- None.

## References

- SPEC/06-platform-core/11-facility-registry.md
- SPEC/11-apis/26-encounters-attendance-api.md
