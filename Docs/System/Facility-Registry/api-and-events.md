# API & Events: Facility Registry

## APIs
| Method | Path | Purpose |
|---|---|---|
| `GET` | `/facilities` | List with filters (geo, type). |
| `GET` | `/facilities/nearby` | Geo-spatial constraint. |
| `POST` | `/facilities` | Create new. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `FacilityCreated` | `registry.facility` | `facility_id`, `geo_id` |
| `FacilityStatusChanged` | `registry.facility` | `status` |

## Integration
- `FacilityCreated` triggers sync to **Field Apps** (via Sync Service).
