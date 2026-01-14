# Field Coverage Matrix: Sri Lanka Top 15

| Form ID | Form Name | Key Sections | Primary Entity Binding |
|---|---|---|---|
| **01** | Birth Registration | Child, Mother, Father | `Person` |
| **02** | Death Registration | Deceased, Death, Informant | `Person` |
| **03** | Marriage Registration | Groom, Bride, Event | `Person` (Groom/Bride) |
| **04** | NIC Application | Identity, Address, Parent | `Person` |
| **05** | Household Census | Core, Leader, Members | `Household` |
| **06** | Income Declaration | Employment, Income, Expense | `GovernmentFormSubmission` |
| **07** | Welfare (Aswesuma) | Indicators, Assistance | `GovernmentFormSubmission` |
| **08** | MCH Registration | Mother, Pregnancy, Risk | `HealthRecord` |
| **09** | Disability Reg | Details, Certification | `GovernmentFormSubmission` |
| **10** | Chronic Illness | Condition, Assistance | `GovernmentFormSubmission` |
| **11** | School Enrollment | Student, Guardian, School | `Person` |
| **12** | Scholarship | Academic, Assistance | `GovernmentFormSubmission` |
| **13** | Housing Assets | Structure, Ownership | `GovernmentFormSubmission` |
| **14** | Disaster Assess | Incident, Damage | `GovernmentFormSubmission` |
| **15** | Digital Access | Device, Connectivity | `GovernmentFormSubmission` |

## Notes
*   Forms 01-05 and 11 bind largely to Canonical Entities (`Person`, `Household`).
*   Forms 06-15 capture transaction-specific data bound to `GovernmentFormSubmission` with raw field access, as per instructions for non-canonical fit.
*   All forms include explicit `attachments` sections for document uploads.
