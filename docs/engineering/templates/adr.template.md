# ADR Template

Use this template to document architecture decisions in a traceable, reviewable, and reusable format.

This template supports governance baseline consolidation leading to `v1.9.0`.

---

## ADR Header

- ADR ID: `<adr-0001>`
  - ADR IDs are typically sequential by convention and are usually kept immutable once assigned.
  - If deviating, document the rationale in the ADR.
- Title: `<short-decision-title>`
- Date: `<YYYY-MM-DD>`
- Status: `<Proposed | Accepted | Superseded | Rejected>`
  - If superseded, reference the ADR ID that replaces it.
- Owners/Authors (optional): `<name(s)>`

---

## Context

Describe the background and constraints that make this decision necessary.

Guidance:
- What problem are we solving?
- What constraints (technical, product, compliance, operational) matter?
- What assumptions are currently true?

---

## Decision

State the final decision clearly and unambiguously.

Guidance:
- Write the selected approach in concrete terms.
- Avoid vague wording such as "consider" or "maybe".

---

## Decision Drivers

List the factors that most strongly influenced this decision.

Guidance:
- Prioritize key drivers (e.g., reliability, maintainability, cost, security, delivery speed).
- Keep this list concise and decision-focused.

---

## Considered Options

List all realistic alternatives evaluated before deciding.

Guidance:
- Include at least one viable alternative to the selected option.
- Name options consistently (Option A/B/C or explicit names).

---

## Pros/Cons (Per Option)

### Option A: `<name>`
- Pros:
  - `<benefit-1>`
  - `<benefit-2>`
- Cons:
  - `<tradeoff-1>`
  - `<tradeoff-2>`

### Option B: `<name>`
- Pros:
  - `<benefit-1>`
  - `<benefit-2>`
- Cons:
  - `<tradeoff-1>`
  - `<tradeoff-2>`

### Option C: `<name>` (optional)
- Pros:
  - `<benefit-1>`
- Cons:
  - `<tradeoff-1>`

Guidance:
- Keep comparisons balanced and evidence-based.
- Do not hide meaningful downsides of the selected option.

---

## Consequences (Positive/Negative)

Document expected outcomes after adopting the decision.

### Positive consequences
- `<positive-outcome-1>`
- `<positive-outcome-2>`

### Negative consequences
- `<negative-outcome-1>`
- `<negative-outcome-2>`

Guidance:
- Include short-term and long-term consequences.

---

## Risks & Mitigations

List the key risks introduced by this decision and how they are mitigated.

| Risk | Impact | Mitigation | Owner |
|---|---|---|---|
| `<risk-1>` | `<high/med/low>` | `<mitigation-1>` | `<owner>` |
| `<risk-2>` | `<high/med/low>` | `<mitigation-2>` | `<owner>` |

---

## Validation / How To Verify

Define how to confirm the decision is working as intended.

Guidance:
- What signals, tests, or metrics indicate success?
- What checkpoints will be used post-implementation?

Validation checklist (example):
- [ ] `<validation-step-1>`
- [ ] `<validation-step-2>`
- [ ] `<validation-step-3>`

---

## Rollback Plan (If Applicable)

Describe how to back out or replace this decision safely if it fails.

Guidance:
- Define rollback trigger(s).
- Define the rollback steps in execution order.
- Identify owner and communication expectations.

---

## References / Links

Add links to supporting material.

Examples:
- Related BMAD artifact(s): `<path>`
- PR(s): `<url-or-id>`
- Issue(s): `<url-or-id>`
- External docs/specs: `<url>`

---

## Notes

- This template standardizes decision capture; it does not create enforcement by itself.
- Project-specific governance rules remain authoritative in their dedicated guides.
