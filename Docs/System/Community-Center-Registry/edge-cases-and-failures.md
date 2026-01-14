# Edge Cases & Failures: Community Center Registry

## Edge Cases
1.  **Shared Use**: A School (Education) is also a Community Center (Social) on weekends.
    - *Modeling*: Link `Community Center` record to existing `Facility` record (or share same `geo_id`/`address`).
2.  **Destruction**: Center destroyed by disaster.
    - *Action*: Mark `status=Destroyed`. Disable future bookings.

## Failure Handling
- **GPS Drift**: Hall is large.
    - *Policy*: Use the Application Entrance coordinate.
