# Edge Cases & Failures: Form Builder

## Edge Cases
1.  **Data Loss**: User removes "Income" field in v2. (v1 data preserved, but v2 UI won't show it. Export needs to handle schema evolution).
2.  **Validation Conflict**: v1 allowed `Age > 0`, v2 requires `Age > 18`. (Old records valid, New edits must comply with v2).
3.  **Circular Logic**: Field A depends on B, B depends on A. (Logic Validator must catch).
4.  **Huge List**: Enum with 5,000 villages. (Use dynamic lookup, not hardcoded enum).
5.  **Multi-Language**: Missing translations for new field. (Fallback to Default Language).
6.  **Offline Sync**: App has `v1`, Server has `v2`. (Server accepts `v1` submission if not deprecated).

## Failure Handling
- **Bad Schema**: If a bad schema is published, perform **Rollback** (re-publish old version as new MAX version).
