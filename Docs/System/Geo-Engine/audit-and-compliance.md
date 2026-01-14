# Audit & Compliance: Geo Engine

## Logged Events
- `geo.create`, `geo.update`, `geo.move`.

## Fields
- `effective_date`.
- `authority` (Who mandated the change).

## Retention
- Geo history is critical for reconstructing past stats. Indefinite retention recommended (`is_active=false`).
