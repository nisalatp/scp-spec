# Boundaries: Tenancy

## Ownership
- **Owns**: The definitions of what constitutes a "valid tenant".
- **Owns**: The mapping of `subdomain` -> `tenant_id`.
- **Owns**: The connection string resolution logic.

## Never Owns
- **User Passwords**: Identity/Auth Provider owns authentication.
- **Beneficiary Data**: Owned by Verticals/Person Registry, merely *partitioned* by Tenancy.

## Integration Boundaries
- **Inbound**:
    - **API Gateway**: Resolves `tenant-id` header or subdomain before calling internal services.
- **Outbound**:
    - **Database**: Tenant Manager configures `DbContext` to connect to the correct shard/DB.
