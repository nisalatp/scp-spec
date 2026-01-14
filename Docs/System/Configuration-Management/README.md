# Configuration Management

## Purpose
Configuration Management provides a centralized, versioned, and auditable way to manage system settings. Instead of hardcoding values or scattering env variables, SCP uses a "Config Service" that allows Tenants to tweak behavior (within limits) and Platform Admins to control global switches.

## Responsibilities
- **Central Storage**: Storing Key-Value pairs.
- **Scoping**: "Global", "Tenant", "Vertical", "User" overrides.
- **Secrets Management**: Encrypted storage for API Keys.
- **Feature Flagging**: Toggling features on/off dynamically.

## In Scope / Out of Scope
**In Scope**:
- Runtime Configurations (e.g., "Max Upload Size", "Default Language").
- Infrastructure Pointers (e.g., "SMTP Host").
- Feature Toggles.

**Out of Scope**:
- Infrastructure Provisioning (Terraform/K8s YAMLs are lower level).
- User Preferences (UI Themes - handled by Frontend User Settings).

## Key Concepts
- **Config Key**: Dot-notation identifier (e.g., `smtp.host`).
- **Scope**: Who does this apply to? (e.g., `tenant=LK`).
- **Override**: Specific scope wins over General scope.

## Component Relationship
- **All Components**: Query Config Service on startup (or listen for changes) to know how to behave.
