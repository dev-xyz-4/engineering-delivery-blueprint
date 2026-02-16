# Deliver Spec — orchestration-entrypoint-clarity

## 0) Status
- Owner:
  - EDB maintainers
- Created:
  - 2026-02-16
- Last updated:
  - 2026-02-16
- Related docs:
  - Break:
    - `docs/_edb-development-history/features/orchestration-entrypoint-clarity/01-break.md`
  - Model:
    - `docs/_edb-development-history/features/orchestration-entrypoint-clarity/02-model.md`
  - Analyze:
    - `docs/_edb-development-history/features/orchestration-entrypoint-clarity/03-analyze.md`

---

## 1) Scope

### Goal (must be delivered)
- Define a phased implementation roadmap for the selected hybrid orchestration model (Entry as role layered on Guide artifacts plus explicit orchestration index), including sequencing, safety gates, and governance integration rules for future implementation PRs.
- Formalize separation between this analysis-phase PR and future structural implementation PR(s).

### Non-Goals (explicitly out of scope)
- No structural file/folder moves are executed in this phase.
- No governance document updates outside this feature track are executed in this phase.
- No enforcement/tooling updates (including `scripts/quality/pr-helper.sh`) are executed in this phase.
- No ADR is created in this phase.

### Constraints
- Tech:
  - Operate strictly in EDB Mode and within the feature track under `docs/_edb-development-history/features/orchestration-entrypoint-clarity/`.
  - Treat roadmap items as future-phase instructions, not current execution steps.
- Perf:
  - No runtime/performance effect is allowed because this phase is planning-only.
- UX:
  - Roadmap must improve onboarding/orchestration clarity for both maintainers and LLM agents.
- Backward compatibility:
  - Existing routing authority and mode behavior remain unchanged in this phase.
- Security/Privacy (if relevant):
  - No new security/privacy handling is introduced in this planning-only phase.

---

## 2) Implementation Rules (Codex Contract)

### Allowed
- Implement only what is listed in this Deliver Spec.
- Document phased rollout and migration sequencing as future work.
- Define regression guards and validation gates that future structural PRs must satisfy.

### Not Allowed
- Do not add new features.
- Do not broaden scope beyond this document.
- Do not change public APIs unless explicitly stated below.
- Do not invent missing requirements or defaults.
- Do not execute file moves, renames, or routing changes in this phase.
- Do not create ADR documents in this phase.

### If Information Is Missing
- Stop implementation.
- Write missing items into `questions.md` (same feature folder).
- Propose 1–2 options in `03-analyze.md` (or reference it) and wait for decision.

---

## 3) Target Files / Folders
List exact paths. No placeholders.

- `docs/_edb-development-history/features/orchestration-entrypoint-clarity/04-deliver.md`

---

## 4) Public API (if any)
Describe final API as it should exist after implementation.

### Exports / Signatures
- No software/public API changes are part of this deliverable.

### Inputs / Outputs
- Input:
  - Existing Phase 2A artifacts (`01-break.md`, `02-model.md`, `03-analyze.md`).
- Output:
  - A phased implementation roadmap with explicit governance and safety conditions for subsequent structural phases.

### Error behavior
- If future-phase prerequisites are incomplete (for example undefined folder invariants or missing authority boundary contract), structural implementation must not start and must return to analysis clarification.

---

## 5) Data Model / State (if any)
- Entities:
  - Phase entity: `2A (analysis complete)`, `2B (structural implementation feature)`, `2C (stabilization and consistency pass)`.
  - Governance artifact role entity: `routing authority`, `policy authority`, `state snapshot`, `reusable template`.
  - Validation gate entity: `routing gate`, `mode-boundary gate`, `template-invariant gate`, `regression gate`.
- Persistence (if any):
  - Persisted as feature-track documentation only.
- Invariants (must always hold):
  - Workflow namespace and SemVer namespace remain explicitly separated.
  - No cross-mode write target ambiguity is introduced.
  - Routing authority and policy authority remain non-conflicting.
  - Template artifacts do not contain blueprint self-history state.
- Edge cases:
  - Candidate artifacts that appear template-like but reside outside template folders.
  - Mixed references where one document is treated as both state snapshot and routing authority.

---

## 6) Implementation Plan (ordered)
Write as a strict sequence. Each step should be checkable.

1. Phase 2A (current analysis PR) baseline freeze:
   - Confirm this PR remains analysis-only (no structural moves, no enforcement changes).
   - Confirm separation from implementation PR scope in PR narrative.
2. Phase 2B (future implementation feature PR):
   - Translate approved hybrid model into concrete structural proposal.
   - Apply migration sequencing in this order: authority contract finalization -> routing map update -> structure changes (if approved) -> reference synchronization.
   - Trigger ADR creation if and only if structural relocation or authority contract change is approved.
3. Phase 2C (future stabilization PR):
   - Execute regression guard checklist across routing, policy, mode boundary, and template invariants.
   - Run consistency audit for cross-doc references and onboarding coherence.
   - Finalize governance synchronization actions (versioning/log/handover) based on actual structural outcomes.

---

## 7) Tests / Validation
Specify how correctness is verified.

### Must-have checks
- `04-deliver.md` exists and follows `docs/bmad/templates/deliver.template.md` headings exactly.
- This deliverable contains phased plan separation:
  - analysis PR vs structural implementation PR explicitly distinguished.
- Migration sequencing is defined as future-phase order, not executed actions.
- Regression guard checklist is defined for:
  - routing authority integrity
  - policy authority integrity
  - mode-boundary safety (Project Mode vs EDB Mode)
  - template/folder invariants
- Validation gates before any future relocation are explicitly stated.
- ADR trigger condition is explicit:
  - ADR is mandatory when structural relocation or authority contract change is selected in implementation phase.
- Governance integration for future PRs is explicit:
  - Minor Change (workflow) log updates when applicable
  - chat-handover updates on version/tag changes
  - SemVer MINOR when structural governance changes are implemented

### Optional checks
- Independent reviewer confirms roadmap clarity without additional oral context.
- Dry-run checklist review confirms no hidden implementation steps are implied.

---

## 8) Acceptance Criteria (Definition of Done)
Must be objective and testable.

- [ ] `04-deliver.md` is present and structure-identical to `deliver.template.md`.
- [ ] The document defines a phased roadmap (2A/2B/2C) with explicit analysis-vs-implementation separation.
- [ ] Migration sequencing, regression guards, validation gates, governance integration rules, and ADR trigger condition are documented without executing structural change.

---

## 9) Rollback / Safety (if relevant)
- Feature flags:
  - Not applicable in this planning-only deliverable.
- Migration steps:
  - Not executed in this phase; future structural steps must pass validation gates first.
- Revert steps:
  - If roadmap scope is disputed, revert to `03-analyze.md`, update assumptions/risks, and reissue deliver plan without structural execution.
