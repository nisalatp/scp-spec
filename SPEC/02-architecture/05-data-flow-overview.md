# SCP-SPEC-ARCH-05: Data Flow Overview

## Purpose

This document provides a high-level overview of how data flows through SCP, from ingestion to processing and external exchange.

## In Scope / Out of Scope

**In Scope**
- Internal data flows between modules
- Data ingress and egress via APIs

**Out of Scope**
- Low-level data transformation logic
- UI data binding

## Definitions

- Data Flow: Movement of data between components.
- Ingress/Egress: Entry and exit points for data.

## Rules (MUST/SHOULD/MAY)

- All data flows MUST pass through authorization and consent checks.
- Sensitive data SHOULD be masked where required.
- Data flows MAY be asynchronous where appropriate.
- Data lineage MUST be visualized via an internal UI.
- The system MUST support manually approved data flows when required by governance or policy.

## Edge Cases

- Partial data availability during workflows.
- Retry-induced duplicate events.

## Audit & Logs

- Data access and movement MUST be logged.
- Data lineage SHOULD be traceable.

## Open Questions

- None.

## References

- SPEC/10-data/01-data-architecture.md
- SPEC/09-integrations/01-integration-overview.md
