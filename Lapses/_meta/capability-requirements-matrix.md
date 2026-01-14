# Capability Requirements Matrix

This document maps all 44 Usage Scenarios to the specific System Capabilities required to support them. It serves as the baseline for the "Gap Analysis".

**Status Legend**:
*   ✅ **Supported**: Explicitly defined in SPEC.
*   ⚠️ **Partial**: Implied or mentioned but lacks detail.
*   ❌ **Gap**: Missing from SPEC.

## Matrix

| UC ID | Name | Core Requirements | Backend Cap | Frontend Cap | Data Cap | SPEC Status |
|---|---|---|---|---|---|---|
| **UC-01** | Emergency Blood Match | Operations, Notification | Event Bus, Notification Svc | Mobile Alert, Geolocation | Person Registry | ✅ |
| **UC-02** | High-Risk Pregnancy | Case Mgmt, Risk Scoring | Rules Engine, Task Mgmt | Case Dashboard | Health Records | ✅ |
| **UC-03** | Chronic Disease Outreach | List Gen, Scheduling | Query Engine, Scheduling Svc | List View, Calendar | Health Records | ✅ |
| **UC-04** | Vaccination Gaps | Analytics, Geospatial | Aggregation, GIS Integration | Heatmap Visualization | Immunization Data | ⚠️ (GIS) |
| **UC-05** | School Supplies | Eligibility, Grant | Eligibility Engine, Payment | Application Form | Edu Enrollment, Wallet | ✅ |
| **UC-06** | Dropout Risk | Analytics, Prediction | ML/Rule Engine, Alerting | Risk Dashboard | Attendance, Grades | ⚠️ (ML) |
| **UC-07** | Scholarship Targeting | Targeting, Finance | Complex Query, Fund Allocation | faceted Search | Edu + Econ Data | ✅ |
| **UC-08** | Youth Skills | Matching, Job Board | Matching Engine, Search | Job Portal UI | Skills Profile | ✅ |
| **UC-09** | Sanitation Planning | Planning, Geo-Vertical | Geo-Vertical Extension, GIS | Plan Builder (Map) | WASH Extension Data | ✅ (Via Geo-Ext) |
| **UC-10** | Clean Water Access | Planning, Geo-Analysis | GIS Service, Distance Calc | Map Overlay | Water Point Data | ✅ (Via GIS) |
| **UC-11** | Housing Repair | Grant, Case Mgmt | Workflow Engine, Payment | Incident Report | Housing Data | ✅ |
| **UC-12** | Env Risk Mapping | Analytics, GIS | GIS Overlay, Risk Calc | Disaster Map | Hazard Zones | ⚠️ (GIS) |
| **UC-13** | Elderly Support | Isolation Detection | Cross-Ref Query, Scheduling | Community View | HH Composition | ✅ |
| **UC-14** | Disability Support | Verification, Payment | Doc Verification, Payment | Upload UI | Medical/Welfare Data | ✅ |
| **UC-15** | Food Assistance | Distribution, Inventory | Logistics, QR/Auth | Distribution App | Ration Card | ✅ |
| **UC-16** | Single Parent Support | Targeting, Case Mgmt | Eligibility Engine | Case View | HH Structure | ✅ |
| **UC-17** | Evidence Funding | Analytics, Budgeting | Aggregation, Project Mgmt | KPI Dashboard | Cross-Vertical Data | ✅ |
| **UC-18** | Duplication Prevention | Identity, Deduplication | Biometric/ ID Match | Identity Resolver | Global Person ID | ✅ |
| **UC-19** | Impact Measurement | Analytics, Reporting | Time-Series DB, Report Gen | Chart Builder | Longitudinal Data | ✅ |
| **UC-20** | Cross Region Comparison | Analytics, Aggregation | Cube/OLAP, Permissioning | Comparison View | Aggregated Stats | ✅ |
| **UC-21** | Policy Design | Modeling, Simulation | "What-If" Engine, Policy Mgmt | Policy Editor | Population Sample | ✅ (Via Sim) |
| **UC-22** | Transparent Selection | Ranking, Audit | Weighted Scoring, Immutable Log | Public Leaderboard | Anonymized Data | ✅ |
| **UC-23** | Audit & Oversight | Auditing, Security | Audit Trail, Anomaly Detect | Auditor Portal | System Logs | ✅ |
| **UC-24** | Progress Tracking | Tracking, Notification | Milestone Engine, Push | Progress Bar/Feed | Activity Log | ✅ |
| **UC-25** | Women Exhaustion Risk | Complex Query (3-Way) | Cross-Vertical Query | Advanced Search | Edu + Econ + Welfare | ✅ (Via OLAP) |
| **UC-26** | High-Risk Unsafe Living | Geo-Intersection | Geo-Spatial Query | Map View | Health + Housing | ⚠️ (GIS) |
| **UC-27** | Multi-Dim Poverty | Composite Index | Weighted Index Calc | Profile Vew | Multi-Vertical Data | ✅ |
| **UC-28** | Elderly Isolation | Risk Logic | Rule Engine | Alert Dashboard | Health + Welfare | ✅ |
| **UC-29** | NEET Youth | Complex Query | Cross-Vertical Query | List View | Edu + Econ + HH | ⚠️ (X-Vert) |
| **UC-30** | Disaster Sensitive HH | Geo-Intersection | GIS Overlay, Alerting | Map + List | Env + Housing | ⚠️ (GIS) |
| **UC-31** | Women-Led Potential | Targeting | Query Engine | Search | HH Head + Econ | ✅ |
| **UC-32** | Chronic Illness Poverty | Correlation | Analytics Engine | Correlation Plot | Health + Econ | ✅ |
| **UC-33** | Dropout Housing | Correlation | Analytics Engine | Dashboard | Edu + Housing | ✅ |
| **UC-34** | Infra Health Impact | Correlation, Geo | GIS + Analytics | Map Heatmap | Health + Infra | ⚠️ (GIS) |
| **UC-35** | Long-Term Dependency | Time-Series Analysis | History Tracking | Trend View | Welfare History | ✅ |
| **UC-36** | Youth Migration | Risk Logic | Rule Engine | Alert | Edu + Econ + Mig | ✅ |
| **UC-37** | Child Malnutrition Env | Geo-Correlation | GIS Overlay | Dashboard | Health + Env | ⚠️ (GIS) |
| **UC-38** | Women Workforce Exit | Predictive Risk | ML/Heuristic Engine | Risk List | Econ + Family | ⚠️ (ML) |
| **UC-39** | Edu ROI Optimization | Optimization | Ranking Algorithm | Candidate List | Edu + Econ | ✅ |
| **UC-40** | Health Access Gap | Network Analysis | Routing Engine (Travel Time) | Accessibility Map | Health + Transport | ✅ (Via Routing) |
| **UC-41** | Digital Inclusion | Targeting | Query Engine | Search | Edu + Econ + Connectivity| ✅ |
| **UC-42** | Multi-Gen Poverty | Graph Traversal | Graph DB / Recursive Query | Family Tree UI | Lineage Data | ⚠️ (Graph) |
| **UC-43** | Climate Econ Risk | Geo-Economic | GIS + Econ Model | Scenario View | Env + Econ | ⚠️ (GIS) |
| **UC-44** | Community Risk Index | Composite Aggregation | Batch Calc, Indexing | Leaderboard | All Verticals | ✅ |

## Summary of Gaps / Partials
1.  **GIS Capabilities**: Deep geospatial queries (distance, routing, overlay) are required by many scenarios (UC-09, 10, 12, 26, 30, 34, 37, 40, 43) but SPEC primarily describes standard CRUD.
2.  **Cross-Vertical Querying**: Joining data across standard and custom verticals (UC-25, 29) needs a specific "Data Mesh" or "Federated Query" strategy not fully detailed.
3.  **Simulation/ML**: UC-21 (Policy Sim) and UC-06/38 (Prediction) imply capabilities beyond standard rules engines.
