# ADR-0002 — Orchestration Entrypoint Architecture

---

## ADR Header

- ADR ID: `adr-0002`
  - ADR IDs MUST be sequential and immutable once assigned.
- Title: `orchestration-entrypoint-architecture`
- Date: `2026-02-17`
- Status: `Accepted`
  - If superseded, reference the ADR ID that replaces it.
- Owners/Authors (optional): `EDB maintainers`

---

## Context

The repository had entry/onboarding artifacts distributed across BMAD guides, engineering handover, and briefing notes. Although routing and policy authorities existed, the orchestration map was implicit and therefore easier to misinterpret. The result was elevated risk of ambiguity between authoritative routing/policy docs and contextual state/briefing docs, especially under dual mode operation (Project Mode vs EDB Mode).

---

## Decision

Adopt the hybrid orchestration model selected in Phase 2A:
- Entry is treated as a role layered on guide artifacts, not as a separate normative policy domain.
- `docs/bmad/guides/CODEX_ENTRY.md` remains routing authority.
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md` remains the singular normative policy authority.
- A canonical orchestration startup map is introduced at `docs/entry/ORCHESTRATION_INDEX.md` to make authority boundaries and startup sequence explicit.
- The orchestration index is non-normative and must never override policy authority.

---

## Decision Drivers

- Deterministic routing and policy chain clarity.
- Lower migration risk than a full structural governance-domain split.
- Explicit mode safety (Project Mode vs EDB Mode) without changing policy authority.
- Improved onboarding/readability for both humans and LLM agents.

---

## Considered Options

- Option A: Keep current placement and clarify contracts in-place only.
- Option B: Introduce a dedicated entry/orchestration folder as a strict new category.
- Option C: Hybrid model (entry role layered on guides + explicit orchestration index).

---

## Pros/Cons (Per Option)

### Option A: In-place clarification only
- Pros:
  - Minimal immediate disruption.
  - No structural migration work.
- Cons:
  - Weak structural signaling; ambiguity can return.
  - Higher long-term drift risk.

### Option B: Dedicated orchestration category
- Pros:
  - Strongest structural clarity.
  - Clear physical separation.
- Cons:
  - Highest migration and reference-sync complexity.
  - Higher enforcement and transition risk.

### Option C: Hybrid model (selected)
- Pros:
  - Improves startup clarity with moderate change surface.
  - Preserves existing authority chain while adding canonical orchestration map.
- Cons:
  - Requires disciplined boundary wording to avoid role/category confusion.

---

## Consequences (Positive/Negative)

### Positive consequences
- Canonical startup map now exists in a single location.
- Authority boundaries are explicit: routing vs policy vs state vs templates.
- Mode safety expectations are documented in one orchestration reference.

### Negative consequences
- Introduces an additional document that must remain synchronized with entry/policy artifacts.
- Requires review discipline to prevent index/policy drift.

---

## Risks & Mitigations

| Risk | Impact | Mitigation | Owner |
|---|---|---|---|
| Orchestration index drifts from routing/policy reality | high | Require cross-reference checks in governance PR reviews | EDB maintainers |
| Mode-boundary assumptions become implicit again | high | Keep mode-specific target paths explicitly documented in index and entry docs | EDB maintainers |
| Duplicate authority statements across docs | medium | Preserve policy authority in one source and keep index non-normative | EDB maintainers |

---

## Validation / How To Verify

- Verify `CODEX_ENTRY.md` remains routing authority and still routes to `CODEX_WORKFLOW_POLICY.md`.
- Verify `CODEX_WORKFLOW_POLICY.md` remains singular normative policy source.
- Verify `docs/entry/ORCHESTRATION_INDEX.md` exists and documents authoritative vs contextual artifacts without policy duplication.
- Verify mode-target paths remain unambiguous for Project Mode and EDB Mode.

Validation checklist (example):
- [x] Orchestration index exists at `docs/entry/ORCHESTRATION_INDEX.md`
- [x] Routing -> policy chain remains deterministic
- [x] Authority boundary model is explicitly documented

---

## Rollback Plan (If Applicable)

Rollback trigger:
- If index content introduces routing ambiguity or conflicts with policy authority.

Rollback steps:
1. Revert orchestration index and related cross-reference updates.
2. Restore previous documentation state.
3. Re-open analysis in feature artifacts and adjust boundary model before reimplementation.

Owner:
- EDB maintainers.

---

## References / Links

- Related BMAD artifact(s):
  - `docs/_edb-development-history/features/orchestration-entrypoint-clarity/01-break.md`
  - `docs/_edb-development-history/features/orchestration-entrypoint-clarity/02-model.md`
  - `docs/_edb-development-history/features/orchestration-entrypoint-clarity/03-analyze.md`
  - `docs/_edb-development-history/features/orchestration-entrypoint-clarity/04-deliver.md`
- PR(s): `#<PR>`
- Issue(s): `N/A`
- External docs/specs: `N/A`

---

## Notes

- This ADR records the implemented hybrid orchestration architecture.
- Policy authority remains unchanged and singular.
