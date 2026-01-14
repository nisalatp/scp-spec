# Permissions: Field Agent

## List
*   Create Visits
*   Register Households
*   Search People (Geo-scoped)
*   Upload Attachments

## Permission Matrix

| Action | Resource | Condition | Allowed? | Notes |
|---|---|---|---|---|
| `create` | `visit` | `geo=assigned` | Yes | Core task |
| `create` | `person` | `geo=assigned` | Yes | Registration |
| `read` | `person` | `geo=assigned` | Yes | Identification |
| `read` | `person` | `geo=other` | **No** | Blocked |
| `delete` | `visit` | Any | **No** | Immutable |
