# Search Person

## Description
Finding a person using multiple criteria (Name, ID, Phone, Geo). Used to prevent duplicates during registration and to locate beneficiaries during service delivery.

## Component
Identity (Person Registry)

## Actors / Roles
- **All Authorized Roles** (Case Worker, Field Agent, Program Manager)

## Permissions
- `person.search`
- `person.view.sensitive` (to see full NIC/DOB in results)

## Scope Rules
- **Geo Scope**: Results are filtered. Agent in "Galle" searches "Saman". System returns only Samans in Galle (unless Agent has National Search permission).
- **Vertical Scope**: Health Worker sees Health Data; Education Worker sees Education Data.

## Main Flow
1.  **Actor**: Enters "`Saman Perera`" + "`Gampaha`".
2.  **System**: Executes Fuzzy Search / Phonetic Match.
3.  **System**: Filters results by Actor's Data Scope.
4.  **System**: Returns List (Masking PII if required).

## Alternate / Error Flows
- **Too Many Results**: Enforce "Enter more criteria" limit (e.g., > 100 matches).

## Data Read / Written
- **Person**: Read.

## Audit & Compliance
- **Search Audit**: "User X searched for Y". High volume searches trigger anomaly alerts (Data Scraping protection).

## Related Use Cases
- UC-01: Emergency Blood Match
- UC-05: Household Enrollment

## References
- `SPEC/06-platform-core/03-person-registry.md`
