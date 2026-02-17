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
- Contract Revision Note:
  - 2026-02-16: The previous `04-deliver.md` was a Phase 2A roadmap-only planning artifact. This revision converts it into an executable Phase 2B implementation contract.
  - This PR performs contract correction + stray folder cleanup only; no structural implementation is executed in this PR.

---

## 1) Scope

### Goal (must be delivered)
- Define the binding Phase 2B implementation contract for the selected hybrid orchestration model:
  - Entry is treated as a role layered on Guide artifacts.
  - A canonical orchestration index is introduced as the startup map.
- Define executable sequencing, ADR trigger condition, migration safety gates, and governance synchronization conditions for the future Phase 2B implementation PR.

### Non-Goals (explicitly out of scope)
- Do not implement structural changes in this contract-revision PR.
- Do not create ADR files in this contract-revision PR.
- Do not update existing governance documents outside this file in this contract-revision PR.
- Do not change enforcement/tooling semantics in this contract-revision PR.

### Constraints
- Tech:
  - EDB Mode context; contract must remain deterministic and executable in a follow-up implementation PR.
  - This PR is contract rewrite + cleanup only.
- Perf:
  - No runtime/performance impact is allowed in this PR.
- UX:
  - Future implementation must improve startup/orchestration clarity for maintainers and LLM agents.
- Backward compatibility:
  - Existing routing authority chain remains unchanged in this PR.
- Security/Privacy (if relevant):
  - No new security/privacy requirements are introduced by this contract correction.

---

## 2) Implementation Rules (Codex Contract)

### Allowed
- Implement only what is listed in this Deliver Spec.
- Use this document as the binding Phase 2B contract for the next implementation PR.
- In this PR only: update this contract and remove the stray feature folder.

### Not Allowed
- Do not add new features.
- Do not broaden scope beyond this document.
- Do not change public APIs unless explicitly stated below.
- Do not invent missing requirements or defaults.
- Do not execute Phase 2B structural implementation actions in this PR.
- Do not create ADR files in this PR.

### If Information Is Missing
- Stop implementation.
- Write missing items into `questions.md` (same feature folder).
- Propose 1-2 options in `03-analyze.md` (or reference it) and wait for decision.

---

## 3) Target Files / Folders
List exact paths. No placeholders.

- `docs/entry/ORCHESTRATION_INDEX.md`
- `docs/bmad/guides/CODEX_ENTRY.md` (future Phase 2B PR)
- `docs/_edb-development-history/ADR-0002-orchestration-entrypoint-architecture.md`
- `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md` (future Phase 2B PR: only if SemVer/tag change is applied)
- `docs/_edb-development-history/EDB_CHAT_HANDOVER_PROTOCOL.md` (future Phase 2B PR: only if version/tag changes)
- `docs/_edb-development-history/EDB_ENGINEERING_BASELINE.md` (future Phase 2B PR: only if baseline materially changes)

---

## 4) Public API (if any)
Describe final API as it should exist after implementation.

### Exports / Signatures
- No software/public API changes are part of this feature contract.

### Inputs / Outputs
- Inputs:
  - Phase 2A artifacts:
    - `docs/_edb-development-history/features/orchestration-entrypoint-clarity/01-break.md`
    - `docs/_edb-development-history/features/orchestration-entrypoint-clarity/02-model.md`
    - `docs/_edb-development-history/features/orchestration-entrypoint-clarity/03-analyze.md`
- Outputs (future Phase 2B implementation PR):
  - Canonical orchestration index at `docs/entry/ORCHESTRATION_INDEX.md`.
  - Synchronized routing references per approved sequencing.
  - ADR at `docs/_edb-development-history/ADR-0002-orchestration-entrypoint-architecture.md`.

### Error behavior
- If routing -> policy authority becomes ambiguous at any step, implementation must stop and rollback in-flight structural edits before merge.

---

## 5) Data Model / State (if any)
- Entities:
  - Authority entity: `routing authority`, `policy authority`, `state snapshot`, `reusable template`.
  - Mode entity: `Project Mode`, `EDB Mode` with explicit target-path boundaries.
  - Invariant entity: folder/category placement rules for `guides`, `templates`, `notes`, `_edb-development-history`, and entry artifacts.
- Persistence (if any):
  - Governance-document state only.
- Invariants (must always hold):
  - `CODEX_ENTRY.md` remains routing authority.
  - `CODEX_WORKFLOW_POLICY.md` remains singular normative policy authority.
  - No cross-mode write-target ambiguity is introduced.
  - Workflow namespace and version namespace remain explicitly separated.
- Edge cases:
  - Template-like documents placed in non-template locations.
  - Cross-reference drift after any structural update.

---

## 6) Implementation Plan (ordered)
Write as a strict sequence. Each step should be checkable.

1. Finalize authority boundary contract text (routing authority vs policy authority vs state snapshot vs reusable template).
2. Create canonical orchestration index at `docs/entry/ORCHESTRATION_INDEX.md` as the startup map.
3. Apply approved structural updates defined by this contract (if any) in deterministic order, with no cross-mode target regression.
4. Synchronize cross-references to maintain deterministic routing chain.
5. Create ADR `docs/_edb-development-history/ADR-0002-orchestration-entrypoint-architecture.md` documenting final implemented architecture and consequences.
6. Validate mode safety and routing integrity (Project Mode vs EDB Mode boundaries intact; routing -> policy chain unambiguous).
7. Apply governance synchronization in the same PR when applicable:
   - If SemVer/tag changes are applied, update `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md` and `docs/_edb-development-history/EDB_CHAT_HANDOVER_PROTOCOL.md`.
   - Update `docs/_edb-development-history/EDB_ENGINEERING_BASELINE.md` only if baseline materially changes.

---

## 7) Tests / Validation
Specify how correctness is verified.

### Must-have checks
- `04-deliver.md` preserves `deliver.template.md` heading structure exactly.
- `docs/_edb-development-history/features/orchestration-entrypoint-implementation/` is removed entirely in this PR.
- No ADR file is created in this PR.
- No files outside this PR target set are modified.
- Future Phase 2B implementation gate (contractual):
  - `pr-helper doctor --workflow feature-implementation --tag v1.12.0`
  - routing chain remains deterministic (`CODEX_ENTRY.md` -> `CODEX_WORKFLOW_POLICY.md`)
  - no Project Mode vs EDB Mode path regression

### Optional checks
- Reviewer sign-off that target list is executable and unambiguous.
- Dry-run mapping review of planned cross-reference updates before structural edits.

---

## 8) Acceptance Criteria (Definition of Done)
Must be objective and testable.

- [ ] `04-deliver.md` is converted from roadmap-only to executable Phase 2B contract.
- [ ] `04-deliver.md` includes explicit target paths, sequencing, ADR path/trigger, and governance sync conditions.
- [ ] Stray folder `docs/_edb-development-history/features/orchestration-entrypoint-implementation/` is fully removed.

---

## 9) Rollback / Safety (if relevant)
- Feature flags:
  - Not applicable.
- Migration steps:
  - Executed in future Phase 2B implementation PR only; not in this PR.
- Revert steps:
  - If contract ambiguity remains, revert this contract revision and re-open clarification in `questions.md` under `orchestration-entrypoint-clarity` before implementation.
