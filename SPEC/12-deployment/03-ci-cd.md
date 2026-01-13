# SCP-SPEC-DEP-03: CI and CD

## Purpose

This document defines CI and CD pipelines for building, testing, and deploying SCP.

## In Scope / Out of Scope

**In Scope**
- Build pipelines
- Deployment automation
- Rollback strategy

**Out of Scope**
- Tool-specific configuration

## Definitions

- CI: Continuous Integration.
- CD: Continuous Deployment.

## Rules (MUST/SHOULD/MAY)

- CI MUST build and test the .NET modular monolith.
- CD MUST deploy to Kubernetes.
- Pipelines MUST include security scanning.
- Rollbacks SHOULD be supported.
- Manual approval MAY be required for production.
- Blue-green deployments MUST be supported.
- Canary deployments are not required.

## Edge Cases

- Failed deployment mid-rollout.
- Partial rollback scenarios.

## Audit & Logs

- Pipeline executions MUST be logged.
- Deployment approvals MUST be auditable.

## Open Questions

- None.

## References

- SPEC/12-deployment/01-kubernetes-topology.md
- SPEC/04-security/13-threat-model.md
