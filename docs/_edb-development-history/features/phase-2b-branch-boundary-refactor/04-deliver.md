# Deliver Spec — phase-2b-branch-boundary-refactor

## 0) Status
- Owner: EDB governance maintainers
- Created: 2026-02-19
- Last updated: 2026-02-19
- Related docs:
  - Break: `docs/_edb-development-history/features/phase-2b-branch-boundary-refactor/01-break.md`
  - Model: `docs/_edb-development-history/features/phase-2b-branch-boundary-refactor/02-model.md`
  - Analyze: `docs/_edb-development-history/features/phase-2b-branch-boundary-refactor/03-analyze.md`

---

## 1) Scope

### Goal (target outcome)
- Apply one wording-level transformation in Branch Governance to remove versioning owner-violation semantics.
- Keep operational tagging guidance intact.
- Delegate version-meaning authority reference-only to `docs/engineering/versioning.md`.

### Non-Goals (explicitly out of scope)
- No governance redesign.
- No owner relocation.
- No lifecycle redesign.
- No SemVer model change.
- No repository structure change.
- No orchestrator construction.
- No additional wording cleanup beyond the identified statement.

### Constraints
- Tech:
  - Only the identified statement may be modified.
  - No structural reformatting.
  - No new references beyond `docs/engineering/versioning.md`.
- Perf:
  - Not applicable.
- UX:
  - Preserve readability and operational guidance value of `BRANCH_WORKFLOW.md`.
- Backward compatibility:
  - Preserve Phase-1 authority invariants and single SemVer owner model.
- Security/Privacy (if relevant):
  - Not applicable.

---

## 2) Implementation Notes (Reference)

This deliver defines an execution contract for one statement replacement only.

For implementation behavior, stop behavior, and execution gates, see:
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`

For versioning and SemVer ownership, see:
- `docs/engineering/versioning.md`

In-scope implementation notes:
- Replace exactly one owner-violation statement in `docs/engineering/guides/BRANCH_WORKFLOW.md`.
- Replacement must be reference-only delegation to `docs/engineering/versioning.md`.

Out-of-scope notes:
- No edits to other Branch workflow statements.
- No edits to authority model documents.

Missing-information handling notes:
- If execution requires additional artifact edits, lifecycle restructuring, or owner relocation, stop and append clarification to:
  - `docs/_edb-development-history/features/phase-2b-branch-boundary-refactor/questions.md`

Namespace reminder:
- Workflow classification: `Minor Change (workflow)` / `BMAD Feature`
- Version classification: `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`

Explicit version decision:
- `SemVer PATCH`

---

## 3) Target Files / Folders
List exact paths. No placeholders.

- `docs/engineering/guides/BRANCH_WORKFLOW.md`
- `docs/_edb-development-history/features/phase-2b-branch-boundary-refactor/04-deliver.md`
- `docs/_edb-development-history/features/phase-2b-branch-boundary-refactor/questions.md` (only if a blocking unknown is discovered that requires clarification before proceeding)

---

## 4) Public API (if any)
Describe final API as it should exist after implementation.

### Exports / Signatures
- No code/API surface changes.

### Inputs / Outputs
- Input:
  - Pre-state statement in `docs/engineering/guides/BRANCH_WORKFLOW.md` (`## Non-Negotiables`):
    - `Treat tags as authoritative version markers.`
- Output:
  - Post-state replacement statement:
    - `Use tags as operational markers; for version semantics, refer to docs/engineering/versioning.md.`

### Error behavior
- Stop if replacement implies:
  - additional artifact edits
  - lifecycle restructuring
  - owner relocation

---

## 5) Data Model / State (if any)
- Entities:
  - `TransformationTarget`
  - `PostTransformAssessment`
- Persistence (if any):
  - Markdown-only wording update.
- Invariants (target-state constraints):
  - Single normative versioning owner remains `docs/engineering/versioning.md`.
  - Delegation is reference-only.
  - No additional wording changes outside the target statement.
- Edge cases:
  - If replacement wording introduces implicit local versioning authority, treat as non-compliant.

---

## 6) Implementation Plan (ordered)
Write as an ordered sequence. Each step should be checkable.

1. Locate the statement `Treat tags as authoritative version markers.` in `docs/engineering/guides/BRANCH_WORKFLOW.md` under `## Non-Negotiables`.
2. Replace only that statement with:
   `Use tags as operational markers; for version semantics, refer to docs/engineering/versioning.md.`
3. Verify no other lines in `docs/engineering/guides/BRANCH_WORKFLOW.md` were changed.
4. Evaluate post-transform counters:
   - `owner_violation_count = 0`
   - `implicit_rule_creation_count = 0`
   - `versioning_leakage_count = 0`
   - Branch domain = `Clean`
   - Evaluation is performed by a targeted semantic reread of the modified section and cross-check against the Phase-2B model rules; no new tooling or repo-wide scans are introduced.

---

## 7) Tests / Validation
Specify how correctness is verified.

### Must-have checks
- Exact pre/post transformation contract is applied.
- Delegation reference points only to `docs/engineering/versioning.md`.
- No structural section changes in `BRANCH_WORKFLOW.md`.
- No additional wording cleanup beyond the identified statement.
- Post-transform evaluation confirms:
  - `owner_violation_count = 0`
  - `implicit_rule_creation_count = 0`
  - `versioning_leakage_count = 0`
  - Branch domain = `Clean`

### Optional checks
- Semantic reread of `## Non-Negotiables` to confirm no implicit ownership language remains.

---

## 8) Acceptance Criteria (Definition of Done)
Must be objective and testable.

- [ ] Owner-violation statement is replaced exactly once in `docs/engineering/guides/BRANCH_WORKFLOW.md`.
- [ ] Replacement is reference-only delegation to `docs/engineering/versioning.md`.
- [ ] `owner_violation_count = 0`, `implicit_rule_creation_count = 0`, `versioning_leakage_count = 0`, and Branch domain = `Clean`.
- [ ] No governance redesign, owner relocation, lifecycle redesign, SemVer model change, repository structure change, or orchestrator construction is introduced.
- [ ] No additional wording cleanup or structural reformatting is introduced.

---

## 9) Rollback / Safety (if relevant)
- Feature flags:
  - Not applicable.
- Migration steps:
  - Not applicable.
- Revert steps:
  - Revert the single transformed line in `docs/engineering/guides/BRANCH_WORKFLOW.md` if post-transform validation fails.

