# Workflows: Configuration Management

## Workflow: Rolling out a Feature Flag
1.  **Dev**: Adds code `if config('feature.new_ui')`.
2.  **Deploy**: Code goes to Prod. Default config is `false`.
3.  **Admin**: Goes to Config Console. Sets `feature.new_ui = true` for `tenant=TestTenant`.
4.  **Verify**: Test Tenant sees new UI. Others don't.
5.  **Admin**: Sets `feature.new_ui = true` for `Global`.
6.  **Event**: `ConfigChanged` broadcast.
7.  **All Instances**: Pickup change. Feature enabled for everyone.

## Workflow: Rotating Secrets
1.  **Admin**: Updates `db.password`.
2.  **System**: Encrypts value. Updates DB. Emits Event.
3.  **Backends**: Catch event. Re-establish DB connections.
