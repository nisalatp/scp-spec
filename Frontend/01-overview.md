# 01 Overview

This guide explains how to build the SCP frontend using React.
The system is API only in Phase 1, so the frontend is a pure client to SCP APIs.

## What SCP Frontend Must Do

- Authenticate users with Keycloak.
- Enforce tenant, vertical, and program scoping in the UI.
- Respect consent rules and masking.
- Provide case, program, reporting, and admin workflows.
- Log user actions and handle errors clearly.

## Non Goals

- No direct database access.
- No raw SQL or admin shortcuts.
- No cross tenant access without umbrella approval.

## Key Concepts You Must Know

- Tenant = country boundary.
- Vertical = governance boundary.
- Consent is per person and per vertical.
- Deny wins in all permission checks.
- ROOT bypass exists but is enforced server side only.

## Checklist

- You understand tenant and vertical scope.
- You know consent is enforced by the API.
- You know the UI must not bypass governance.
