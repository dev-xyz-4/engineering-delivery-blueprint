# Analyze — governance-cross-coherence-audit (full)

## 1) Options Considered
### Option A: Layer-isolated analysis
- Summary:
  - Analyze each layer (BMAD, Engineering, Entry, Templates, EDB-history) independently.
- Pros:
  - Simple execution and low interpretation overhead.
- Cons:
  - Misses cross-layer ownership bleed and duplication paths.
  - Cannot validate single-source-of-truth chain end-to-end.
- Risks:
  - Under-reporting of authority-risk duplication.
- Complexity:
  - Low.

### Option B: Full cross-layer DocumentProfile analysis
- Summary:
  - Build a complete DocumentProfile set for all in-scope governance artifacts and classify duplication, normative-token usage, ownership conflicts, and relocation candidates.
- Pros:
  - Matches break/model contract exactly.
  - Detects both local and cross-layer inconsistencies.
  - Supports clear split: snapshot observations vs systemic patterns vs historical edge cases.
- Cons:
  - Higher analysis effort and larger artifact catalog.
- Risks:
  - Historical wording may be misread as live authority unless explicitly separated.
- Complexity:
  - Medium.

### Option C (optional): Token-only full scan
- Summary:
  - Evaluate coherence only via lexical scan (`MUST/SHOULD/required/must/should`).
- Pros:
  - Fast and repeatable.
- Cons:
  - High false-positive rate for contextual prose and templates.
  - Weak ownership mapping.
- Risks:
  - Can imply semantic reinterpretation beyond consolidation-only scope.
- Complexity:
  - Medium.

---

## 2) Decision
- Chosen option:
  - Option B: Full cross-layer DocumentProfile analysis.
- Rationale (short):
  - It is the only option that satisfies all requested outputs: complete profile set, duplication classes, normative-pattern classification, ownership mapping, conflict detection, and relocation criteria.
- Assumptions (explicit):
  - Baseline semantics remain fixed at v1.12.6.
  - `CODEX_WORKFLOW_POLICY.md` remains normative behavior authority.
  - `CODEX_ENTRY.md` remains routing authority.
  - Entry documents are contextual surfaces, templates are scaffolds, EDB-history is traceability.
  - This phase is analysis-only with `no SemVer change`.
- Out-of-scope impacts:
  - No policy edits, no structural moves, no enforcement changes, no new governance domains.

### Full DocumentProfile set (in-scope)

#### BMAD guides
- `docs/bmad/guides/BMAD_COMMIT_CONVENTIONS.md` | layer: BMAD | role: authority (commit discipline) | relocation_candidate: no
- `docs/bmad/guides/BMAD_DECISION_MATRIX.md` | layer: BMAD | role: authority (classification) | relocation_candidate: no
- `docs/bmad/guides/BMAD_ENFORCEMENT_ROADMAP.md` | layer: BMAD | role: contextual-governance roadmap | relocation_candidate: no
- `docs/bmad/guides/BMAD_SETUP_Lean_Integration.md` | layer: BMAD | role: contextual setup guide | relocation_candidate: no
- `docs/bmad/guides/CODEX_ENTRY.md` | layer: BMAD | role: authority (routing) | relocation_candidate: no
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md` | layer: BMAD | role: authority (behavior policy) | relocation_candidate: no
- `docs/bmad/guides/TS_AUDIT_ROUTINE.md` | layer: BMAD | role: contextual audit routine | relocation_candidate: no
- `docs/bmad/guides/_archive/BMAD_integration_core.LEGACY.md` | layer: BMAD | role: historical/archive reference | relocation_candidate: no

#### Engineering guides
- `docs/engineering/guides/BRANCH_WORKFLOW.md` | layer: Engineering | role: authority (branch workflow) | relocation_candidate: no
- `docs/engineering/guides/GOVERNANCE_MODEL.md` | layer: Engineering | role: authority (normative model mapping) | relocation_candidate: no
- `docs/engineering/guides/OBSERVABILITY_SCOPE_GUIDE.md` | layer: Engineering | role: authority (scope governance) | relocation_candidate: no
- `docs/engineering/guides/PERFORMANCE_GUIDE.md` | layer: Engineering | role: authority (scope governance) | relocation_candidate: no
- `docs/engineering/guides/PROJECT_CLASSIFICATION.md` | layer: Engineering | role: authority (taxonomy) | relocation_candidate: no
- `docs/engineering/guides/PR_HELPER_GUIDE.md` | layer: Engineering | role: contextual operational guide | relocation_candidate: no
- `docs/engineering/guides/RELEASE_GUIDE.md` | layer: Engineering | role: authority (release governance) | relocation_candidate: no
- `docs/engineering/guides/SECURITY_SCOPE_GUIDE.md` | layer: Engineering | role: authority (scope governance) | relocation_candidate: no
- `docs/engineering/guides/TESTING_SCOPE_GUIDE.md` | layer: Engineering | role: authority (scope governance) | relocation_candidate: no
- `docs/engineering/guides/VERSIONING_GUIDE.md` | layer: Engineering | role: authority (versioning governance) | relocation_candidate: no

#### Entry docs
- `docs/entry/LLM-bmad-briefing.md` | layer: Entry | role: contextual bootstrap | relocation_candidate: no
- `docs/entry/ORCHESTRATION_INDEX.md` | layer: Entry | role: contextual startup map | relocation_candidate: no
- `docs/entry/chat-handover-protocol.md` | layer: Entry | role: contextual state snapshot | relocation_candidate: no

#### Governance-relevant BMAD templates
- `docs/bmad/templates/LLM-bmad-briefing.template.md` | layer: BMAD | role: template scaffold | relocation_candidate: no
- `docs/bmad/templates/analyze.template.md` | layer: BMAD | role: template scaffold | relocation_candidate: no
- `docs/bmad/templates/break.template.md` | layer: BMAD | role: template scaffold | relocation_candidate: no
- `docs/bmad/templates/deliver.template.md` | layer: BMAD | role: template scaffold | relocation_candidate: no
- `docs/bmad/templates/documentation-only.prompt.md` | layer: BMAD | role: prompt scaffold | relocation_candidate: no
- `docs/bmad/templates/feature-implementation.prompt.md` | layer: BMAD | role: prompt scaffold | relocation_candidate: no
- `docs/bmad/templates/minor-change-log.template.md` | layer: BMAD | role: template scaffold | relocation_candidate: no
- `docs/bmad/templates/minor-change.prompt.md` | layer: BMAD | role: prompt scaffold | relocation_candidate: no
- `docs/bmad/templates/model.template.md` | layer: BMAD | role: template scaffold | relocation_candidate: no
- `docs/bmad/templates/ts-errors.template.md` | layer: BMAD | role: template scaffold | relocation_candidate: no

#### Governance-relevant Engineering templates
- `docs/engineering/templates/adr.template.md` | layer: Engineering | role: template scaffold | relocation_candidate: no
- `docs/engineering/templates/chat-handover-protocol.template.md` | layer: Engineering | role: template scaffold | relocation_candidate: no
- `docs/engineering/templates/engineering-baseline.template.md` | layer: Engineering | role: template scaffold | relocation_candidate: no
- `docs/engineering/templates/release.template.md` | layer: Engineering | role: template scaffold (placeholder) | relocation_candidate: no
- `docs/engineering/templates/security.template.md` | layer: Engineering | role: template scaffold | relocation_candidate: no
- `docs/engineering/templates/testing-strategy.template.md` | layer: Engineering | role: template scaffold | relocation_candidate: no

#### EDB self-history docs
- `docs/_edb-development-history/ADR-0001-identity.md` | layer: EDB-History | role: history/decision record | relocation_candidate: no
- `docs/_edb-development-history/ADR-0002-orchestration-entrypoint-architecture.md` | layer: EDB-History | role: history/decision record | relocation_candidate: no
- `docs/_edb-development-history/EDB_CHAT_HANDOVER_PROTOCOL.md` | layer: EDB-History | role: history state snapshot | relocation_candidate: no
- `docs/_edb-development-history/EDB_ENGINEERING_BASELINE.md` | layer: EDB-History | role: history baseline declaration | relocation_candidate: no
- `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md` | layer: EDB-History | role: history trace log | relocation_candidate: no
- `docs/_edb-development-history/features/governance-cross-coherence-audit/01-break.md` | layer: EDB-History | role: feature history artifact | relocation_candidate: no
- `docs/_edb-development-history/features/governance-cross-coherence-audit/02-model.md` | layer: EDB-History | role: feature history artifact | relocation_candidate: no
- `docs/_edb-development-history/features/governance-cross-coherence-audit/03-analyze.md` | layer: EDB-History | role: feature history artifact | relocation_candidate: no
- `docs/_edb-development-history/features/orchestration-entrypoint-clarity/01-break.md` | layer: EDB-History | role: feature history artifact | relocation_candidate: no
- `docs/_edb-development-history/features/orchestration-entrypoint-clarity/02-model.md` | layer: EDB-History | role: feature history artifact | relocation_candidate: no
- `docs/_edb-development-history/features/orchestration-entrypoint-clarity/03-analyze.md` | layer: EDB-History | role: feature history artifact | relocation_candidate: no
- `docs/_edb-development-history/features/orchestration-entrypoint-clarity/04-deliver.md` | layer: EDB-History | role: feature history artifact | relocation_candidate: no

### Duplication classification (full-scope)
- Harmless duplication:
  - Entry/template pairs explicitly marked non-authoritative with copy discipline:
    - `docs/entry/LLM-bmad-briefing.md` <-> `docs/bmad/templates/LLM-bmad-briefing.template.md`
    - `docs/entry/chat-handover-protocol.md` <-> `docs/engineering/templates/chat-handover-protocol.template.md`
  - Template/process phrasing reused across prompt templates (`*.prompt.md`) by design.
- Drift-risk duplication:
  - Repeated operational guidance between `CODEX_ENTRY.md`, `PR_HELPER_GUIDE.md`, and entry docs where links can diverge over time.
  - Repeated mode-context wording across EDB history snapshots and live entry/context docs.
- Authority-risk duplication:
  - No confirmed hard authority-risk duplication in current baseline snapshot.
  - Potential risk condition remains: contextual docs using imperative wording without explicit owner links.

### Normative-token usage classification (full-scope)
- Confirmed systemic pattern:
  - Authority guides use explicit normative vocabulary (`MUST/SHOULD`) consistently in scope matrices and governance boundaries.
  - `CODEX_WORKFLOW_POLICY.md` and `CODEX_ENTRY.md` retain clear imperative routing/policy language appropriate to role.
- Snapshot observation:
  - Contextual docs use some lowercase `should/must` in explanatory prose; currently bounded by non-authoritative disclaimers.
- Edge-case/historical artifact:
  - EDB history files contain older wording/path references; these are trace records and not active authority conflicts.

### Single source-of-truth ownership map (topic -> owner)
- Codex behavior rules -> `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
- Routing entry and mode-aware write targets -> `docs/bmad/guides/CODEX_ENTRY.md`
- Workflow classification logic -> `docs/bmad/guides/BMAD_DECISION_MATRIX.md`
- Commit/branch process conventions -> `docs/bmad/guides/BMAD_COMMIT_CONVENTIONS.md` + `docs/engineering/guides/BRANCH_WORKFLOW.md`
- Version semantics (SemVer governance) -> `docs/engineering/guides/VERSIONING_GUIDE.md`
- Release governance -> `docs/engineering/guides/RELEASE_GUIDE.md`
- Security/Testing/Performance/Observability scope governance -> corresponding Engineering scope guides
- Project taxonomy -> `docs/engineering/guides/PROJECT_CLASSIFICATION.md`
- Startup context map (non-normative) -> `docs/entry/ORCHESTRATION_INDEX.md`

### Ownership conflicts
- Confirmed conflicts: none.
- Watchpoints:
  - Contextual restatements in entry/operational docs can drift toward ownership language if owner links are removed.

### Relocation candidates (analysis-only)
- High-confidence candidates: none.
- Medium-confidence candidates: none.
- Low-confidence watchpoint:
  - `docs/bmad/guides/_archive/BMAD_integration_core.LEGACY.md` is legacy by folder label already; current placement is acceptable as historical reference.

### Consolidation-only confirmation
- No new governance domains introduced.
- No new workflow categories introduced.
- No semantic reinterpretation required to explain observed patterns.

### Distinction by evidence class
- Snapshot observations:
  - Minor wording overlap persists across routing/operational/context docs.
  - Normative tokens occur in both authority and contextual artifacts.
- Confirmed systemic patterns:
  - Role separation model is implemented (authority vs contextual vs template vs history).
  - Mode-aware routing with Project Mode default remains consistent.
  - SemVer vs workflow terminology separation is broadly consistent.
- Edge-case/historical artifacts:
  - Historical logs and archived docs preserve older references by design; not treated as active authority defects.

---

## 3) Risk Register (minimal)
- Risk:
  - Drift-risk duplication between operational/context docs and authority docs increases over time.
  - Likelihood:
    - Medium
  - Impact:
    - Medium
  - Mitigation:
    - Keep link-to-owner pattern and non-authoritative disclaimers explicit.

- Risk:
  - Historical wording interpreted as live rule ownership.
  - Likelihood:
    - Medium
  - Impact:
    - Low
  - Mitigation:
    - Continue separating EDB-history from downstream live docs and treat historical rows as trace-only.

- Risk:
  - Future consolidation accidentally changes semantics.
  - Likelihood:
    - Low
  - Impact:
    - High
  - Mitigation:
    - Preserve consolidation-only boundary and require explicit checks against baseline semantics.

---

## 4) Rejected Approaches (if any)
- Approach:
  - Token-only global scan (Option C)
  - Why rejected:
    - Insufficient ownership resolution; high false positives in templates/context/history text.

- Approach:
  - Guide-only analysis (Option A)
  - Why rejected:
    - Misses cross-layer duplication and role-boundary behavior across entry/templates/history.
