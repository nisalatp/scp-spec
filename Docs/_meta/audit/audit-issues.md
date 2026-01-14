# Audit Issues
**Format:**
- **ID:** AUD-###
- **Severity:** Blocker / High / Medium / Low
- **Area:** SPEC / Roles / Models / UML / C4 / Docs / Scripts / UseCases / Deployment / Frontend / Backend
- **Observed In:** <paths>
- **Expected From SPEC:** <SPEC refs>
- **Mismatch Description:** <precise statement>
- **Impact:** <what breaks / risk>
- **Disposition:**
  - Fixed
  - Logged as Lapse
  - Needs Clarification
- **Evidence:** <paths>

---
AUD-001 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'National ID Authority' is assigned ownership of Identity but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-002 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Surveyor General' is assigned ownership of Geo Engine but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-003 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Privacy Officer' is assigned ownership of Consent but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-004 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Security Lead' is assigned ownership of Security but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-005 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Program Designer' is assigned ownership of Form Builder but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-006 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'DevOps' is assigned ownership of Form Scripting but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-007 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Field Manager' is assigned ownership of Field Ops but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-008 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Comms Officer' is assigned ownership of Notifications but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-009 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'System Architect' is assigned ownership of Integrations but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-010 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Policy Maker' is assigned ownership of Eligibility Rules but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-011 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Umbrella Admin' is assigned ownership of Marketplace but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-012 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Community Leader' is assigned ownership of Community Center Registry but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-013 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Planner' is assigned ownership of Infrastructure Registry but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-014 | High | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Domain Analyst' is assigned ownership of Analytics but is not defined in standard roles. | Governance ambiguity. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-015 | Medium | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Vertical Admin' (used in Matrix) vs 'Vertical Owner' (defined in Roles). | Naming inconsistency. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-016 | Medium | Roles | Docs/System/COMPONENT_MATRIX.md | Docs/Roles/ | Role 'Finance Officer' (used in Matrix) vs 'Finance Manager' (defined in Roles). | Naming inconsistency. | Fixed | Docs/System/COMPONENT_MATRIX.md
AUD-017 | Medium | Models | Docs/System/Workflows-Case-Management/diagrams/lifecycle.puml | SPEC/03-domain/05-case-intervention-model.md | Diagram uses 'InProgress' state not in SPEC. | DB Schema drift. | Fixed | Docs/System/Workflows-Case-Management/diagrams/lifecycle.puml
AUD-018 | Low | UML | Docs/System/Programs/diagrams/lifecycle.puml | SPEC/03-domain/04-program-model.md | Diagram nests 'Approved' inside 'Reviewed'. | Semantic confusion. | Fixed | Docs/System/Programs/diagrams/lifecycle.puml
AUD-019 | High | UML | Docs/System/Identity/diagrams/lifecycle.puml | SPEC/06-platform-core/03-person-registry.md | Diagram missing mandatory 'Archived' state (Soft Delete). | Compliance Violation. | Fixed | Docs/System/Identity/diagrams/lifecycle.puml
AUD-020 | High | C4/UML | Docs/Diagrams/ | SPEC/00-index.md | Entire Docs/Diagrams directory is missing. | Missing Artifacts. | Fixed | Docs/Diagrams/
AUD-021 | Medium | UseCases | Docs/UseCases/UC-01-Emergency-Blood-Match.md | SPEC/04-security/09-consent-and-data-sharing.md | UC-01 assumes granular 'EmergencyContact' consent not in SPEC. | Requirement Gap. | Fixed | Docs/UseCases/UC-01-Emergency-Blood-Match.md
AUD-022 | High | Docs | Docs/ | User Request | Missing Frontend, Backend, Deployment documentation folders. | Missing Artifacts. | Fixed | Docs/
AUD-023 | High | Scripts | Scripts/SriLanka/packages/01-birth-registration.forms.yaml | SPEC/07-verticals/01-system-verticals.md | Script uses invalid vertical 'core'. | Governance Bypass. | Fixed | Scripts/SriLanka/packages/
AUD-024 | Critical | Scripts | Scripts/SriLanka/packages/01-birth-registration.forms.yaml | SPEC/04-security/09-consent-and-data-sharing.md | Script fails to capture structured Consent. | Privacy Violation. | Fixed | Scripts/SriLanka/packages/
