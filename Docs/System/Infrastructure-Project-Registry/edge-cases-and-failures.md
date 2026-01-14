# Edge Cases & Failures: Infrastructure Project Registry

## Edge Cases
1.  **Scope Change**: Road re-routed.
    - *Action*: Update `ProjectGeoScope`. Log changes. Old villages lose the "Active Project" tag.
2.  **Indefinite Suspension**: Project funds cut.
    - *Action*: Status -> `Suspended`. Alerts stakeholders.

## Failure Handling
- **Geo ID Invalid**: Project links to a deleted Geo Node.
    - *Mitigation*: Referential Integrity prevents Geo Node deletion if linked to Active Project.
