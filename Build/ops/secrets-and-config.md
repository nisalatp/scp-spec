# Secrets & Configuration Management

## Configuration Principles
- **No hardcoded secrets**: All keys MUST be injected via environment variables or secret managers.
- **Hierarchical Config**: Global defaults -> Tenant specific -> Environment specific.

## Tooling
- **Dev**: `.env` files (git-ignored).
- **Production**: HashiCorp Vault or AWS/Azure Secret Manager.

## Key Secrets
- Database Connection Strings
- OIDC Client Secrets (Keycloak)
- Storage Access Keys (S3/MinIO)
- Integration API Keys (SMS, Payment)
