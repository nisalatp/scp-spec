# Frontend UX Flows & Patterns

## Personas
1.  **Beneficiary**: Mobile-first, low-bandwidth, offline-capable PWA.
2.  **Field Worker**: Tablet/Phone, heavy offline usage, data entry focused.
3.  **Planner/Admin**: Desktop, dashboard-heavy, data visualization.

## Core Navigation (Worker App)
*   **Home/Dashboard**: Tasks for the day (UC-03, UC-24).
*   **Search**: Find Beneficiary (Online/Offline cache).
*   **Registration**: Wizards for new Person/Household (UC-18).
*   **Vertical Modules**:
    *   **Health**: Diagnosis, Vitals forms.
    *   **Edu**: Attendance, Grade entry.
    *   **Custom**: Dynamic Icon Grid for Geo-Verticals (WASH, Housing).

## Dynamic UX for Geo-Verticals
*   **Schema-Driven UI**: The Mobile App downloads the JSON Schema for custom entities (e.g., Toilet Survey).
*   **Form Rendering**: Auto-generates forms (Text, Date, GPS, Photo) from schema.
*   **Map overlay**: Renders custom entity markers on the geo-map.

## Offline Strategy (Critical for UC-01, 13)
*   **Sync Logic**: "Upload First". Data captured offline is queued.
*   **Conflict Resolution**: "Last Write Wins" for field fields, "Merge" for lists.
*   **Vector Maps**: Cache local region map tiles.
