# SCP Frontend Implementation

This is the standalone frontend implementation for the Smart Community Platform (SCP).

## Relationship to SPEC & Docs
This project implements the UI/UX as defined in the following authoritative sources:
- [System Specification (SPEC)](file:///C:/Users/NisalaBandara/Projects/scp-spec/SPEC/README.md) - Source of Truth.
- [Role Definitions](file:///C:/Users/NisalaBandara/Projects/scp-spec/Docs/Roles/README.md) - Permission behaviors.
- [System Components](file:///C:/Users/NisalaBandara/Projects/scp-spec/Docs/System/README.md) - Feature matrices.
- [Usage Scenarios](file:///C:/Users/NisalaBandara/Projects/scp-spec/Docs/Usage/README.md) - User flows.

## Role & Permission Behavior
- The frontend MUST enforce UI-level visibility based on the roles defined in `Docs/Roles/`.
- Scopes (Tenant, Geo, Vertical, Program) MUST be visually distinct.
- Permissions MUST follow the dot-notation (`resource.action`) defined in the [Role-Permission Map](file:///C:/Users/NisalaBandara/Projects/scp-spec/Docs/_meta/reconciliation/role-permission-map.md).

## Local Development Runbook
1.  **Environment Setup**: Copy `configs/.env.example` to `.env`.
2.  **Dependencies**: `npm install`.
3.  **Start Dev Server**: `npm start`.
4.  **API Mocking**: Use `npm run mock-api` if backend is unavailable.

## Implementation Docs
- [Implementation Guide](docs/IMPLEMENTATION-GUIDE.md)
- [UI Navigation Map](docs/UI-NAVIGATION-MAP.md)
- [Role-Based UX](docs/ROLE-BASED-UX.md)
- [Error Handling Standards](docs/ERROR-HANDLING-STANDARDS.md)
