# Backend Error Contracts

Failures MUST be returned in a consistent, machine-readable format.

## Standard Error Response
```json
{
  "error": {
    "code": "ERR_CORE_CONSENT_MISSING",
    "message": "Citizen consent has not been captured for this operation.",
    "target": "personId",
    "traceId": "uuid-trace"
  }
}
```

## Error Categories
- `ERR_AUTH_*`: Authentication and session issues.
- `ERR_VAL_*`: Schema or business rule validation failures.
- `ERR_SEC_*`: Authorization or scope violations.
- `ERR_CON_*`: Consent-specific failures.
- `ERR_SYS_*`: Internal platform errors.
