# UC-02: High-Risk Pregnancy Monitoring

## Goal
To proactively identify and track pregnant mothers with medical risk indicators (e.g., anemia, chronic illness) for early medical intervention and follow-up.

## Actors
- **Case Worker (Health and Environment)**: Primary user identifying and managing the cases.
- **System**: Performs automated risk flagging based on clinical data.
- **Beneficiary (Mother)**: The subject of the monitoring.

## Preconditions
- Mother is registered in the Identity and Person Registry.
- Health and Environment Vertical contains recent clinical data (e.g., from Field Visits or Clinic records).
- User has `Case Worker` role with `Health and Environment` vertical scope.

## Main Flow (Happy Path)
1. **Trigger**: System runs a periodic analytical query (e.g., "Find all pregnant mothers with Hb < 10g/dL").
2. **Identification**: System returns a list of High-Risk candidates.
3. **Task Creation**: Case Worker reviews the list and creates "Follow-up Visit" tasks for Field Agents.
4. **Assignment**: Tasks are assigned to the relevant Field Agent based on Geo Scope.
5. **Execution**: Field Agent visits the household, updates status, and records outcomes in SCP.
6. **Resolution**: Case Worker reviews the outcome and closes the alert if the risk is mitigated.

## Alternate / Error Paths
### a) Permission Denied
- **Condition**: User lacks `health:view-sensitive` permission.
- **Flow**: System redacts specific clinical indicators (HB levels, disease names) showing only "Risk Flag: Yes" or returns `403 Forbidden`.

### b) Data Incomplete (Missing Medical Record)
- **Condition**: A person is flagged as pregnant but has no clinical records imported yet.
- **Flow**: System marks as "Incomplete Evaluation" and triggers a "Verification Visit" task for a Field Agent.

### c) Scope Violation
- **Condition**: Case Worker attempts to view High-Risk mothers in a non-assigned province.
- **Flow**: System returns zero results or "Out of Scope" error.

## Component Interactions
- **Analytics**: Query Engine for risk flagging.
- **Workflows**: Task/Case lifecycle management.
- **Identity**: Person demographics.
- **Data Collection**: Field updates.

## Data Touched
- `Identity.MedicalMetadata`
- `Workflows.Tasks`
- `CaseManagement.Interventions`

## Audit & Compliance
- Data access is logged as "Sensitive: Medical".
- Consent for medical data processing MUST be active.
