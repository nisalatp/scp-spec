# Canonical Baseline (Source of Truth)
**Generated:** 2026-01-14
**Source:** \SPEC\ (v.Current)

## 1. Canonical Components (SPEC-ARCH-02)
These are the ONLY recognized logical components in the system.

### Core Platform (SPEC-CORE)
- Tenant Management
- Geo Engine
- Person Registry
- Household & Family
- Community Center Registry
- Form Builder
- Metadata Versioning
- Attachments & Documents
- Notifications & Email
- Configuration Management
- Facility Registry
- Infrastructure Project Registry

### Business Domain (SPEC-DOM / SPEC-VERT)
- Vertical Governance
- Workflows & Case Management
- Eligibility Rules
- Finance
- Marketplace Access
- Programs (SPEC-DOM-04)

### Operations (SPEC-OPS)
- Field Operations (Agent)
- Community Workers
- Donor Operations
- Program Execution
- Reporting & Exports
- Offline Mobile Sync

### Governance & Security (SPEC-SEC / SPEC-GOV)
- Security & Access Control (AuthZ)
- Audit Logging
- Analytics & Data Mesh (SPEC-DOM-10)
- Policy Change Control

### Integrations (SPEC-INT)
- Integration Layer (Adapters)

---

## 2. Canonical Data Entities (SPEC-DOM-02)
If a data model exists in code/diagrams but is not listed here (or in SPEC-DOM-02 detailed list), it is a **Lapse**.

- **Person** (Unique ID, Demographics)
- **Household** (Group, Head of House)
- **Geo Node** (Hierarchy, Boundary)
- **Community Center** (Physical Resource)
- **Facility** (Service Provider)
- **Infrastructure Project** (Public Work)
- **Geo Metric** (Statistics)
- **Service Encounter** (Interaction)
- **Attendance Record** (Participation)
- **Vertical** (Domain Partition)
- **Program** (Initiative)
- **Case** (Intervention Lifecycle)
- **Donor** (Funder)
- **Agent** (Field User)

---

## 3. Security & Permission Model (SPEC-SEC)

### Scope Types (SPEC-SEC-07)
- `tenant-wide`
- `geo-scoped`
- `vertical-scoped`
- `program-scoped`

### Permission Naming (SPEC-SEC-06)
Format: `resource.action` (lowercase). No aliases.

**Canonical Prefixes:**
| Prefix | Scope |
|---|---|
| tenant.* | tenant-wide |
| config.* | tenant-wide |
| policy.* | tenant-wide |
| role.* | tenant-wide |
| geo.* | geo-scoped |
| community_center.* | geo-scoped |
| vertical.* | tenant-wide |
| program.* | program-scoped |
| case.* | vertical-scoped |
| person.* | vertical-scoped |
| household.* | vertical-scoped |
| relationship.* | vertical-scoped |
| consent.* | vertical-scoped |
| attachment.* | vertical-scoped |
| form.* | tenant-wide (submission scoped) |
| visit.* | geo-scoped |
| report.* | vertical-scoped |
| integration.* | tenant-wide |
| pipeline.* | tenant-wide |
| donor.* | vertical-scoped |
| marketplace.* | tenant-wide |

### Principles
- **Deny-Wins**: Explicit deny overrides any allow.
- **Root Bypass**: ROOT accounts bypass checks (audit required).
- **Consent Boundary**: Vertical access requires active User Consent.

---

## 4. Vertical Governance (SPEC-VERT)
- Verticals are **Logical Partitions**.
- Data cannot cross verticals without **Cross-Vertical Logic** (Intersection Rule or Explicit Consent).
- 5 Standard Verticals (Health, Education, Social, Finance, Emergency).

---

## 5. Audit Requirements (SPEC-SEC-12)
- **Fail-Closed**: If audit service is down, critical actions MUST fail.
- **Immutable**: Logs cannot be modified.
- **Context**: Must include Actor, Action, Resource, Timestamp, and Outcome.
