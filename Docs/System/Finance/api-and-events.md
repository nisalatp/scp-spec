# API & Events: Finance

## APIs
| Method | Path | Purpose |
|---|---|---|
| `GET` | `/finance/budgets/{id}` | Check status. |
| `POST` | `/finance/obligations` | Create a request. |
| `POST` | `/finance/obligations/{id}/approve` | Authorization. |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `ObligationApproved` | `finance.core` | `obligation_id`, `amount`, `currency` |
| `BudgetExceeded` | `finance.alerts` | `program_id` |

## Integration
- `ObligationApproved` event is consumed by the **Integration Layer** to trigger the Payment Adapter.
