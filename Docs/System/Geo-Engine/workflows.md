# Workflows: Geo Engine

## Workflow: Setup
1.  **Actor**: Admin.
2.  **Action**: Define Levels `[Country, Province, District]`.
3.  **Action**: Upload CSV of Nodes.
4.  **System**: Validates parent codes.
5.  **Result**: Tree built.

## Workflow: Conflict (Negative Flow)
1.  **Action**: Create Node "Village X" with Parent "District Y".
2.  **Check**: Does "District Y" exist? No.
3.  **Result**: 400 Bad Request "Parent Missing".

## Workflow: Re-Org
1.  **Trigger**: Govt changes boundaries.
2.  **Action**: Move "Village A" from "District Y" to "District Z".
3.  **Impact**: All Persons in Village A now report to District Z permissions.
