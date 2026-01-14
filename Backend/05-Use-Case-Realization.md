# Use Case Realization (Backend)

## UC-01: Emergency Blood Matching
*   **API**: `GET /api/health/search?blood_type=X&geo=Y`
*   **Logic**: Filter by Blood Type + Geo-Radius. Trigger `NotificationService` (SMS).
*   **Policy**: `Emergency_Override` enabled.

## UC-05: School Supplies Donation
*   **API**: `POST /api/finance/grants`
*   **Logic**: Check `EduProfile.Attendance` > 80%. If yes, issue voucher.
*   **Data**: Write to `Finance.Transactions` and `Edu.Benefits`.

## UC-09: Sanitation Infrastructure (WASH)
*   **API**: `GET /api/geo/wash/survey`
*   **Logic**: Dynamic Query on `CustomEntity:Toilet`. Overlay with `Household` location.
*   **Gap**: Depends on GIS Module (See `Lapses/gis-module`).

## UC-25: Women at Risk Exclusion
*   **API**: `POST /api/analytics/query`
*   **Logic**: Join `Person` + `EduProfile` + `EconProfile` + `WelfareStatus`.
    *   Filter: `Gender=F` AND `Degree=True` AND `Job=Null` AND `Welfare=Null`.
*   **Performance**: Uses Read-Optimized View or Data Warehouse.

## UC-44: Community Risk Index
*   **API**: `GET /api/analytics/community/{id}/risk`
*   **Logic**: Aggregation pipeline.
    *   Sum (HealthRisk + EduGap + InfraGap + EnvRisk) / 4.
*   **Optimization**: Pre-calculated nightly batch job.
