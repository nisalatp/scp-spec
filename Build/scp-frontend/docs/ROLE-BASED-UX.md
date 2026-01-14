# Role-Based UX & Guardrails

This document defines how the SCP frontend surfaces complex security and scope logic to the user.

## Scope Visualization
Users MUST always be aware of their active scope to prevent accidental data entry in the wrong context.
- **Tenant Scope**: Display the active Tenant Name (e.g., "Province of Kandy") in the top navigation bar.
- **Geo Scope**: Field views MUST visually bound the searchable area (e.g., "Active District: Gampaha").
- **Vertical Scope**: Dashboards MUST be clearly themed by vertical (Health = Blue, Education = Green).

## Consent UX Requirements
- **Mandatory Interstitial**: Consent MUST be captured via a distinct, non-skippable UI component before proceeding with any PII data entry.
- **Version Awareness**: If a citizen's consent version has changed, the UI MUST re-prompt for acknowledgement.

## Deny-Wins Behavior
- **Graceful Denial**: If a user lacks permission for a specific feature, the UI SHOULD hide the button/element entirely.
- **Explainable Rejection**: If a user attempts an action via broad exploration that is denied (e.g., cross-tenant search), the error message MUST be safe (e.g., "Resource not found or access denied") and not leak system structure.

## Safe Messaging
- DO NOT display raw database errors.
- DO NOT expose internal file paths or component names in public error toasts.
