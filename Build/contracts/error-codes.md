# Standardized Error Codes

These codes MUST be used by the Backend in the `error.code` field and by the Frontend to trigger specific UI behaviors.

| Code | Category | Description |
| :--- | :--- | :--- |
| `ERR_AUTH_EXPIRED` | Auth | Session token is no longer valid. |
| `ERR_AUTH_INVALID` | Auth | Authentication credentials failed. |
| `ERR_SEC_FORBIDDEN` | Security | User does not have the required permission. |
| `ERR_SEC_SCOPE_VIOLATION` | Security | User attempted to access data outside their Geo/Tenant scope. |
| `ERR_CON_REQUIRED` | Consent | Citizen consent is missing for this PII action. |
| `ERR_CON_EXPIRED` | Consent | Existing consent has expired and must be re-captured. |
| `ERR_VAL_MISSING_FIELD` | Validation| A required field was not provided. |
| `ERR_VAL_INVALID_FORMAT` | Validation| Data does not match the required schema (e.g. invalid email). |
| `ERR_VAL_RULE_VIOLATION` | Validation| Business rule failure (e.g. eligibility check failed). |
| `ERR_SYS_DB_FAILURE` | System | Database connection error. |
| `ERR_SYS_UPSTREAM_DOWN` | System | An external integration (e.g. SMS) is unavailable. |
