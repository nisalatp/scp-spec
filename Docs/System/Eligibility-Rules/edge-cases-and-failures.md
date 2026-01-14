# Edge Cases & Failures: Eligibility Rules Engine

## Edge Cases
1.  **Missing Data**: Rule says `if Age > 60`. Person has `Age = Null`. (Logic must define "Treat Null as False" or "Return Unknown").
2.  **Circular Reference**: Variable A depends on B, B on A. (Static Analysis prevention).
3.  **Complex variables**: "Household Income per Capita weighted by Disability". (Pre-calculation layer required).

## Failure Handling
- **Evaluation Error**: If a rule crashes (e.g. Divide by Zero), fail safely (Deny Eligibility) and alert Admin.
