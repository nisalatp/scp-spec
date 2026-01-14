# Boundaries: Audit Logging

## Ownership
- **Owns**: The *Format* of the Audit Record.
- **Owns**: The *Integrity* of the stored logs.

## Never Owns
- **The Event Trigger**: Audit Logging doesn't decide *what* to log; Services decide *what* to send. (However, Specs mandate MUST log).

## Integration Boundaries
- **Inbound**:
    - **All Services**: Push JSON messages to Audit Queue.
- **Outbound**:
    - **SIEM**: (Optional) Forwards logs to External Security/SOC.
