# API & Events: Analytics & Data Mesh

## APIs
| Method | Path | Purpose |
|---|---|---|
| `POST` | `/mesh/products` | Register a new Data Product. |
| `POST` | `/mesh/query` | Run a federated query (SQL-like). |
| `GET` | `/mesh/catalog` | List available Data Products. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `DataProductPublished` | `analytics.governance` | `product_id`, `schema_version` |
| `DataProductDeprecated` | `analytics.governance` | `product_id`, `reason` |

## Query Interface
- Supports a subset of SQL (Trino/Presto style) for joining across authorized Data Products.
