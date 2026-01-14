# Scope & Governance: Configuration Management

## Scope Rules
- **Hierarchical Resolution**: User > Program > Vertical > Tenant > Global.
    - Example: `feature.dark_mode`. User says ON, Tenant says OFF. User wins.

## Governance Policies
### 1. Change Control
- Production Config changes (e.g., changing Payment Gateway URL) require Approval Workflow and Audit Trail.

### 2. Encryption
- Keys named `*.secret`, `*.key`, `*.password` are automatically Encrypted at Rest and masked in UI.
