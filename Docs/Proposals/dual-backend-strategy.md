# PROPOSAL: Dual-Backend Strategy (DotNet & Laravel)

**Status:** DRAFT (Brainstorming)
**Date:** 2026-01-14

## 1. Objective
To provide flexibility in hosting and licensing by offering two distinct, feature-equivalent backend implementations that serve the same Frontend.

## 2. Architecture

### 2.1 The "Strict Contract" Pattern
Since the Frontend is shared, the API Layer MUST be the single source of truth. Both backends must implement the exact same REST/GraphQL interface.

- **Frontend**: framework-agnostic (React/Vue/Angular) talking to a standard OpenAPI spec.
- **Backend A (.NET Core)**:
    - **Pros**: High performance, strong typing, Enterprise adoption.
    - **Stack**: C#, EF Core, PostgreSQL/MSSQL.
- **Backend B (Laravel)**:
    - **Pros**: Rapid development, ease of deployment, lower barrier to entry.
    - **Stack**: PHP 8.x, Eloquent, MySQL/PostgreSQL.

### 2.2 Directory Structure (Proposed)
Current `Build/scp-backend` will be split:

```
Build/
├── backend-dotnet/    # New .NET Core implementation
├── backend-laravel/   # New Laravel implementation
├── scp-frontend/      # Shared Frontend (Unchanged)
└── tests/
    └── contract/      # Shared API Contract Tests (Postman/Newman or Cypress)
```

## 3. Implementation Challenges & Mitigations

| Challenge | Mitigation |
|---|---|
| **Feature Parity** | Use "Contract Testing". Run the *same* test suite against both backends in CI. |
| **Logic Duplication** | Logic cannot be shared (C# vs PHP). Detailed SPEC is crucial to ensure identical behavior. |
| **Database Schema** | Schemas might diverge slightly (EF Core vs Eloquent Migrations), but the *Data Shape* at the API edge must be identical. |
| **Authentication** | Both must implement the exact same OIDC/JWT flow (likely leveraging Keycloak as the standard Identity Provider). |

## 4. Next Steps
1.  Rename `Build/scp-backend` to `Build/backend-laravel` (or `backend-dotnet` depending on what's there).
2.  Scaffold the second backend.
3.  Setup a "Contract Test" harness.
