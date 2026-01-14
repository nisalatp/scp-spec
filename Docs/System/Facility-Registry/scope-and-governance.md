# Scope & Governance: Facility Registry

## Scope Rules
- **Vertical Partitioning**: Education Ministry controls School registry; Health Ministry controls Hospital registry.
- **Unique ID**: A facility must have a stable GUID, separate from any Government Legacy ID.

## Governance Policies
### 1. Data Quality
- Coordinates (Lat/Long) are Mandatory for "Active" status (soft enforcement, allows legacy ingestion as Draft).

### 2. De-Duplication
- Before creation, the system checks for name/location proximity to prevent duplicate entries.
