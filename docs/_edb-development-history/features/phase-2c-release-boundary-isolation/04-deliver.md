# Deliver Spec — phase-2c-release-boundary-isolation

## 0) Status
- Owner: EDB governance maintainers
- Created: 2026-02-20
- Last updated: 2026-02-20
- Related docs:
  - Break: `docs/_edb-development-history/features/phase-2c-release-boundary-isolation/01-break.md`
  - Model: `docs/_edb-development-history/features/phase-2c-release-boundary-isolation/02-model.md`
  - Analyze: `docs/_edb-development-history/features/phase-2c-release-boundary-isolation/03-analyze.md`

---

## 1) Scope

### Goal (target outcome)
- Consolidate Release boundary findings into a deterministic `ReleaseBoundaryAssessment`.
- Confirm `StructuralDrift` classification with corrected evidence mapping.
- Explicitly separate allowed Release-domain normative scope from disallowed Versioning-owner rule-topics in Release artifacts.
- Provide non-executing recommendation framing for a future Phase-2C execution step.

### Non-Goals (explicitly out of scope)
- No implementation/refactor execution.
- No governance redesign.
- No authority-owner relocation.
- No lifecycle redesign.
- No SemVer model modification.
- No new governance domains.
- No repository structure changes.
- No orchestrator construction.

### Constraints
- Tech:
  - Documentation-only deliver artifact.
  - No edits to governance documents in this step.
- Perf:
  - Not applicable.
- UX:
  - Keep findings auditable and deterministic for follow-up execution planning.
- Backward compatibility:
  - Preserve Phase-1 invariants I1-I7 and single-owner contract.
- Security/Privacy (if relevant):
  - Not applicable.

---

## 2) Implementation Notes (Reference)

This deliver records analysis outcomes and boundary framing only.  
It does not execute refactors.

For implementation behavior, stop behavior, and execution gates, see:
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`

For versioning and SemVer ownership, see:
- `docs/engineering/versioning.md`

In-scope implementation notes:
- Consolidate diagnostic outputs from `01/02/03` for Phase-2C.
- Correct evidence mapping by separating allowed Release norms from Versioning-owner violations.

Out-of-scope notes:
- No edits to `docs/engineering/guides/RELEASE_GUIDE.md` in this step.
- No authority changes between `docs/engineering/versioning.md` and `docs/engineering/guides/VERSIONING_GUIDE.md`.

Missing-information handling notes (reference `questions.md`):
- If future execution implies owner relocation, lifecycle redesign, new governance domains, or SemVer model change, stop and append to:
  - `docs/_edb-development-history/features/phase-2c-release-boundary-isolation/questions.md`

Namespace reminder:
- Workflow classification: `Minor Change (workflow)` / `BMAD Feature`
- Version classification: `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`

Explicit version decision for this deliver stage:
- `no SemVer change`

---

## 3) Target Files / Folders
List exact paths. No placeholders.

- `docs/_edb-development-history/features/phase-2c-release-boundary-isolation/01-break.md`
- `docs/_edb-development-history/features/phase-2c-release-boundary-isolation/02-model.md`
- `docs/_edb-development-history/features/phase-2c-release-boundary-isolation/03-analyze.md`
- `docs/_edb-development-history/features/phase-2c-release-boundary-isolation/04-deliver.md`
- `docs/engineering/guides/RELEASE_GUIDE.md` (analysis target only; no modification in this stage)
- `docs/engineering/versioning.md` (normative owner reference; no modification)
- `docs/engineering/guides/VERSIONING_GUIDE.md` (informational boundary reference; no modification)

---

## 4) Public API (if any)
Describe final API as it should exist after implementation.

### Exports / Signatures
- No code/API surface.

### Inputs / Outputs
- Inputs:
  - Release artifact evidence from `docs/engineering/guides/RELEASE_GUIDE.md`
  - Owner contract from `docs/engineering/versioning.md`
  - Informational boundary from `docs/engineering/guides/VERSIONING_GUIDE.md`
- Outputs:
  - Deterministic `ReleaseBoundaryAssessment`
  - Corrected boundary mapping (`allowed release norms` vs `disallowed versioning-owner topics`)
  - Non-executing Phase-2C recommendation framing

### Error behavior
- If consolidation implies owner relocation, lifecycle redesign, new governance domains, or SemVer model modification: stop and request clarification.

---

## 5) Data Model / State (if any)
- Entities:
  - `ReleaseEvidenceEntry`
  - `ReleaseBoundaryAssessment`
  - `BoundaryConstraintSet`
- Persistence (if any):
  - Markdown-only analysis/deliver artifacts.
- Invariants (target-state constraints):
  - Versioning owner remains `docs/engineering/versioning.md`.
  - `docs/engineering/guides/VERSIONING_GUIDE.md` remains informational-only.
  - Phase-1 authority invariants I1-I7 remain unchanged.
- Edge cases:
  - Release text can be normative for release operations while still violating versioning-owner boundaries if it defines SemVer meaning/authority.

---

## 6) Implementation Plan (ordered)
Write as an ordered sequence. Each step should be checkable.

1. Consolidate findings from `03-analyze.md` into a corrected evidence map.
2. Separate evidence into:
   - Allowed Release-domain normative scope
   - Disallowed Versioning-owner rule-topics in Release artifact
3. Consolidate deterministic counters from `03-analyze.md` and confirm Release domain status without introducing new evaluation criteria.
4. Validate `BoundaryGuardRule` remains `Pass`.
5. Record non-executing recommendation framing for Phase-2C execution step.

---

## 7) Tests / Validation
Specify how correctness is verified.

### Must-have checks
- Corrected evidence mapping is explicit:
  - Allowed Release-domain normative scope:
    - `Project Classification Matrix` structure definition
    - `Release Requirement Matrix` and requirement-grade vocabulary for release dimensions
    - Release-only requirement definitions (GitHub Releases, Release Notes, Artifact Publishing, CI/CD release automation)
  - Disallowed Versioning-owner rule-topics in Release:
    - `Tags identify authoritative released versions.`
    - `Tags MUST align with version numbers.`
    - Governance boundary claim that `VERSIONING_GUIDE.md` is authoritative for SemVer
- Deterministic assessment is explicit:
  - `overlap_count = 1`
  - `duplication_count = 2`
  - `implicit_rule_creation_count = 0`
  - `versioning_leakage_count = 2`
  - `release_domain_status = StructuralDrift`
- `BoundaryGuardRule` is explicitly `Pass`.
- Scope remains documentation-only and non-executing.

### Optional checks
- Cross-check owner declaration consistency:
  - `docs/engineering/versioning.md` = sole normative owner
  - `docs/engineering/guides/VERSIONING_GUIDE.md` = informational-only

---

## 8) Acceptance Criteria (Definition of Done)
Must be objective and testable.

- [ ] Release boundary findings are consolidated with corrected evidence mapping.
- [ ] Allowed Release-domain normative scope is explicitly separated from disallowed Versioning-owner topics.
- [ ] Deterministic `ReleaseBoundaryAssessment` counters and `StructuralDrift` classification are explicitly declared.
- [ ] `BoundaryGuardRule` pass is explicitly confirmed without scope expansion.
- [ ] Non-executing recommendation framing for Phase-2C execution is documented.
- [ ] Explicit confirmations are present: no owner relocation, no lifecycle redesign, no new governance domains, no SemVer model change.

---

## 9) Rollback / Safety (if relevant)
- Feature flags:
  - Not applicable.
- Migration steps:
  - Not applicable.
- Revert steps:
  - Revert this deliver artifact if superseded by corrected analysis contract.

---

## Deliver Summary

### Deterministic Consolidation
- Final ReleaseBoundaryAssessment (corrected mapping):
  - `overlap_count = 1`
  - `duplication_count = 2`
  - `implicit_rule_creation_count = 0`
  - `versioning_leakage_count = 2`
  - `release_domain_status = StructuralDrift`

### Corrected Evidence Mapping
- Allowed Release-domain normative scope:
  - Release lifecycle requirements by project type and release dimension.
  - Operational release requirement semantics that do not claim SemVer ownership.
- Disallowed Versioning-owner rule-topics in Release artifact:
  - Local assertion of authoritative version meaning in `Git Tags`.
  - Local version alignment obligation (`Tags MUST align with version numbers.`).
  - Indirect owner misreference (`VERSIONING_GUIDE.md` claimed as authoritative for SemVer).

### Phase-2C Recommendation Framing (Non-Executing)
- Restrict Release guide normative content to release-operational rule-topics only.
- Convert versioning-owner assertions to reference-only delegation toward `docs/engineering/versioning.md`.
- Preserve release-domain usability and matrix structure while removing owner-violation semantics in execution phase.

### Explicit Scope Confirmations
- No authority-owner relocation.
- No lifecycle redesign.
- No new governance domains.
- No SemVer model modification.
- No repository structure change.
- No orchestrator construction.

### Unknowns
- No blocking unknowns identified in this deliver step.
- If unknowns emerge in later execution planning, append to:
  - `docs/_edb-development-history/features/phase-2c-release-boundary-isolation/questions.md`
