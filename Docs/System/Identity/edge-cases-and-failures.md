# Edge Cases & Failures: Identity

## Edge Cases
1.  **Twins**: Same DOB, Name, Parents. (Differentiated by GUID/Biometrics in future).
2.  **No ID**: Person has no documents. (Registered with Provisional ID + Photo).
3.  **Identity Theft**: Two people claiming same NIC. (Conflict Queue -> Audit).
4.  **Name Change**: Marriage/Legal change. (Update name, keep Alias in history).
5.  **Death**: Mark status as Deceased. (Stop benefits, keep record).
6.  **High Mobility**: Person moves Geo frequently. (Geo scope updates required).
7.  **Data Merge**: Two GUIDs found to be same person. (Merge tool required).
8.  **Split**: One GUID found to be two people. (Split tool required).
9.  **Restricted Access**: VIP/Witness. (Requires `role.access_level > restricted`).
10. **Consent Race**: Consent withdrawn while update in flight. (Update might fail).

## Failure Handling
- **Search Fail**: If legacy ID system is down, Local Search only.
