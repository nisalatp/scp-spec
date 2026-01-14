# Frontend Implementation Guide

This guide provides technical instructions for implementing SCP Frontend modules.

## Tech Stack (Recommended)
- **Framework**: React / Next.js (per [Logical Architecture](file:///C:/Users/NisalaBandara/Projects/scp-spec/SPEC/02-architecture/02-logical-architecture.md))
- **Language**: TypeScript
- **State Management**: Redux Toolkit or React Query
- **Styling**: Tailwind CSS / Vanilla CSS

## Architectural Rules
1.  **Component Seeding**: Every module MUST reside in `/src/modules/<module-name>`.
2.  **Logic Separation**: Components MUST only handle UI. Complex business logic (rules, eligibility) MUST reside in hooks or services.
3.  **Permission Hooks**: Use the custom `usePermission(namespace)` hook to guard UI elements.
    - Example: `const canCreate = usePermission('person.create')`
4.  **Form Generation**: Use the dynamic form engine to render forms from the [Form Library](file:///C:/Users/NisalaBandara/Projects/scp-spec/Docs/System/Form-Builder/README.md).

## Security Guardrails
- DO NOT store sensitive PII in local storage or unencrypted state.
- Ensure all API calls include the `X-Tenant-ID` and `X-Geo-Scope` headers.
- Wipe sensitive state on logout or session timeout.
