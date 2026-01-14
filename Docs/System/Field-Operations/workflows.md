# Workflows: Data Collection

## Workflow: Offline Sync
1.  **Actor**: Agent (Offline).
2.  **Action**: Complete 10 Forms.
3.  **Connection**: Agent reaches Wi-Fi.
4.  **Sync**: App POSTs 10 Visits.
5.  **Server**: Validates Geo, Auth, and Schema.
6.  **Result**: 10 Visits created with `status=Submitted`.
7.  **Downstream**: `VisitSubmitted` event triggers Case Worker inbox.

## Workflow: Conflict Resolution (Negative Flow)
1.  **Scenario**: Agent A maps House 1. Agent B maps House 1 (Duplicate).
2.  **Sync**: Both upload.
3.  **Detection**: Server sees Same GPS / Address.
4.  **Action**: Flag both as `Conflict`.
5.  **Resolution**: Case Worker merges or rejects one.
