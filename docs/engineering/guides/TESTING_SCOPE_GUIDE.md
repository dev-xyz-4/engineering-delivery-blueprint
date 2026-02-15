# TESTING_SCOPE_GUIDE

## 1) Purpose And Scope

This document defines normative testing governance scope for this repository.
It standardizes testing depth by project type and risk profile.

This guide defines:
- project type classification
- testing levels (`Minimal`, `Standard`, `Extended`)
- required testing category depth per level
- entry/exit criteria guidance
- escalation triggers and examples

This guide does not define tooling setup, CI mandates, or enforcement automation.

---

## 2) Project Type Classification

Use canonical terminology from `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.

Use the closest primary project type:

- `Local Tool`: local-only utility with no external user exposure.
- `Desktop Application`: distributed client application with limited remote surface.
- `Public Web Application`: internet-facing application with user traffic.
- `Web3 / Financial-Sensitive Application`: systems with blockchain integrations, financial transactions, or regulatory-sensitive operations.

If multiple types apply, use the higher-risk type.

---

## 3) Testing Levels Model

- `Minimal`: baseline confidence for low exposure and low impact.
- `Standard`: default depth for user-facing production systems.
- `Extended`: high-assurance depth for high-impact or high-risk systems.

---

## 4) Baseline Mapping By Project Type

| Project Type | Default Level |
|---|---|
| Local Tool | Minimal |
| Desktop Application | Standard |
| Public Web Application | Standard |
| Web3 / Financial-Sensitive Application | Extended |

Escalate above default when triggers in section 7 are present.

---

## 5) Required Testing Categories By Level

All testing categories apply at all levels; depth varies by level.

| Testing Category | Minimal | Standard | Extended |
|---|---|---|---|
| Unit tests | Core business-path coverage for critical modules | Broad module coverage including boundary conditions | High coverage on critical paths, edge cases, and failure behavior |
| Integration tests | Smoke coverage for key integrations | Deterministic coverage of major integration flows | Extensive integration matrix including degraded/failure scenarios |
| Contract/API tests (where applicable) | Critical request/response contract checks | Versioned contract checks across supported scenarios | Strict contract compatibility and backward-compatibility verification |
| E2E tests (where applicable) | Basic happy-path journey checks | Core user journeys plus primary negative paths | End-to-end journey matrix including recovery/error scenarios |
| Manual/exploratory testing | Targeted manual checks before release | Structured exploratory checklist by feature area | Formal exploratory sessions with documented findings and follow-ups |
| Regression strategy | Focused regression checks on changed scope | Defined regression set for core capabilities | Layered regression strategy with risk-prioritized breadth |
| Test data & environments (governance level) | Stable baseline data and one representative environment | Controlled test data sets and separated environment expectations | Governance for environment parity, data controls, and repeatability |

---

## 6) Entry/Exit Criteria Guidance

### Entry Criteria (high-level)

- Scope and risk profile are documented.
- Target testing level is selected and justified.
- Relevant testing categories are mapped to scope.

### Exit Criteria (high-level)

- Required checks for the selected level are completed.
- Known residual risks are documented and accepted by owner.
- Regression expectations are satisfied for changed scope.

---

## 7) Escalation Triggers And Examples

Escalate from `Minimal` to `Standard` when one or more applies:
- internet exposure is introduced
- external user data is processed
- critical integrations are added
- authentication/authorization behavior is introduced

Escalate from `Standard` to `Extended` when one or more applies:
- custody/signing or irreversible transactions are introduced
- financial loss risk is material
- regulatory/compliance obligations require stronger assurance
- elevated adversarial risk or high-value target profile is expected

Examples:
- Local utility with no remote interface -> `Minimal`
- Public SaaS dashboard with authenticated users -> `Standard`
- Wallet-enabled transaction app -> `Extended`
- Settlement-critical financial service -> `Extended`

If uncertain, choose the higher level and document rationale.

---

## 8) Governance Boundaries

This document is governance-only.

- It defines testing scope and minimum depth expectations.
- It does not mandate CI jobs, framework choices, or automation implementation.
- Enforcement and operational test execution details are defined elsewhere.
