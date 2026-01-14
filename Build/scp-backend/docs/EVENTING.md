# Backend Eventing Strategy

SCP uses an asynchronous, event-driven model for cross-module orchestration and external integration.

## Internal Events (In-Process/Bus)
- Used for side effects that don't need absolute transactional consistency.
- Example: `PersonCreated` -> `GenerateWelcomeNotification`.

## Integration Events (Out-of-Process)
- Published to **RabbitMQ** or **Redis Streams**.
- Used for syncing with external partners or the Analytics Data Mesh.
- MUST use a versioned schema.

## Event Reliability
- Use the **Message Outbox Pattern** to ensure that events are only published if the database transaction succeeds.
