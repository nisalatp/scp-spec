# Scope & Governance: Analytics & Data Mesh

## Scope Rules
- **Decentralization**: There is no "Central Data Team" writing SQL for everyone. Each Vertical writes its own SQL/Transforms.
- **Interoperability**: All Data Products must use standard types (e.g., ISO dates, ISO-3166 Country Codes) to allow joining across domains.

## Governance Policies
### 1. Privacy Policy
- Fields tagged `PII` are automatically hashed or nulled in Data Products unless explicitly exempted for authorized "Case Worker" views.

### 2. Retention Policy
- Analytical data retention is separate from Operational retention.
- e.g., "Keep 5 years of aggregate trends" even if "Raw Case Data" is archived after 3 years.

### 3. Consent Policy
- **Strict Exclusion**: "Consent-withdrawn records MUST be excluded from reports, including aggregates."
    - *Implication*: Historical aggregates might change if a user withdraws consent? *Decision*: Usually, anonymized aggregates established *before* withdrawal are kept, but live queries exclude the user.
