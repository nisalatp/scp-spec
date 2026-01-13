# Deployment Guide (SCP)

This folder contains step by step deployment instructions for the Smart Community Platform (SCP).
It is written for new team members and interns with limited experience.

## How to use this guide

1. Start with `01-prerequisites.md`.
2. Follow the files in order.
3. Use the checklists at the end of each file.

## Files in this folder

- `01-prerequisites.md`
- `02-environments-and-config.md`
- `03-kubernetes-setup.md`
- `04-database-setup.md`
- `05-keycloak-setup.md`
- `06-application-deploy.md`
- `07-post-deploy-checks.md`

## Notes

- SCP is API only in Phase 1.
- Each tenant (country) uses a separate database.
- Keycloak is the only identity provider.
- Email based MFA is mandatory for all users.
