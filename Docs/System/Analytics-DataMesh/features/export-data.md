# Export Data (Download)

## Description
Downloading raw or aggregated data for offline analysis or operational use (e.g., Excel/CSV). Must strictly enforce masking.

## Component
Reporting & Exports

## Actors / Roles
- **Analyst**
- **Field Manager**

## Permissions
- `export.create`

## Scope Rules
- **Row Level Security**: User only gets rows found in their Geo/Vertical scope.
- **Masking**: PII is masked unless explicitly authorized.

## Main Flow
1.  **Actor**: Query "All Households in Grid 53".
2.  **Action**: Click "Export to CSV".
3.  **System**:
    - Validates Permission.
    - Generates File Asynchronously.
    - Notifies User "Download Ready".
4.  **Actor**: Downloads via Secure Link (One-time use).

## Data Read / Written
- **ExportJob**: Write.

## Audit & Compliance
- **Traceability**: "User X downloaded 10k records".

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/03-domain/10-analytics-reporting-model.md`
