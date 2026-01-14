# Identifier Standards

All platform entities MUST follow these identification standards.

## 1. System Internal IDs
- **Type**: Version 4 UUIDs.
- **Format**: 36-char string (hex with hyphens).
- **Rule**: Every entity stored in the database MUST have a `id` UUID primary key.

## 2. Public / Human-Readable IDs (KIDs)
- **Type**: Coded strings.
- **Example**: `HH-1234-5678` (for Households).
- **Rule**: KIDs are used for lookup in the field and printed on forms. They MUST NOT be used as database foreign keys.

## 3. External IDs
- **Format**: String.
- **Example**: National ID Number (NIC), Passport Number.
- **Rule**: Stored in the `externalId` or `nationalId` field. MUST be indexed for search.
