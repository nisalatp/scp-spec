# SCP Eligibility Rules: Strategy & Operations

## 1. Executive Purpose
The **Eligibility Rules Engine** is the deterministic "Brain" of the platform. Its primary purpose is to decouple complex legislative policy (e.g., "Who qualifies for a nutritional grant?") from the underlying application code. By representing policy as versioned "Rule Sets," the system ensures that every eligibility decision is consistent, objective, and fully auditable.

## 2. Why is it Needed?
*   **Neutrality**: Eliminates human bias and potential "favoritism" by requiring a programmatically defined set of criteria for every approval.
*   **Policy Agility**: Allows government or NGO leaders to update eligibility criteria (e.g., raising an income threshold due to inflation) without requiring a software developer or a system redeployment.
*   **Transparency**: Provides a clear, human-readable justification for every "Denial," which can be shared with the beneficiary or used in appeals.
*   **Impact Simulation**: Enables planners to "Dry Run" a new policy against existing census data to estimate cost and participation before it is officially launched.

## 3. How it Operates (The Policy-as-Code Engine)
The engine operates by evaluating **Declarative Rules** (e.g., JSONLogic) against a **Subject's Demographics**.

### 3.1 Rule Hierarchies
1.  **Global Guardrails**: High-level rules that apply to all programs (e.g., "Must be a verified resident of the Tenant country").
2.  **Program-Specific Rules**: Detailed criteria for a specific intervention (e.g., "Household income < 50,000" AND "At least 1 child under age 5").
3.  **Vertical Overrides**: Domain-specific constraints (e.g., "Cannot receive Health Grant if already enrolled in Program X").

### 3.2 The Evaluation Process
*   **Input**: A snapshot of the latest verified data from the **Identity** and **Geo** systems.
*   **Logic**: The engine processes the data through the currently `ACTIVE` version of the Rule Set.
*   **Output**: A binary decision (`ELIGIBLE` or `NOT_ELIGIBLE`) accompanied by a **Reason Tree** (showing which specific check passed or failed).

## 4. Operational Guardrails

### 4.1 Immutability of Decisions
Once a rule is evaluated for a case, the result (and the rule version used) is stored permanently. Even if the rule is changed the next day, the original decision remains traceable to the specific policy version that was active at the time.

### 4.2 Deterministic Nature
The engine cannot make "Fuzzy" decisions. If data is missing (e.g., "Income unknown"), the engine must fail the rule by default until the data is captured, ensuring that no "guesses" are made with public funds.

## 5. Audit & Transparency
*   **Versioned Rulesets**: Every change to a rule requires a formal "Policy Change Workflow," involving a **Program Manager** to propose and a **Vertical Owner** to approve.
*   **Evaluation Logs**: The system logs every evaluation call, including the input data and the resulting rationale. This is critical for defending the platform against claims of unfair treatment.
*   **Drift Analysis**: Auditors can compare multiple versions of a ruleset to see exactly how policy has evolved over time.
