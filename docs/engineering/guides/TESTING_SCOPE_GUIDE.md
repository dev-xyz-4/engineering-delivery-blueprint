# TESTING_SCOPE_GUIDE

## Purpose

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

## Design Principle

Testing depth is selected according to project type and risk profile.

If multiple project types apply, use the higher-risk type.

---

## Project Classification Matrix

Use canonical terminology from `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.

Use the closest primary project type from the canonical taxonomy owner:
- `docs/engineering/guides/PROJECT_CLASSIFICATION.md`

This guide does not redefine project-type taxonomy.

---

## Requirement Dimensions

### Testing Levels Model

- `Minimal`: baseline confidence for low exposure and low impact.
- `Standard`: default depth for user-facing production systems.
- `Extended`: high-assurance depth for high-impact or high-risk systems.

### Testing Categories

All testing categories apply at all levels; depth varies by level.

- Unit tests
- Integration tests
- Contract/API tests (where applicable)
- E2E tests (where applicable)
- Manual/exploratory testing
- Regression strategy
- Test data & environments (governance level)

---

## Requirement Matrix

### Baseline Mapping By Project Type

For canonical project-type meanings, refer to `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.
Matrix reading aid:
- `Type Alpha` to `Type Delta` are abstract row labels for quick matrix scanning.
- Canonical project-type meanings are defined in `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.

| Project Type | Default Level |
|---|---|
| Type Alpha | Minimal |
| Type Beta | Standard |
| Type Gamma | Standard |
| Type Delta | Extended |

Escalate above default when triggers in Requirement Definitions are present.

### Required Testing Categories By Level

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

## Requirement Definitions

### Entry/Exit Criteria Guidance

#### Entry Criteria (high-level)

- Scope and risk profile are documented.
- Target testing level is selected and justified.
- Relevant testing categories are mapped to scope.

#### Exit Criteria (high-level)

- Required checks for the selected level are completed.
- Known residual risks are documented and accepted by owner.
- Regression expectations are satisfied for changed scope.

### Escalation Triggers And Examples

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

## Governance Boundary

This guide:

- MUST NOT override project-level decisions documented in instance documents (e.g., `docs/engineering/security.md`, `docs/engineering/testing.md`).
- MUST NOT introduce new workflows or enforcement mechanisms.
- MUST NOT mandate vendors, tools, or specific implementations.
- MUST NOT modify BMAD Feature governance.

---

## Version

Initial baseline established at v1.0.0.
