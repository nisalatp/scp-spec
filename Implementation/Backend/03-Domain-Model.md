# Domain Model

## Entities

### Core
*   **Person**: The central entity. `UUID`, `Biometrics`, `Demographics`.
*   **Household**: Grouping unit. `HeadOfHH`, `Members[]`, `Location`.

### Vertical Extensions (Polymorphic)
*   **HealthProfile**: Linked to Person. `Conditions[]`, `Vaccinations[]`.
*   **EduProfile**: Linked to Person. `School`, `Grade`, `Attendance`.
*   **EconProfile**: Linked to Person. `EmploymentStatus`, `Income`.

### Custom Verticals (Dynamic)
*   **CustomEntity**: Generic entity for Geo-Verticals.
    *   Example: `WaterPoint` (WASH), `Shelter` (Housing).
    *   Attributes defined by `MetaSchema`.

## Relationships
*   `Person` (1) <-> (1) `HealthProfile`
*   `Person` (1) <-> (1) `EduProfile`
*   `Person` (*) <-> (1) `Household`
*   `Household` (1) <-> (*) `CustomEntity` (Spatial link)

## Lifecycle
*   **Draft**: Created but not verified.
*   **Active**: Biometrically verified (UC-18).
*   **Archived**: Deceased or migrated.
