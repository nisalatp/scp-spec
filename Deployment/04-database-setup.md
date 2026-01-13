# 04 Database Setup

This section describes how to set up PostgreSQL for SCP.

## 1. Database Strategy

- Each tenant (country) MUST have its own database.
- A shared database across tenants is not allowed.

## 2. Create Databases

For each tenant:

- Create a dedicated PostgreSQL database.
- Create a database user with least privilege.

## 3. Connection Security

- Enforce TLS for all DB connections.
- Store credentials in the secret manager.

## 4. Migrations

Run the SCP schema migrations for each tenant database:

1. Connect to the tenant DB.
2. Apply schema in order.
3. Verify tables and indexes exist.

## 5. Backups

- Enable daily full backups.
- Enable point in time recovery where possible.
- Store backups in the tenant data residency region.

## Checklist

- One database per tenant created
- TLS enabled for DB connections
- Migrations completed successfully
- Backups configured
