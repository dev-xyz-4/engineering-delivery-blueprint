# Deliver Spec — phase-2c-release-boundary-refactor

## 0) Status
- Owner: EDB governance maintainers
- Created: 2026-02-20
- Last updated: 2026-02-20
- Related docs:
  - Break: `docs/_edb-development-history/features/phase-2c-release-boundary-refactor/01-break.md`
  - Model: `docs/_edb-development-history/features/phase-2c-release-boundary-refactor/02-model.md`
  - Analyze: `docs/_edb-development-history/features/phase-2c-release-boundary-refactor/03-analyze.md`

---

## 1) Scope

### Goal (target outcome)
- Execute a minimal wording-level update in `docs/engineering/guides/RELEASE_GUIDE.md` limited to transformation targets `T1–T3`.
- Remove versioning-owner assertions from Release domain while preserving allowed Release-domain normative scope.
- Achieve deterministic post-refactor boundary status:
  - `duplication_count_post = 0`
  - `versioning_leakage_count_post = 0`
  - `release_domain_status_post = Clean`

### Non-Goals (explicitly out of scope)
- No governance redesign.
- No authority-owner relocation.
- No lifecycle redesign.
- No SemVer model modification.
- No new governance domains.
- No repository structure change.
- No edits outside identified transformation targets.

### Constraints
- Tech:
  - Transform only `T1–T3` statements.
  - Preserve `Release Requirement Matrix` and release-only criteria structure/content.
  - Do not introduce new versioning rules in `RELEASE_GUIDE.md`.
- Perf:
  - Not applicable.
- UX:
  - Preserve readability and operational utility of `RELEASE_GUIDE.md`.
- Backward compatibility:
  - Preserve Phase-1 invariants I1-I7 and single-owner authority contract.
- Security/Privacy (if relevant):
  - Not applicable.

---

## 2) Implementation Notes (Reference)

This document defines the execution contract for wording-level boundary correction.

For implementation behavior, stop behavior, and execution gates, see:
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`

For versioning and SemVer ownership, see:
- `docs/engineering/versioning.md`

In-scope implementation notes:
- Apply `ReleaseOwnerViolationTargetRule` targets only:
  - T1: `Tags identify authoritative released versions.`
  - T2: `Tags MUST align with version numbers.`
  - T3: ``... `docs/engineering/guides/VERSIONING_GUIDE.md` remains authoritative for SemVer.``
- Apply:
  - `VersioningOwnerAssertionRemovalRule`
  - `SemVerOwnerDelegationRule`
  - `NoSemanticExpansionConstraint`
  - `BoundaryInvariantGuardRule`

Out-of-scope notes:
- No broad cleanup outside T1–T3.
- No structural section reformatting.

Missing-information handling notes (reference `questions.md`):
- If execution implies owner relocation, lifecycle redesign, new governance domains, or SemVer model modification, stop and append to:
  - `docs/_edb-development-history/features/phase-2c-release-boundary-refactor/questions.md`

Namespace reminder:
- Workflow classification: `Minor Change (workflow)` / `BMAD Feature`
- Version classification: `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`

Explicit SemVer decision for execution stage:
- `SemVer PATCH`

Mode-aware canonical routing requirement (execution stage):
- In EDB mode, route required log/handover updates via:
  - `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md`
  - `docs/_edb-development-history/EDB_CHAT_HANDOVER_PROTOCOL.md`

---

## 3) Target Files / Folders
List exact paths. No placeholders.

- `docs/engineering/guides/RELEASE_GUIDE.md`
- `docs/_edb-development-history/features/phase-2c-release-boundary-refactor/04-deliver.md`
- `docs/_edb-development-history/features/phase-2c-release-boundary-refactor/questions.md` (only if needed)
- `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md` (execution-stage routing requirement)
- `docs/_edb-development-history/EDB_CHAT_HANDOVER_PROTOCOL.md` (execution-stage routing requirement)

---

## 4) Public API (if any)
Describe final API as it should exist after implementation.

### Exports / Signatures
- No code/API surface.

### Inputs / Outputs
- Inputs:
  - `docs/engineering/guides/RELEASE_GUIDE.md` target statements T1–T3
  - owner policy: `docs/engineering/versioning.md`
  - informational guide boundary: `docs/engineering/guides/VERSIONING_GUIDE.md`
- Outputs:
  - T1–T3 transformed to remove local SemVer authority semantics
  - Reference-only SemVer delegation to `docs/engineering/versioning.md`
  - Deterministic post-transform `Clean` status

### Error behavior
- Stop if transformation needs edits beyond T1–T3 or implies prohibited structural implications.

---

## 5) Data Model / State (if any)
- Entities:
  - `ReleaseTransformationTarget`
  - `ReleaseBoundaryScopeMap`
  - `ReleasePostRefactorAssessment`
- Persistence (if any):
  - Markdown-only document update.
- Invariants (target-state constraints):
  - Single versioning owner remains `docs/engineering/versioning.md`.
  - `docs/engineering/guides/VERSIONING_GUIDE.md` remains informational-only.
  - Allowed Release-domain normative scope remains intact.
- Edge cases:
  - Replacement text must not introduce implicit versioning-owner semantics.

---

## 6) Implementation Plan (ordered)
Write as an ordered sequence. Each step should be checkable.

1. Locate T1–T3 in `docs/engineering/guides/RELEASE_GUIDE.md`.
2. Transform T1 and T2 via `VersioningOwnerAssertionRemovalRule` to remove local SemVer authority semantics.
3. Transform T3 via `SemVerOwnerDelegationRule` to delegate authoritative SemVer ownership to `docs/engineering/versioning.md`.
4. Validate `AllowedReleaseNormativeScopeRule`: all release-only normative sections remain unchanged.
5. Validate `NoSemanticExpansionConstraint` and `BoundaryInvariantGuardRule`.
6. Compute deterministic post-transform counters limited to versioning-owner rule-topics and confirm:
  - duplication_count_post = 0
  - versioning_leakage_count_post = 0
  - release_domain_status_post = Clean
7. Route canonical EDB log/handover updates per mode requirements.

---

## 7) Tests / Validation
Specify how correctness is verified.

### Must-have checks
- Only T1–T3 are changed in `RELEASE_GUIDE.md`.
- No additional lines are modified outside the exact statement boundaries of T1–T3.
- No change to `Release Requirement Matrix` structure or release-only criteria sections.
- No remaining statement in Release domain asserts SemVer ownership outside `docs/engineering/versioning.md`.
- `VERSIONING_GUIDE.md` is not treated as SemVer authority in `RELEASE_GUIDE.md`.
- Deterministic post-transform result:
  - `duplication_count_post = 0`
  - `versioning_leakage_count_post = 0`
  - `release_domain_status_post = Clean`
- `BoundaryInvariantGuardRule` = Pass.

### Optional checks
- Semantic reread for implicit authority leakage in `## Governance Boundary` and `### Git Tags`.

---

## 8) Acceptance Criteria (Definition of Done)
Must be objective and testable.

- [ ] Transformation targets T1–T3 are fully applied and limited to those targets.
- [ ] Preserved Release-domain normative scope is explicitly unchanged.
- [ ] Removed Versioning-owner assertions are replaced with reference-only delegation to `docs/engineering/versioning.md`.
- [ ] Deterministic post-transform assessment is `Clean` with required counter values.
- [ ] No owner relocation, lifecycle redesign, new governance domains, or SemVer model modification is introduced.
- [ ] Canonical EDB log/handover routing requirements are satisfied for execution stage.

---

## 9) Rollback / Safety (if relevant)
- Feature flags:
  - Not applicable.
- Migration steps:
  - Not applicable.
- Revert steps:
  - Revert only transformed T1–T3 statements if validation fails.

---

## Deliver Summary

### Consolidated Transformation Targets
- T1: `Tags identify authoritative released versions.`
- T2: `Tags MUST align with version numbers.`
- T3: ``... `docs/engineering/guides/VERSIONING_GUIDE.md` remains authoritative for SemVer.``

### Preserved vs Removed Scope
- Preserved:
  - Release-domain normative scope (matrix + release-only criteria).
- Removed/Transformed:
  - Versioning-owner assertions in Release domain.
  - SemVer authority misreference to `VERSIONING_GUIDE.md`.

### Deterministic Outcome Contract
- `duplication_count_post = 0`
- `versioning_leakage_count_post = 0`
- `release_domain_status_post = Clean`

### Explicit Scope Confirmations
- No authority-owner relocation.
- No lifecycle redesign.
- No new governance domains.
- No SemVer model modification.
- No repository structure change.

### Unknowns
- No blocking unknowns identified in this deliver step.
- If unknowns emerge, append to:
  - `docs/_edb-development-history/features/phase-2c-release-boundary-refactor/questions.md`
