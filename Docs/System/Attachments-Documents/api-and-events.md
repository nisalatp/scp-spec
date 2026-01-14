# API & Events: Attachments & Documents

## APIs
| Method | Path | Purpose |
|---|---|---|
| `POST` | `/attachments/sign` | Get Pre-Signed Upload URL. |
| `POST` | `/attachments/complete` | "I finished uploading". Triggers Scan. |
| `GET` | `/attachments/{id}/download` | Get Pre-Signed Download URL (302 Redirect). |

## Events
| Event Name | Topic | Payload Keys |
|---|---|---|
| `FileUploaded` | `files.core` | `attachment_id`, `target_type`, `key` |
| `MalwareDetected` | `files.core` | `attachment_id` |

## Integration
- `MalwareDetected` triggers an alert to Security Operations.
