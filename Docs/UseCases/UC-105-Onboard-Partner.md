# UC-105: Onboard Partner

## Goal
To securely establish a digital relationship between the SCP platform and an external organization (e.g., NGO, Bank, or Government Department), enabling programmatic data exchange via APIs and webhooks while maintaining strict data residency and privacy controls.

## Actors
*   **Partner Tech Lead**: Representative of the external organization who requests and tests the integration.
*   **Integration Manager**: Configures the technical parameters and scopes of the connection.
*   **Tenant Admin**: Provides high-level institutional approval for the data-sharing relationship.
*   **System**: Automates credential generation and ensures scope enforcement at the API gateway level.

## Preconditions
*   A legal data-sharing agreement is signed and recorded offline.
*   The external organization has a defined technical focal point (Tech Lead).
*   The SCP platform is configured with an active `Integrations Layer` and `Security & Access Control` layer.

## Main Flow
1.  **Partner Registration**: Integration Manager creates a new partner record, defining the organization's name, legal basis, and primary technical contacts.
2.  **Scope Definition**: Integration Manager defines the "Least Privilege" scopes for the partner (e.g., `beneficiary:read:anonymous`, `payment:status:update`).
3.  **Approval Workflow**: The Tenant Admin reviews the proposed scopes and technical design for compliance with the tenant's data privacy policies and approves the onboarding.
4.  **Credential Issuance**: Upon approval, the system generates unique `ClientID` and `ClientSecret` credentials.
5.  **Technical Configuration**: Integration Manager configures notification webhooks (endpoints) and data mapping schemas for the partner.
6.  **Connectivity Testing**: The Partner Tech Lead uses the credentials to perform a secure "Ping" or "Handshake" request to verify the tunnel.
7.  **Activation**: Once successful connectivity is verified, the integration is marked as `ACTIVE/HEALTHY`.

## Alternate Paths
*   **SEC-01: Weak Credentials**: System rejects the use of non-standard or weak authentication methods; OAuth2/OIDC is the platform standard.
*   **PRIV-01: Scope Violation**: System blocks an API request if the partner attempts to access data (e.g., PII) not explicitly granted in the approved onboarding scope.
*   **LOG-01: End-point Failure**: System automatically deactivates or flags an integration if the partner's webhook endpoint returns consecutive 5xx errors.

## Component Interactions
*   **Integrations Layer**: The registry of all external tunnels and partner metadata.
*   **Security & Access Control**: Enforces OAuth2 flows, API keys, and scoped access tokens.
*   **Tenant Management**: Defines the policy and regulatory boundary for the integration.
*   **Audit Logging**: Records all credential generation and decommissioning events.

## Data Touched
*   `IntegrationPartner`: Metadata and endpoint definitions.
*   `ClientCredential`: Sensitive auth material (stored hashed).
*   `WebhookSubscription`: Event mapping for the partner.
*   `SchemaMapping`: Field translation definitions.

## Audit & Compliance
*   All API keys and secrets are rotated or reviewed according to the security policy (e.g., every 90 days).
*   The "Approval" step must be linked to a legal or policy document ID.
*   The system maintains a real-time log of "Last Successful Sync" for every onboarded partner.
