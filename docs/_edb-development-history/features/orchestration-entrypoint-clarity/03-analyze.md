# Analyze — orchestration-entrypoint-clarity

## 1) Options Considered
### Option A: Keep current placement, clarify contracts in-place
- Summary:
  - Keep existing artifact locations and introduce explicit contract language only (routing authority vs policy authority vs contextual/state artifacts), without any structural relocation.
- Pros:
  - Lowest disruption to existing references and onboarding habits.
  - No immediate tooling coupling changes needed (pr-helper/CODEX routing remains stable).
  - Fastest path to reduce ambiguity if wording discipline is enforced consistently.
- Cons:
  - Structural ambiguity risk remains because placement signals are still mixed.
  - Requires sustained documentation discipline across multiple files to stay coherent.
  - Misplacement candidates (for example template-like notes artifacts) remain physically unresolved.
- Risks:
  - Clarity improvements may regress over time without structural cues.
  - Future contributors may reintroduce overlap because folder semantics remain implicit.
- Complexity:
  - Low

### Option B: Introduce dedicated entry/orchestration hub category
- Summary:
  - Define an explicit entry/orchestration hub (category and location) that centralizes startup/navigation artifacts, while policy and history/template assets remain in their respective domains.
- Pros:
  - Strongest navigation clarity for humans and LLMs through a canonical entry hub.
  - Reduces role confusion between entrypoint, policy, and context artifacts.
  - Improves long-term maintainability by making orchestration intent visible in structure.
- Cons:
  - Higher migration complexity (path changes, references, mode-aware routing implications).
  - Requires strict transition design to avoid breaking downstream assumptions.
  - Could duplicate information if boundaries are not tightly specified.
- Risks:
  - Incorrect migration sequencing may create temporary routing inconsistency.
  - Enforcement/doc tooling could drift if not synchronized with new category semantics.
- Complexity:
  - High

### Option C (optional): Hybrid model (entry role layered on guides + explicit orchestration index)
- Summary:
  - Keep entry authority layered on guide artifacts (no new hard category), but add one explicit orchestration index that maps authority boundaries, mode behavior, and startup sequence.
- Pros:
  - Balances clarity gains with lower structural disruption than a full new category.
  - Preserves current authority chain (CODEX_ENTRY -> CODEX_WORKFLOW_POLICY) while clarifying artifact roles.
  - Supports incremental refinement and phased rollout.
- Cons:
  - Hybrid semantics can be misunderstood if category vs role distinction is not explicit.
  - Some placement ambiguity may persist compared to a strict hub model.
  - Requires clear invariant language to prevent index becoming another overlapping artifact.
- Risks:
  - Ambiguous ownership of the orchestration index may cause stale mapping.
  - Partial adoption can yield mixed old/new interpretation patterns.
- Complexity:
  - Medium

---

## 2) Decision
- Chosen option:
  - Option C (optional): Hybrid model (entry role layered on guides + explicit orchestration index).
- Rationale (short):
  - It addresses the central ambiguity (authority and mode boundaries) with materially lower transition risk than a full structural hub migration.
  - It preserves existing normative authority while enabling a canonical orchestration narrative across governance dimensions.
  - It keeps implementation flexibility for later phases if stronger structural separation is still needed.
  - Comparative tradeoff matrix:

| Option | Clarity | Duplication Risk | Enforcement Complexity | Mode Safety |
|---|---|---|---|---|
| A: In-place clarification | Medium | High | Low | Medium |
| B: Dedicated hub category | High | Medium | High | High |
| C: Hybrid layered model | High | Medium | Medium | High |

  - Entry category evaluation:
    - Entry as distinct artifact category: strongest structural signaling, but highest migration/enforcement overhead.
    - Entry as role layered on Guide artifacts: lower disruption, compatible with current authority chain, but needs strict boundary text to avoid drift.
    - Hybrid conclusion: treat Entry primarily as a role (layered on Guide artifacts) plus one explicit orchestration index as the canonical map.

  - Boundary model (explicit):
    - Routing authority:
      - Determines where execution/routing decisions point next (for example CODEX_ENTRY).
    - Policy authority:
      - Normative behavior source (for example CODEX_WORKFLOW_POLICY).
    - State snapshot artifacts:
      - Time/version/context transfer documents (for example chat handover, baseline state).
    - Reusable templates:
      - Non-state scaffolds intended for downstream instantiation.

  - Governance impact assessment:
    - pr-helper:
      - No immediate logic changes in this phase; future changes, if any, must preserve mode-aware path enforcement and avoid hardcoded cross-layer assumptions.
    - Routing:
      - CODEX_ENTRY remains the canonical routing entry; orchestration index would document mapping, not replace policy authority.
    - Mode enforcement:
      - Project vs EDB boundaries remain explicit; any future structural step must prove non-regression of mode-targeted writes.
- Assumptions (explicit):
  - Current routing and policy chain is functionally stable and should not be disrupted during analysis phases.
  - Most ambiguity is caused by boundary signaling and artifact-role overlap, not by missing core governance rules.
  - Incremental clarification can be validated before any relocation decision.
- Out-of-scope impacts:
  - No file moves, no renames, and no enforcement/tooling changes are decided here.
  - No ADR creation in this phase.
  - No updates to existing governance docs in this step.

---

## 3) Risk Register (minimal)
- Risk:
  - Hybrid model ambiguity persists if role/category language is not enforced consistently.
  - Likelihood:
    - Medium
  - Impact:
    - High
  - Mitigation:
    - Define explicit invariant wording and ownership for orchestration index maintenance in later phases.

- Risk:
  - Cross-layer bleed (EDB Mode vs Project Mode) during future rollout.
  - Likelihood:
    - Medium
  - Impact:
    - High
  - Mitigation:
    - Keep mode-aware routing references canonical and validate mode-specific target mapping before any structural change.

- Risk:
  - Misplacement candidates remain unresolved too long, causing recurring confusion.
  - Likelihood:
    - Medium
  - Impact:
    - Medium
  - Mitigation:
    - Carry candidate list into next phase with explicit decision gate and acceptance checks.

---

## 4) Rejected Approaches (if any)
- Approach:
  - Immediate full relocation to a new entry folder/category in this phase.
  - Why rejected:
    - Violates analysis-only scope and introduces premature implementation decisions.

- Approach:
  - Keep current structure without any formal boundary model.
  - Why rejected:
    - Does not adequately address the identified authority/mode ambiguity and leaves cross-layer tension unresolved.
