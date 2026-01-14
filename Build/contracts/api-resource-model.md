# API Resource Model

This document defines the core JSON structures used in the SCP API.

## 1. Identity Resources

### Person
```json
{
  "id": "uuid",
  "fullName": "string",
  "dateOfBirth": "iso-date",
  "nationalId": "string (nullable)",
  "status": "active | deceased | migrated",
  "meta": { "createdAt": "iso-date", "updatedAt": "iso-date" }
}
```

### Household
```json
{
  "id": "uuid",
  "address": "string",
  "geoNodeId": "uuid",
  "members": [
    { "personId": "uuid", "role": "head | spouse | dependent" }
  ]
}
```

## 2. Operational Resources

### Case
```json
{
  "id": "uuid",
  "programId": "uuid",
  "personId": "uuid",
  "status": "open | pending_approval | approved | rejected | closed",
  "priority": "int (1-5)",
  "interventions": []
}
```

## 3. Governance Resources

### Tenant
```json
{
  "id": "uuid",
  "name": "string",
  "config": {
    "defaultLanguage": "string",
    "supportedVerticals": ["uuid"]
  }
}
```
