# Edge Cases & Failures: Verticals

## Edge Cases
1.  **Renaming**: "Ministry of Health" becomes "Ministry of Wellness". (Code `HTH` stays same, Label changes).
2.  **Merger**: "Fishing" and "Agriculture" merge. (Complex migration. Usually Archive both -> Create New).
3.  **Conflict**: Two verticals claiming same Program. (Governance dispute. Primary Owner must be one).

## Failure Handling
- **Vertical Config Corrupt**: Fallback to Default Safe Config (Deny All).
