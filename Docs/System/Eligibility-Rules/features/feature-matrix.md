# Feature Matrix: Eligibility Rules

| Feature | Description | Roles | Permissions | UC Coverage | Notes |
|---|---|---|---|---|---|
| **Define Rules** | Create Logic | Program Manager | `rules.create` | UC-40 | JSONLogic |
| **Test Rules** | Ensure Correctness | Analyst | `rules.evaluate` | UC-42 | Dry Run |
| **Approve Policy** | Activate Rules | Umbrella Auth | `rules.approve` | UC-40 | Versioned |
