# FB-005: Sanitation Survey (WASH)

## Purpose
Geo-Vertical specific form for mapping Sanitation Infrastructure (Toilets, Sewers) to support UC-09.

## Scope
*   **Vertical**: Geo-Vertical `WASH`.
*   **Geo-Fencing**: Dynamic (e.g., "District A").
*   **Target**: `CustomEntity:SanitationPoint`.

## Build Instructions
1.  **Create Form**: Select "New Form", Type="Survey", Scope="Geo:WASH".
2.  **Section 1: Infrastructure**:
    *   Add `GPS Field`: "Location".
    *   Add `image`: "Photo of Site".
    *   Add `Enum`: "Structure Type" (Pit Latrine, Septic Tank, Sewer).
3.  **Section 2: Status**:
    *   Add `Boolean`: "Is Functional?".
    *   Add `Text`: "Damage Description" (Show if Functional=False).
4.  **Bindings**:
    *   Requires **Dynamic Schema** creation for `SanitationPoint` (See `Lapses/geo-extension`).
