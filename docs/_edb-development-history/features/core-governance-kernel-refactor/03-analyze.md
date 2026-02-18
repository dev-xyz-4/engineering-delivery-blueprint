# Analyze — core-governance-kernel-refactor

## 1) Options Considered
### Option A: Targeted hotspot feasibility validation (Phase-1 execution scope only)
- Summary:
  - Validate each hotspot document against the defined TransformationPatterns.
  - Extract concrete normative rule-topic blocks and classify leakage/ownership duplication.
  - Confirm whether Phase-1 execution can complete without Phase-2 dependencies.
- Pros:
  - Direct fit to execution goal and model constraints.
  - Produces actionable readiness signal without migration planning.
  - Preserves namespace and SemVer constraints.
- Cons:
  - Does not resolve broader cross-domain harmonization.
- Risks:
  - Implicit obligations may persist even after explicit normative tokens are removed.
- Complexity:
  - Medium.

### Option B: Full cross-domain harmonization analysis in this phase
- Summary:
  - Include Branch/Release/Project Classification harmonization in execution feasibility.
- Pros:
  - Wider visibility.
- Cons:
  - Violates explicit Phase-1 boundary.
  - Blurs execution objective with Phase-2 concerns.
- Risks:
  - Scope expansion and invalid sequencing.
- Complexity:
  - High.

### Option C (optional): Token-only scan
- Summary:
  - Focus only on explicit MUST/SHOULD/MAY occurrences.
- Pros:
  - Fast and deterministic.
- Cons:
  - Misses hidden normative leakage (implicit obligations).
  - Weak on effective ownership duplication detection.
- Risks:
  - False "safe" classification.
- Complexity:
  - Low.

---

## 2) Decision
- Chosen option:
  - Option A.
- Rationale (short):
  - It is the only option that validates execution feasibility against the existing model while staying strictly within Phase-1 boundaries.
- Assumptions (explicit):
  - Workflow normative owner remains `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`.
  - Versioning normative owner target remains `docs/engineering/versioning.md`.
  - `docs/engineering/guides/VERSIONING_GUIDE.md` can be reduced to informational/reference-only.
  - No SemVer model semantics are changed in this feature.
- Out-of-scope impacts:
  - No orchestrator design.
  - No Branch/Release/Project Classification harmonization.
  - No migration sequencing.

### Concrete Normative Rule-Topic Blocks (Execution Targets)

- Logs:
  - `docs/bmad/notes/minor-change-log.md`
    - `## Purpose`
    - `## What Counts as a Minor Change`
    - `## What Is Not a Minor Change`
    - `## Governance Criteria for Minor Changes`
    - `## Minor Change Workflow`
    - `## Principles`
  - `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md`
    - Same normative block set as above, plus historical entries section retained as chronology.

- Routing documents:
  - `docs/bmad/guides/CODEX_ENTRY.md`
    - `## Mandatory Reading Order` (binding "must read")
    - `## Mode-Aware Routing` (binding "must write to")
    - `## Final Rule` (exclusive authority claim language)
  - `docs/bmad/guides/BMAD_DECISION_MATRIX.md`
    - `## Step 2 — Classification Rules`
    - `## Step 3 — Forbidden Combinations`
    - `## Final Rule`

- Templates:
  - `docs/bmad/templates/deliver.template.md`
    - `## 2) Implementation Rules (Codex Contract)`
  - `docs/bmad/templates/minor-change.prompt.md`
    - `Rules:` block
    - `Validation:` block governance obligations
  - `docs/bmad/templates/feature-implementation.prompt.md`
    - `Rules (strict):` block
  - `docs/bmad/templates/minor-change-log.template.md`
    - Full embedded governance definition/workflow blocks mirroring log policy

- Versioning guide (dual-owner hotspot):
  - `docs/engineering/guides/VERSIONING_GUIDE.md`
    - `## Versioning Requirement Matrix`
    - `## Applicability Rule`
    - `## Requirement Definitions`
    - `## Governance Boundary`  
  - Effective issue:
    - Document declares it does not own project-specific rules, but still contains binding normative rule language and matrix semantics.
  - Removal of effective ownership semantics must include matrix-to-reference transformation, not only textual softening.

### TransformationPattern Feasibility Validation

- `log_entnormify`: feasible for both minor-change logs.
  - Historical chronology blocks can be preserved while rule-defining sections become reference-only.

- `routing_denormify`: feasible for `CODEX_ENTRY.md` and `BMAD_DECISION_MATRIX.md`.
  - Routing/delegation function can remain while rule creation text is replaced by owner references.

- `template_neutralize`: feasible for all four target templates.
  - Structural scaffolding remains intact after removing governance obligations and replacing with owner links.

- `versioning_owner_consolidate`: feasible.
  - `versioning.md` can remain sole normative owner; `VERSIONING_GUIDE.md` can become informational/reference-only without changing SemVer semantics.

### Hidden Normative Leakage (implicit obligations)

- `docs/bmad/guides/CODEX_ENTRY.md`
  - Implicit enforcement via mandatory startup/write-target wording.
- `docs/bmad/guides/BMAD_DECISION_MATRIX.md`
  - Implicit policy ownership through classification/forbidden-combination framing.
- Prompt templates (`minor-change.prompt.md`, `feature-implementation.prompt.md`)
  - Implicit enforcement via "Rules" and "Validation" behavior gates.
- `docs/engineering/guides/VERSIONING_GUIDE.md`
  - Effective normative ownership despite declared boundary note.

### Effective Normative Ownership Duplication

- Workflow rule-topic duplication:
  - Owner: `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
  - Competing effective definitions in routing docs, logs, and templates.

- Versioning rule-topic duplication:
  - Intended owner: `docs/engineering/versioning.md`
  - Competing effective ownership in `docs/engineering/guides/VERSIONING_GUIDE.md`.

### Single-Source Enforcement Feasibility Confirmation

- Workflow: feasible in Phase 1.
- Versioning: feasible in Phase 1.
- Required condition:
  - Non-owner artifacts must be normalized to reference-only for owned rule-topics.

### Phase-1 Boundary Confirmation

- No Phase-2 domain harmonization is required to complete this feature’s Phase-1 execution objective.
- No SemVer model changes are required.
- `SemVer PATCH` remains valid for this execution feature.

### Hotspot Execution List (ordered by risk)

1. `docs/engineering/guides/VERSIONING_GUIDE.md`
Reason: direct effective dual-owner conflict with `docs/engineering/versioning.md`.
2. `docs/bmad/guides/CODEX_ENTRY.md`
Reason: high-impact routing entrypoint with rule-creation leakage.
3. `docs/bmad/guides/BMAD_DECISION_MATRIX.md`
Reason: routing artifact with embedded workflow policy decisions.
4. `docs/bmad/notes/minor-change-log.md`
Reason: log contains active workflow governance definitions.
5. `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md`
Reason: same log contamination pattern plus historical payload sensitivity.
6. `docs/bmad/templates/minor-change.prompt.md`
Reason: strong embedded governance obligations and lifecycle checks.
7. `docs/bmad/templates/feature-implementation.prompt.md`
Reason: strong embedded governance obligations and mixed scope rules.
8. `docs/bmad/templates/minor-change-log.template.md`
Reason: template-level policy duplication.
9. `docs/bmad/templates/deliver.template.md`
Reason: embedded Codex contract language in structural scaffold.

### Critical blockers (if any)

- Blocker B1:
  - Versioning dual-owner conflict (`versioning.md` vs `VERSIONING_GUIDE.md`) remains unresolved.

### Medium risks

- Risk M1:
  - Hidden normative leakage persists after token-only cleanup.
- Risk M2:
  - Reference-only replacements accidentally alter onboarding clarity in routing docs.
- Risk M3:
  - Template neutralization may leave partial obligation phrasing in validation blocks.

### Safe-to-execute segments

- Segment S1:
  - Log sections that are clearly governance-definition blocks can be converted to owner references while preserving chronology tables.
- Segment S2:
  - Routing documents’ mandatory rule statements can be replaced with delegation/reference wording without removing routing flow.
- Segment S3:
  - Template "Rules" sections can be reduced to structural instructions plus owner references.
- Segment S4:
  - `VERSIONING_GUIDE.md` boundary and requirement sections can be rewritten to informational/reference-only framing while preserving explanatory value.

Stop-condition check:
- Phase-2 domains and orchestrator construction are not required to complete the Phase-1 execution objective described above.

---

## 3) Risk Register (minimal)
- Risk:
  - Effective ownership duplication remains after partial edits.
  - Likelihood:
    - Medium
  - Impact:
    - High
  - Mitigation:
    - Enforce topic-level owner checks for workflow/versioning after each target document update.

- Risk:
  - Implicit obligations survive through phrasing not using explicit MUST/SHOULD/MAY.
  - Likelihood:
    - High
  - Impact:
    - Medium
  - Mitigation:
    - Perform semantic pass for obligation verbs and enforcement language, not token-only scan.

- Risk:
  - Namespace conflation reappears in prompt/template wording.
  - Likelihood:
    - Medium
  - Impact:
    - Medium
  - Mitigation:
    - Keep explicit namespace clarifier in non-owner docs as reference text only.

---

## 4) Rejected Approaches (if any)
- Approach:
  - Expand this analysis into migration sequencing.
  - Why rejected:
    - Explicitly disallowed in this phase.

- Approach:
  - Resolve Branch/Release/Classification harmonization in this feature analyze.
  - Why rejected:
    - Phase-2 scope; out-of-scope for current execution objective.

- Approach:
  - Include orchestrator construction dependencies in feasibility criteria.
  - Why rejected:
    - Orchestrator design is explicitly excluded from this phase.
