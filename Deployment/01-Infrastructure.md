# Deployment Infrastructure

## Environment Topology
*   **Production**: Multi-Region Kubernetes Cluster (High Availability).
*   **Staging**: Single-Region Mirror of Prod.
*   **Dev/Test**: Ephemeral Namespaces.

## Compute Layer
*   **Kubernetes (K8s)**: Container orchestration.
    *   **Core Pods**: IAM, Workflow, API Gateway.
    *   **Vertical Pods**: Health, Edu, Econ (Scaled independently).
    *   **Geo-Vertical Pods**: Custom deployments for specific regions (e.g., "WASH-Service").

## Data Layer
*   **Relational DB**: PostgreSQL (Per Vertical Schema Isolation).
*   **NoSQL**: MongoDB (Geo-Vertical JSON Documents).
*   **Cache**: Redis (Session, Geo-Tile Cache).
*   **Object Storage**: S3-compatible (Bio-metrics, Documents).

## Networking
*   **API Gateway**: Ingress Controller (Nginx/Traefik).
*   **Service Mesh**: Istio (mTLS, Traffic Splitting).
*   **CDN**: Cloudflare (Static Assets, PWA Cache).

## Security Posture
*   **WAF**: OWASP Top 10 protection.
*   **Private Subnets**: DBs and Internal Services strictly isolated.
*   **TLS 1.3**: Encryption in transit everywhere.
