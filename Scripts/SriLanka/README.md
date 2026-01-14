# Sri Lanka Top 15 High-Impact Forms

This directory contains the automation-ready scripts for the Top 15 Government Forms.

## Forms List
1.  **Birth Registration**: `packages/01-birth-registration.forms.yaml`
2.  **Death Registration**: `packages/02-death-registration.forms.yaml`
3.  **Marriage Registration**: `packages/03-marriage-registration.forms.yaml`
4.  **NIC Application**: `packages/04-nic-application-update.forms.yaml`
5.  **Household Census**: `packages/05-household-registration-census.forms.yaml`
6.  **Income & Employment**: `packages/06-income-employment-declaration.forms.yaml`
7.  **Welfare (Samurdhi/Aswesuma)**: `packages/07-welfare-samurdhi-aswesuma.forms.yaml`
8.  **MCH Registration**: `packages/08-maternal-child-health-registration.forms.yaml`
9.  **Disability Registration**: `packages/09-disability-registration.forms.yaml`
10. **Chronic Illness / Medical**: `packages/10-chronic-illness-medical-assistance.forms.yaml`
11. **School Enrollment**: `packages/11-school-enrollment-attendance.forms.yaml`
12. **Scholarship**: `packages/12-scholarship-student-assistance.forms.yaml`
13. **Housing & Assets**: `packages/13-housing-asset-declaration.forms.yaml`
14. **Disaster Assessment**: `packages/14-disaster-environmental-damage-assessment.forms.yaml`
15. **Digital Connectivity**: `packages/15-digital-access-connectivity-registration.forms.yaml`

## Import
Run the import script to deploy all forms to tenant `LK`:
```bash
./import/import-sri-lanka-top15.sh
```
