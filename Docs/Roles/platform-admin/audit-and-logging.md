# Audit & Logging: Platform Admin

## Logged Actions
*   `tenant.config.update`
*   `user.create`, `user.suspend`
*   `role.assign`
*   `group.update`

## Visibility
*   Admins can see **System Logs** (login failures, config changes).
*   Admins **cannot** see Data Access Logs for specific Case Workers (privacy protection).

## Correlation
*   All admin actions carry the `actor_id` of the admin.
