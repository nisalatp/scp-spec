# Environment Definitions

SCP is deployed across three primary tiers.

| Tier | Purpose | Governance |
| :--- | :--- | :--- |
| **Development** | Feature testing and local dev. | Loose controls, mock PII. |
| **Staging** | UAT and integration testing. | Formal change control, anonymized data. |
| **Production** | Live national delivery. | Strict change control, audited access. |

## Infrastructure Map
- **Dev**: Local Docker-Compose / Minikube.
- **Staging/Prod**: Managed Kubernetes (EKS/AKS/GKE) per [Deployment Spec](file:///C:/Users/NisalaBandara/Projects/scp-spec/SPEC/12-deployment/README.md).
