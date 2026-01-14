# Workflows: Identity

## Workflow: Registration (Field)
1.  **Actor**: Field Agent.
2.  **Pre-Check**: `GET /person/search?nic=123V`.
3.  **Result**: Empty (No duplicate).
4.  **Action**: `POST /person` with demographics.
5.  **State**: `status=Provisional`.
6.  **Next**: Link to Household.

## Workflow: Sensitive Access (Negative Flow)
1.  **Actor**: Education Officer.
2.  **Action**: `GET /person/{id}` (Person only in Health program).
3.  **Check**: Consent Engine returns `False`.
4.  **Result**: 403 Forbidden / 404 Not Found (Security through obscurity).
