# Auth & Scoping Architecture

This document defines the implementation of Authorization and Scoping in the SCP Backend.

## Authentication
- Identity management is handled externally by **Keycloak** via OIDC.
- The backend MUST validate the JWT signature and expiration.

## Scoped Authorization (PDP/PIP)
- Every request is subject to a Policy Decision Point (PDP).
- **Tenant Scope**: Data isolation MUST be enforced at the database level (RLS or global filters).
- **Geo Scope**: Search results MUST be filtered by the user's assigned `GeoNodeID` and its children in the hierarchy.
- **Vertical Scope**: Feature flags and data access are restricted by the `VerticalID`.

## Permission Resolution
- Permissions are resolved using the `resource.action` dot-notation.
- The Backend MUST load the user's role-to-permission mapping on every request (cached in Redis).
