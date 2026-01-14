# Sri Lanka Country Form Pack

This folder contains the automation scripts to deploy the standard Government of Sri Lanka (GoSL) data collection interfaces into the SCP.

## Domain Packages
1.  **Civil Registration** (`sri-lanka-civil.forms.yaml`): Birth, Death, Marriage.
2.  **Identity** (`sri-lanka-identity.forms.yaml`): National Identity Card (NIC).
3.  **Travel** (`sri-lanka-travel.forms.yaml`): Passport (Form K).
4.  **Transport** (`sri-lanka-transport.forms.yaml`): Driving License.
5.  **Welfare** (`sri-lanka-welfare.forms.yaml`): Aswesuma / Samurdhi.

## Usage
Run the import script to deploy all forms to the `LK` tenant:
```bash
./import/import-sri-lanka-all.sh
```

## Source of Truth
All fields are derived from the official Forms listed in [source-manifest.md](./sources/source-manifest.md).
