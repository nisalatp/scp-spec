# 05 Routing and Layout

This section covers routing and layout rules.

## 1. Route Structure

Suggested top level routes:

- `/login`
- `/dashboard`
- `/persons`
- `/households`
- `/cases`
- `/programs`
- `/reports`
- `/admin`

## 2. Protected Routes

All routes except `/login` should be protected:

- Redirect to login if not authenticated.
- Show access denied if the API returns 403.

## 3. Layout Rules

- Header should show tenant name and active vertical.
- Use a consistent left navigation.
- Never show data from another tenant.

## Checklist

- All main routes are protected
- Unauthorized access shows a clear error
- Navigation is consistent across modules
