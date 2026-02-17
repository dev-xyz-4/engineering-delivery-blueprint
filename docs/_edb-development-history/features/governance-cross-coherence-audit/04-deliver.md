# Deliver Spec — governance-cross-coherence-audit

## 0) Status
- Owner: EDB maintainers
- Created: 2026-02-17
- Last updated: 2026-02-17
- Related docs:
  - Break: `docs/_edb-development-history/features/governance-cross-coherence-audit/01-break.md`
  - Model: `docs/_edb-development-history/features/governance-cross-coherence-audit/02-model.md`
  - Analyze:
    - `docs/_edb-development-history/features/governance-cross-coherence-audit/03-analyze.md`
    - `docs/_edb-development-history/features/governance-cross-coherence-audit/03-analyze-full.md`

---

## 1) Scope

### Goal (must be delivered)
- Execute a consolidation-only coherence pass over governance documents to reduce drift-risk duplication and reinforce explicit ownership boundaries.
- Harmonize wording and section-layout presentation where inconsistencies were identified, without changing normative meaning.
- Replace duplicated normative statements in contextual artifacts with link-to-owner references where applicable.
- Preserve and explicitly respect confirmed single-source-of-truth ownership mappings.

### Non-Goals (explicitly out of scope)
- No introduction of new workflow categories.
- No introduction of new governance domains.
- No enforcement logic or tooling changes.
- No semantic reinterpretation of existing requirements.
- No architectural changes.

### Constraints
- Tech:
  - Documentation changes only.
  - Routing and policy authorities remain unchanged (`CODEX_ENTRY.md`, `CODEX_WORKFLOW_POLICY.md`).
- Perf:
  - Not applicable (no runtime behavior changes).
- UX:
  - Improve clarity and reduce interpretation risk while preserving existing behavior.
- Backward compatibility:
  - Existing governance baseline semantics at v1.12.6 must remain intact.
- Security/Privacy (if relevant):
  - No changes to security/privacy obligations; only wording/layout consolidation.

---

## 2) Implementation Rules (Codex Contract)

### Allowed
- Implement only what is listed in this Deliver Spec.
- Refactor only where required to complete the consolidation tasks.
- Add short clarifying link-to-owner references in contextual/template artifacts.

### Not Allowed
- Do not add new features.
- Do not broaden scope beyond this document.
- Do not change public APIs unless explicitly stated below.
- Do not invent missing requirements or defaults.
- Do not modify enforcement mechanisms.
- Do not reinterpret `Minor Change (workflow)` / `BMAD Feature` semantics.
- Do not reinterpret `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR` semantics.

### If Information Is Missing
- Stop implementation.
- Write missing items into `questions.md` (same feature folder).
- Propose 1–2 options in `03-analyze.md` (or reference it) and wait for decision.

---

## 3) Target Files / Folders
List exact paths. No placeholders.

- `docs/bmad/guides/CODEX_ENTRY.md`
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
- `docs/bmad/guides/BMAD_DECISION_MATRIX.md`
- `docs/bmad/guides/BMAD_COMMIT_CONVENTIONS.md`
- `docs/engineering/guides/PR_HELPER_GUIDE.md`
- `docs/entry/ORCHESTRATION_INDEX.md`
- `docs/entry/chat-handover-protocol.md`
- `docs/entry/LLM-bmad-briefing.md`
- `docs/engineering/templates/chat-handover-protocol.template.md`
- `docs/bmad/templates/LLM-bmad-briefing.template.md`
- `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md`
- `docs/_edb-development-history/EDB_CHAT_HANDOVER_PROTOCOL.md`
- Additional Engineering scope guides may be edited if (and only if) drift-risk duplication or layout inconsistency was explicitly identified in 03-analyze-full.md.

---

## 4) Public API (if any)
Describe final API as it should exist after implementation.

### Exports / Signatures
- Not applicable (documentation-only consolidation).

### Inputs / Outputs
- Input:
  - Existing governance documents and ownership mappings from analyze artifacts.
- Output:
  - Consolidated wording/layout with preserved semantics and explicit owner-link references.

### Error behavior
- If a proposed edit would alter semantics, introduce enforcement, or create new governance domains, stop and route to `questions.md`.

---

## 5) Data Model / State (if any)
- Entities:
  - `DocumentProfile` classification results (authority/contextual/template/history).
  - Duplication classes (`harmless`, `drift-risk`, `authority-risk`).
  - Ownership mapping (`topic -> source-of-truth owner`).
- Persistence (if any):
  - Stored in updated governance docs and EDB history sync files.
- Invariants (must always hold):
  - `CODEX_WORKFLOW_POLICY.md` remains normative behavior authority.
  - `CODEX_ENTRY.md` remains routing authority.
  - Contextual/template artifacts remain non-authoritative.
  - No semantic expansion beyond baseline obligations.
- Edge cases:
  - Historical wording/path references in EDB history are not treated as active authority conflicts unless routed as live targets.

---

## 6) Implementation Plan (ordered)
Write as a strict sequence. Each step should be checkable.

1. Reconfirm source-of-truth ownership map from `03-analyze.md` and `03-analyze-full.md` before edits.
2. Apply consolidation-only wording harmonization to drift-risk duplicates in contextual artifacts, replacing normative restatements with explicit link-to-owner references.
3. Standardize section-layout presentation patterns across targeted governance docs where structural inconsistency increases interpretation risk, without changing requirement meaning.
4. Reinforce explicit non-authoritative disclaimers in targeted entry/template artifacts where needed.
5. Verify that no authority-role document lost ownership statements and no contextual/template document gained normative ownership semantics.
6. Synchronize EDB governance artifacts for this consolidation change according to EDB Mode routing (minor log + handover tag context).

---

## 7) Tests / Validation
Specify how correctness is verified.

### Must-have checks
- Confirm no new governance domains, workflow categories, or enforcement semantics were introduced.
- Confirm all edited contextual/template docs use link-to-owner references for normative topics.
- Confirm authoritative ownership statements remain in owning docs.
- Run mode-aware governance doctor with planned tag context for this change.

### Optional checks
- Perform targeted lexical scan for `MUST/SHOULD/required` in edited contextual docs to ensure wording remains non-authoritative unless intentionally referenced.
- Manual reviewer check for section-layout consistency across edited guides.

---

## 8) Acceptance Criteria (Definition of Done)
Must be objective and testable.

- [ ] Consolidation edits are strictly derived from `03-analyze.md` and `03-analyze-full.md` findings.
- [ ] Drift-risk duplication is reduced through explicit link-to-owner references without semantic changes.
- [ ] Ownership map remains stable and no authority conflicts are introduced.
- [ ] No new governance domains, workflow categories, or enforcement changes are introduced.
- [ ] EDB-mode governance sync artifacts are updated for the final implementation change.

---

## 9) Rollback / Safety (if relevant)
- Feature flags:
  - Not applicable.
- Migration steps:
  - Not applicable (documentation-only).
- Revert steps:
  - Revert affected documentation files and restore previous log/handover state if any semantic drift is detected during review.
