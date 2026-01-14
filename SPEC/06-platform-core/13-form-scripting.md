# SCP-SPEC-CORE-13: Form Scripting Model

## Purpose
This document defines the **Form Scripting Model**, a mechanism to define Data Collection Interfaces as version-controlled code (Infrastructure-as-Code) and import them into specific Country Tenants.

## In Scope
*   **Form Script Format**: A YAML/JSON specification for defining forms, fields, and logic.
*   **Country-Bound Import**: A deterministic pipeline to apply scripts to a specific Tenant.
*   **Idempotency & Versioning**: Logic for handling updates, diffs, and unchanged forms.

## Script Model Specification

### 1. File Structure
Script files MUST use the extension `.forms.yaml` (or `.json`) and follow this structure:

```yaml
apiVersion: "scp.forms.v1"
countryTenant: "LK"  # Target Country Code (ISO-3166)
package:
  name: "sri-lanka-core-forms"
  version: "1.0.0"
  description: "Initial rollout of core registration forms."
forms:
  - formKey: "registration-v1" # Unique stable ID
    title: "Household Registration"
    # ... form definition ...
```

### 2. Form Definition
Each form object MUST contain:
*   `formKey`: Semantic ID (e.g., `health-survey`). Stable across versions.
*   `scope`:
    *   `vertical`: ID of Standard or Geo-Vertical (e.g., `health`, `wash-province-1`).
    *   `program`: (Optional) ID of associated program.
    *   `geoFence`: (Optional) Geo-Polygon constraints.
*   `access`:
    *   `roles`: List of Actors allowed to use this form (e.g., `["registrar", "nurse"]`).
*   `sections`: Ordered list of visual groups.

### 3. Field Definition
Fields MUST define:
*   `fieldKey`: Unique ID within the form.
*   `type`: One of `text`, `number`, `date`, `boolean`, `enum`, `file`, `gps`, `biometric`, `repeater`, `relation`.
*   `validation`: Rules such as `required`, `min`, `max`, `regex`.
*   `access`: Sensitivity tags (e.g., `pii`, `medical`).
*   `logic`: `showIf`, `requiredIf` using **JSONLogic**.

### 4. Storage Binding
Forms MUST map to the Domain Model:
*   `entity`: Target Entity (e.g., `Person`, `Household`).
*   `path`: JSONPath or Attribute mapping (e.g., `attributes.biometrics`).

## Import Pipeline Rules

### 1. Verification
*   The system MUST validate the script against the `FormScript Schema`.
*   The system MUST verify the executioner has `Admin` permissions for the target `countryTenant`.

### 2. Idempotency & Versioning
*   **New Form**: If `formKey` does not exist, CREATE version 1.
*   **Update**: If `formKey` exists and content differs, CREATE new version (increment Major/Minor).
*   **No-Op**: If `formKey` exists and content is identical, DO NOTHING.
*   **Deprecation**: Fields removed in the script MUST be marked `deprecated: true` to preserve historical data.

### 3. Audit
*   Every import MUST generate an `ImportRecord` linked to the User and Script Package.

## CLI / API
*   **CLI**: `scp forms:import --file forms.yaml --tenant LK`
*   **API**: `POST /api/admin/forms/import`

## References
*   SPEC/06-platform-core/06-form-builder.md
