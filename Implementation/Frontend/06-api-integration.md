# 06 API Integration

This section covers how the frontend should call SCP APIs.

## 1. API Client

Create a single API client that:

- Adds the access token to each request.
- Adds tenant headers if required by API.
- Handles 401 and 403 globally.

## 2. Request Rules

- Use the API base URL from config.
- Never hardcode tenant IDs in the UI.
- Use pagination and filtering where supported.

## 3. Error Handling

Map error codes to user friendly messages:

- 400: invalid input
- 401: login required
- 403: access denied
- 404: not found
- 409: conflict
- 500: server error

## 4. File Uploads

- Use multipart uploads for attachments.
- Show progress and handle retries.

## 5. Reporting

- Use report definitions and runs.
- Do not attempt raw SQL or ad hoc queries.

## Checklist

- API client adds tokens correctly
- Errors are handled consistently
- Uploads work with large files
