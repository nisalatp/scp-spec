# 07 State and Cache

This section covers state management and caching.

## 1. Local State

Use local component state for simple UI state.

## 2. Global State

Use a global store for:

- Active tenant context
- Active vertical scope
- User profile and roles

## 3. API Cache

Use a request cache to avoid repeated calls:

- Cache list views with filters.
- Invalidate cache after create or update.

## 4. Sensitive Data

- Do not store PII in persistent browser storage.
- Use memory or session storage only when required.

## Checklist

- Global state is minimal
- Cache invalidation is reliable
- PII is not stored in local storage
