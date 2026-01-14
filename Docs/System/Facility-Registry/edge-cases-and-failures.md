# Edge Cases & Failures: Facility Registry

## Edge Cases
1.  **Moving Facility**: A mobile clinic or a relocated school.
    - *Handling*: Update `geo_id` and Coordinates. Log the move.
2.  **Duplicate Data**: Two ministries register the same "Community Hall".
    - *Policy*: Manual Reconciliation. Merge records or keep separate if distinct functions (School by day, Shelter by night).

## Failure Handling
- **Missing Coords**: Allow creation but flag as "Unmapped". Exclude from "Distance" calculations.
