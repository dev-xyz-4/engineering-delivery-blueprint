# Analyze — governance-cross-coherence-audit

## 1) Options Considered
### Option A: Guide-only coherence audit
- Summary:
  - Evaluate BMAD and Engineering guides only; treat Entry and EDB-history as out-of-scope context.
- Pros:
  - Fast execution and low analysis surface.
  - Minimal ambiguity in authority classification for core governance rules.
- Cons:
  - Misses cross-layer duplication and authority bleed between guides and entry artifacts.
  - Cannot validate single source-of-truth behavior end-to-end.
- Risks:
  - False confidence due to partial coverage.
- Complexity:
  - Low.

### Option B: Cross-layer DocumentProfile audit (BMAD + Engineering + Entry + EDB-history)
- Summary:
  - Instantiate `DocumentProfile` across representative authority/context/history artifacts and classify duplication, normative-token consistency, and ownership conflicts.
- Pros:
  - Matches break scope and model scope.
  - Detects cross-layer drift-risk and authority-risk patterns.
  - Supports relocation-candidate identification (analysis-only).
- Cons:
  - Higher analysis effort than guide-only scan.
  - Requires careful handling of historical references to avoid false positives.
- Risks:
  - Over-reading contextual wording as normative if role tags are not applied consistently.
- Complexity:
  - Medium.

### Option C (optional): Full repository-wide lexical scan
- Summary:
  - Token scan (`MUST/SHOULD/required`) across all docs with minimal role modeling.
- Pros:
  - Broad and mechanically repeatable.
- Cons:
  - High false-positive rate.
  - Does not map rule ownership or duplication intent reliably.
- Risks:
  - Can trigger semantic reinterpretation pressure outside consolidation-only scope.
- Complexity:
  - Medium.

---

## 2) Decision
- Chosen option:
  - Option B: Cross-layer DocumentProfile audit.
- Rationale (short):
  - It is the only option that satisfies the break/model contract: cross-coherence, ownership conflict detection, duplication categorization, and relocation criteria without semantic expansion.
- Assumptions (explicit):
  - `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md` remains normative behavior authority.
  - `docs/bmad/guides/CODEX_ENTRY.md` remains routing authority.
  - Entry and template artifacts are contextual/scaffold and non-authoritative.
  - EDB history artifacts are traceability records and not active policy owners.
- Out-of-scope impacts:
  - No workflow changes, no new governance domains, no file moves, no policy rewrites.

### DocumentProfile instantiation (analysis snapshot)
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
  - layer: BMAD
  - role: authority
  - ownership_target: Codex behavior rules
  - duplication class notes: baseline owner; any mirrored normative rule elsewhere is authority-risk.
- `docs/bmad/guides/CODEX_ENTRY.md`
  - layer: BMAD
  - role: authority (routing), contextual helper references allowed
  - ownership_target: routing chain and mode-aware target mapping
  - duplication class notes: overlapping startup text in entry docs should remain reference-based (drift-risk if duplicated).
- `docs/engineering/guides/VERSIONING_GUIDE.md`
  - layer: Engineering
  - role: authority (versioning governance)
  - ownership_target: SemVer interpretation in governance layer
  - duplication class notes: external restatements should be links, not duplicated rule text.
- `docs/engineering/guides/PR_HELPER_GUIDE.md`
  - layer: Engineering
  - role: contextual/operational guide (tool usage + guardrail explanation)
  - ownership_target: helper usage semantics only; not global policy owner
  - duplication class notes: acceptable operational overlap with routing docs when explicitly linked.
- `docs/entry/ORCHESTRATION_INDEX.md`
  - layer: Entry
  - role: contextual
  - ownership_target: startup map only
  - duplication class notes: harmless repetition when clearly non-normative; authority-risk if normative language is introduced.
- `docs/entry/chat-handover-protocol.md`
  - layer: Entry
  - role: contextual/state snapshot
  - ownership_target: continuity context, not rule ownership
  - duplication class notes: drift-risk if governance rules are restated instead of linked.
- `docs/entry/LLM-bmad-briefing.md`
  - layer: Entry
  - role: contextual/bootstrap
  - ownership_target: session setup context
  - duplication class notes: drift-risk if expanded into policy narration.
- `docs/engineering/templates/chat-handover-protocol.template.md`
  - layer: Engineering
  - role: template
  - ownership_target: scaffold only
  - duplication class notes: expected near-duplication with entry counterpart; harmless if copy-discipline note is preserved.
- `docs/bmad/templates/LLM-bmad-briefing.template.md`
  - layer: BMAD
  - role: template
  - ownership_target: scaffold only
  - duplication class notes: expected near-duplication with entry counterpart; harmless if non-authoritative note remains.
- `docs/_edb-development-history/EDB_CHAT_HANDOVER_PROTOCOL.md`
  - layer: EDB-History
  - role: history
  - ownership_target: blueprint traceability snapshot
  - duplication class notes: historical wording should not be treated as active ownership conflict unless routed as live authority.
- `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md`
  - layer: EDB-History
  - role: history
  - ownership_target: change traceability
  - duplication class notes: old paths/terms are historical facts, not active drift by default.

### Duplication / conflict classification (analysis snapshot)
- Harmless repetition:
  - Entry docs and template counterparts with explicit non-authoritative copy discipline.
- Drift-risk duplication:
  - Startup/context instructions repeated between Entry docs and operational guides where links would suffice.
- Authority-risk duplication:
  - Any normative behavior rule outside `CODEX_WORKFLOW_POLICY.md` if phrased as owning requirement.

### Normative-token consistency snapshot
- Severity low:
  - Current terminology separation is mostly explicit (`Minor Change (workflow)` vs `SemVer ...`).
- Severity medium (potential):
  - `required`/`must` in contextual docs can be interpreted as ownership if not explicitly linked back to authority sources.

### Single source-of-truth conflict snapshot
- No confirmed hard conflict identified in current baseline snapshot.
- Primary watchpoint remains accidental normative restatement in contextual entry artifacts.

### Relocation-candidate snapshot (analysis-only)
- No high-confidence relocation candidate identified in this step.
- Candidate threshold remains: obvious folder-role mismatch plus zero semantic impact.

---

## 3) Risk Register (minimal)
- Risk:
  - Contextual documents drift into normative voice over time.
  - Likelihood:
    - Medium
  - Impact:
    - Medium
  - Mitigation:
    - Keep explicit non-authoritative notes and link-to-owner pattern.

- Risk:
  - Historical path references are misclassified as active inconsistencies.
  - Likelihood:
    - Medium
  - Impact:
    - Low
  - Mitigation:
    - Treat EDB-history as immutable trace layer unless referenced as live authority.

- Risk:
  - Consolidation work is interpreted as governance expansion.
  - Likelihood:
    - Low
  - Impact:
    - High
  - Mitigation:
    - Preserve consolidation-only boundary; prohibit new domains/categories in this track.

---

## 4) Rejected Approaches (if any)
- Approach:
  - Option A (Guide-only audit)
  - Why rejected:
    - Insufficient for cross-layer ownership and duplication analysis required by break/model scope.

- Approach:
  - Option C (lexical-only full scan)
  - Why rejected:
    - High false positives and weak ownership mapping; risks semantic reinterpretation outside scope.
