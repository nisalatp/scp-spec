# SCP-SPEC-API-26: Encounters and Attendance API

## Purpose

This document defines APIs for service encounters and education attendance records.

## In Scope / Out of Scope

**In Scope**
- Service encounter capture
- Attendance record capture

**Out of Scope**
- Full clinical records
- Learning management systems

## Definitions

- Service Encounter: Recorded interaction with a service provider.
- Attendance Record: Time-bound participation record for education.

## Rules (MUST/SHOULD/MAY)

- Encounter and attendance APIs MUST enforce tenant isolation and consent.
- Encounters SHOULD reference facilities when available.
- Attendance records MUST be time-bound with a rate or count.
- Corrections MUST be versioned and auditable.

## API Endpoints

### Service Encounters

- `GET /encounters`
  - Input: person_id (optional), facility_id (optional), encounter_type (optional), from_date (optional), to_date (optional)
  - Output: encounter_id, person_id, facility_id, encounter_type, encounter_date, status
- `POST /encounters`
  - Input: person_id, facility_id (optional), encounter_type, encounter_date, vertical_id, status
  - Output: encounter_id, status, created_at
- `PATCH /encounters/{encounter_id}`
  - Input: encounter_type (optional), encounter_date (optional), status (optional)
  - Output: encounter_id, updated_at, version_id

### Attendance Records

- `GET /attendance`
  - Input: person_id (optional), facility_id (optional), period_start (optional), period_end (optional)
  - Output: attendance_id, person_id, facility_id, attendance_rate, period_start, period_end, status
- `POST /attendance`
  - Input: person_id, facility_id (optional), period_start, period_end, attendance_rate or attendance_count, status
  - Output: attendance_id, status, created_at
- `PATCH /attendance/{attendance_id}`
  - Input: attendance_rate (optional), attendance_count (optional), status (optional)
  - Output: attendance_id, updated_at, version_id

## Edge Cases

- Encounter recorded without facility reference.
- Attendance periods overlapping or duplicated.

## Audit & Logs

- Encounter creation and updates MUST be logged.
- Attendance corrections MUST be auditable.

## Open Questions

- None.

## References

- SPEC/03-domain/13-service-encounters-attendance.md
- SPEC/06-platform-core/11-facility-registry.md
