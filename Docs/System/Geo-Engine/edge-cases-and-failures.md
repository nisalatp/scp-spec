# Edge Cases & Failures: Geo Engine

## Edge Cases
1.  **Orphaned Nodes**: Parent deleted. (Must prohibit or cascade).
2.  **Circular Ref**: A -> B -> A. (Graph validation).
3.  **Disputed Territory**: Region claimed by two districts. (Special "Disputed" status).
4.  **Code Reuse**: "V1" deleted, then "V1" recreated. (Audit confusion, use unique UUIDs internally).
5.  **Infinite Depth**: Malformed hierarchy. (Max depth enforcement).
6.  **Coordinate Drift**: Centroid outside Boundary. (Data Quality warning).
7.  **Unmapped Point**: Lat/Lon falls in no known district. (Assign to "Unknown" bucket).
8.  **Time-Bound**: District exist from 2020-2024. (Temporal support).
9.  **Scale**: 50,000 Villages. (Payload size issues on mobile sync).
10. **Partial Sync**: Agent only needs 1 District. (Partial replication support).

## Failure Handling
- **Spatial DB Down**: Fallback to simple Text/Code based hierarchy validation.
