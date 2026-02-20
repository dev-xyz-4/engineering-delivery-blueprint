# Testing Strategy Template

## 0) Authority

This template is governed by:
- `docs/engineering/guides/TESTING_SCOPE_GUIDE.md`

This is governance documentation only.
Do not include CI setup, tooling configuration, or enforcement logic.

---

## 1) Classification

- Project type: `<canonical project type from docs/engineering/guides/PROJECT_CLASSIFICATION.md>`
- Selected testing level: `<Minimal|Standard|Extended>`
- Rationale: `<why this level is appropriate>`
- Escalation triggers considered:
  - `<trigger-1>`
  - `<trigger-2>`
  - `<trigger-3>`

---

## 2) Goals And Non-goals

### Goals
- `<goal-1>`
- `<goal-2>`

### Non-goals
- `<non-goal-1>`
- `<non-goal-2>`

---

## 3) Scope

### In scope
- `<in-scope-1>`
- `<in-scope-2>`

### Out of scope
- `<out-of-scope-1>`
- `<out-of-scope-2>`

---

## 4) Test Levels And Approach

### Unit
- Strategy: `<approach>`
- Coverage intent: `<expectation by risk>`

### Integration
- Strategy: `<approach>`
- Coverage intent: `<expectation by risk>`

### Contract/API (if applicable)
- Strategy: `<approach>`
- Coverage intent: `<expectation by risk>`

### E2E (if applicable)
- Strategy: `<approach>`
- Coverage intent: `<expectation by risk>`

### Manual/Exploratory
- Strategy: `<approach>`
- Coverage intent: `<expectation by risk>`

---

## 5) Regression Strategy

- Regression definition: `<what counts as regression for this scope>`
- Execution timing: `<when regression runs>`
- Minimal regression suite: `<minimum set that must pass>`

---

## 6) Environments And Test Data

- Environment expectations (governance-level): `<baseline requirements>`
- Test data expectations (governance-level): `<baseline requirements>`
- Data handling constraints: `<sensitive-data rules, if any>`

---

## 7) Entry/Exit Criteria

### Entry criteria
- `<criterion-1>`
- `<criterion-2>`

### Exit criteria
- `<criterion-1>`
- `<criterion-2>`

---

## 8) Defect Handling And Triage

- Severity model: `<S1..Sn or equivalent>`
- Ownership: `<who triages and who resolves>`
- Workflow: `<report -> triage -> fix -> verify -> close>`

---

## 9) Ownership And Review Cadence

- Strategy owner: `<team-or-role>`
- Last review: `<YYYY-MM-DD>`
- Next review: `<YYYY-MM-DD>`
- Review cadence: `<e.g., each release / monthly / quarterly>`

---

## 10) Evidence And Reporting

- Expected artifacts:
  - `<test report links>`
  - `<coverage notes>`
  - `<release/sign-off record>`
- Evidence retention expectation: `<where/how long>`
