# API & Events: Geo Engine

## APIs
| Method | Path | Purpose |
|---|---|---|
| `GET` | `/geo/hierarchy` | Full tree structure. |
| `POST` | `/geo/nodes` | Create Node. |
| `POST` | `/geo/resolve` | Point -> Node ID. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `GeoNodeCreated` | `ref.geo` | `node_id`, `parent_id` |
| `GeoMetricsUpdated`| `ref.geo` | `node_id`, `metric` |

## Idempotency
- Nodes identified by `code`.
