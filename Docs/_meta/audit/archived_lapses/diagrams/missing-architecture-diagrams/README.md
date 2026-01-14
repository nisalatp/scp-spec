# Lapse: Missing Architecture Diagrams

**Audit ID:** AUD-020
**Area:** C4 / UML
**Status:** OPEN

## Description
The `Docs/Diagrams` directory is missing entirely, despite being referenced by the SPEC and System README.

## Mismatch
- **SPEC (00-index.md)**: Links to `../Docs/Diagrams/README.md`, `../Docs/UML/README.md`.
- **System (Docs/System/README.md)**: Links to `../../Diagrams/UML/Core/system-class-diagram.puml`.
- **Reality**: The `Docs/Diagrams` folder does not exist.

## Impact
Major gap in architectural documentation. Developers have no visual reference for the system context, containers, or global data model outside of the localized component diagrams (which I recently created).

## Resolution
Recreate the `Docs/Diagrams` structure and populate with the canonical C4 and UML diagrams defined in the SPEC.
