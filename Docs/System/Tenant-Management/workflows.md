# Workflows: Tenancy

## Workflow: Tenant Identification
1.  **Request**: User hits `api.scp-lka.org`.
2.  **Gateway**: Extracts subdomain `scp-lka`.
3.  **Lookup**: Checks Cache/DB for Tenant Code corresponding to DNS.
4.  **Context**: Sets `X-Tenant-ID` header for downstream services.
5.  **Failure**: If not found, return 404.

## Workflow: Tenant Creation (Negative Flow)
1.  **Actor**: Platform Admin (Not ROOT).
2.  **Action**: `POST /admin/tenants`.
3.  **Check**: AuthZ "Action=tenant.create" -> `DENY`.
4.  **Result**: 403 Forbidden.
