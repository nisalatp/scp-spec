# 03 Frontend Architecture

This section describes the recommended frontend structure.

## Folder Layout (Suggested)

- `src/app` for app bootstrap and providers
- `src/features` for feature modules (cases, programs, reporting)
- `src/components` for shared UI components
- `src/api` for API clients
- `src/state` for global state and caching
- `src/hooks` for shared hooks
- `src/utils` for helpers

## Module Rules

- Each feature module owns its routes, API calls, and UI.
- Shared components must be generic and reusable.
- Do not mix API calls directly into UI components.

## Error Handling

- Show friendly errors for users.
- Log technical details for debugging.
- Handle 401 and 403 globally.

## Checklist

- Features are isolated
- Shared UI components are reusable
- Error handling is consistent
