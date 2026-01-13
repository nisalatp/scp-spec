# 06 SCP Application Deployment

This section covers deploying the SCP API and supporting services.

## 1. Prepare Secrets

Store these in the secret manager:

- Database connection strings (per tenant)
- Keycloak client secrets
- SMTP credentials (per tenant)
- Object storage keys

## 2. Deploy the SCP API

1. Deploy the SCP API to the `scp-core` namespace.
2. Configure environment variables:
   - `KEYCLOAK_ISSUER`
   - `KEYCLOAK_CLIENT_ID`
   - `KEYCLOAK_CLIENT_SECRET`
   - `ROOT_HASH_LIST`
   - `TENANT_CONFIG_SOURCE`
3. Configure the service to connect to tenant databases.
4. Apply network policies to restrict access.

## 3. Run Migrations

1. For each tenant database, run schema migrations.
2. Validate tables and indexes were created.

## 4. Configure Integrations

1. Register integrations in SCP.
2. Map integration IDs to Keycloak clients.
3. Validate token claims include tenant and verticals.

## Checklist

- SCP API deployed and reachable
- Environment variables set
- Migrations completed
- Integrations registered
