# Backend API Standards

All SCP Backend APIs MUST adhere to these RESTful standards to ensure interoperability and security.

## Endpoint Naming
- Use plural nouns for resources (e.g., `/persons`, `/households`).
- Use kebab-case for multi-word segments.
- Root versioning: `/api/v1/...`

## Mandatory Headers
- `X-Tenant-ID`: The GUID of the active tenant.
- `X-Geo-Scope`: The GUID of the active GeoNode.
- `X-Trace-ID`: Correlation ID for log tracing.

## Resource Representation
- Use JSON for all request/response bodies.
- Dates MUST follow ISO 8601 UTC format (`YYYY-MM-DDTHH:mm:ssZ`).
- Currency MUST be represented as `Decimal` or `long` (cents), never float.

## Success & Failure
- **200 OK**: Request successful.
- **201 Created**: Resource created successfully.
- **204 No Content**: Successful update/delete with no body.
- **400 Bad Request**: Validation or business rule violation.
- **401 Unauthorized**: Missing/invalid token.
- **403 Forbidden**: Valid token, but insufficient permissions/scope.
