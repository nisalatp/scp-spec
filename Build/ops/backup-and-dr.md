# Backup and Disaster Recovery

## 1. Database Backups
- **Frequency**: Automated daily full backups, hourly WAL archiving.
- **Retention**: 30 days (operational), 7 years (regulatory/archival).
- **Testing**: Weekly automated restore tests.

## 2. Recovery Objectives
- **RTO (Recovery Time)**: < 4 hours for core identity and registration.
- **RPO (Recovery Point)**: < 1 hour (data loss limit).

## 3. High Availability
- Multi-AZ deployment for PostgreSQL and the API Monolith.
- Cross-region failover for the Object Store (Blobs/Documents).
