# API Catalogue

## Core APIs
*   `POST /api/v1/persons`: Register new beneficiary. (UC-01, UC-18)
*   `GET /api/v1/persons/{id}`: Retrieve profile.
*   `POST /api/v1/households`: Group persons. (UC-13, UC-28)

## Vertical APIs
### Health
*   `POST /api/health/conditions`: Record diagnosis. (UC-03)
*   `GET /api/health/risks/{id}`: Get risk profile. (UC-02)

### Education
*   `GET /api/edu/students`: Search students.
*   `POST /api/edu/attendance`: Log attendance. (UC-06)

### Economy
*   `GET /api/econ/jobs`: List vacancies. (UC-08)
*   `POST /api/econ/applications`: Apply for job.

### Finance
*   `POST /api/finance/payments`: Initiate disbursement. (UC-05, UC-14)
*   `GET /api/finance/audit`: Get transaction logs. (UC-23)

## Advanced Query API
*   `POST /api/analytics/query`: Cross-vertical complex query. (UC-25 to UC-44)
    *   Payload: `{ "verticals": ["health", "housing"], "filters": [...] }`

## Geo-Vertical API
*   `POST /api/geo/{vertical_id}/records`: Create custom record (e.g., Water Point). (UC-09)
*   `GET /api/geo/{vertical_id}/query`: Spatial query. (UC-10)
