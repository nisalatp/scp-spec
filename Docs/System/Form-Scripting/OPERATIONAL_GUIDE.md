# SCP Form Scripting: Strategy & Operations

## 1. Executive Purpose
The **Form Scripting** system is the platform's "Interface-as-Code" engine. Its primary purpose is to allow for the rapid creation and deployment of data collection forms using a version-controlled, YAML/JSON-based specification. It enables technically proficient administrators to define complex data entry logic, validation rules, and entity mappings that can be instantly pushed to thousands of mobile devices.

## 2. Why is it Needed?
*   **Rapid Rollout**: When a new crisis or program arises (e.g., an emergency nutritional survey), a new form can be scripted and deployed in hours, rather than weeks of app development.
*   **Standardization**: Ensures that data collected in one country uses the same "Schema" as another, enabling global comparative analytics.
*   **Logic at the Edge**: Allows for complex "Conditional Logic" (e.g., "Only show the Pregnancy section if Gender=Female and Age is between X and Y") to run locally on an offline mobile device.
*   **Idempotency & Versioning**: Prevents accidental data corruption by ensuring that form updates are handled as distinct versions, preserving the integrity of historical data.

## 3. How it Operates (The DSL Engine)
The system operates by parsing a **Domain Specific Language (DSL)** that defines the structure and behavior of a form.

### 3.1 The Script Structure
A `.forms.yaml` script defines:
*   **Form Identity**: Unique keys (e.g., `registration-v1`) that remain stable across versions.
*   **Access Rules**: Which roles (e.g., `field_agent`, `nurse`) can access the form.
*   **Entity Binding**: Where the data goes in the core database (e.g., "Map this field to the `Person.attributes.date_of_birth`").

### 3.2 Dynamic Logic (JSONLogic)
The engine uses **JSONLogic** to enforce deterministic behavior without custom programming:
*   **ShowIf**: Conditionally showing fields based on prior answers.
*   **RequiredIf**: Making a field mandatory only under certain conditions.
*   **Validators**: Enforcing constraints like "Date must be in the past" or "Number must be between 1 and 100."

## 4. Operational Guardrails

### 4.1 Schema Verification
Before a script is imported into a tenant, the system runs a **Strict Validator** that checks for:
*   Circular dependencies in logic.
*   Broken entity mappings.
*   Invalid role assignments.

### 4.2 Safe Updates (Soft Deprecation)
If a field is removed from a script during an update, the system does **not** delete the data from the database. Instead, it marks the field as `DEPRECATED`, hiding it from new data entry while keeping it visible in historical reports.

## 5. Audit & Transparency
*   **Import Records**: Every time a form is updated, the system records **Who** imported the script, **When**, and the **Diff** between the old and new versions.
*   **Logic Traceability**: If a user complains they "couldn't see a field," administrators can use the version history to verify exactly what logic was active on that user's device at that timestamp.
*   **Form Performance**: The system tracks submission rates and error frequencies per form version, helping identifies forms that may be too complex or confusing for field agents.
