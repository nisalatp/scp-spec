# Schedule Report

## Description
Automating the generation of reports (e.g., "Send me the Weekly Summary every Monday at 9 AM").

## Component
Reporting & Exports

## Actors / Roles
- **Analyst**
- **Program Manager**

## Permissions
- `report.schedule`

## Scope Rules
- **Vertical Scope**.

## Main Flow
1.  **Actor**: Selects Report "Weekly Summary".
2.  **Actor**: Sets Frequency "Weekly on Monday".
3.  **Actor**: Adds Recipients "director@health.gov.lk".
4.  **Action**: Save.
5.  **System**: Creates Cron Job.

## Data Read / Written
- **ReportSchedule**: Write.

## Uses
- Keeping management informed without manual work.

## Related Use Cases
- UC-01: System Maintenance

## References
- `SPEC/03-domain/10-analytics-reporting-model.md`
