# Edge Cases & Failures: Notifications & Email

## Edge Cases
1.  **No Contact Info**: User has no Email/Phone. (Log "Skipped - No Channel").
2.  **Template Missing**: Locale `fr` requested but not found. (Fallback to `en`).
3.  **Quota Exceeded**: Tenant out of SMS credits. (Queue and Alert Admin, or Drop non-critical).
4.  **Sensitive Content**: Do NOT include PII in Subject lines. (Policy violation check).

## Failure Handling
- **SMTP Down**: Retry 3 times with exponential backoff (1m, 5m, 15m). Then Fail.
