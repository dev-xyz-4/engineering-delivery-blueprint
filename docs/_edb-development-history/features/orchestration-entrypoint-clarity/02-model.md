# Model — orchestration-entrypoint-clarity

## 1) System Overview (2–5 bullets)
- The orchestration layer currently spans entry routing (`docs/bmad/guides/CODEX_ENTRY.md`), behavioral policy (`docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`), handover state (`docs/_edb-development-history/EDB_CHAT_HANDOVER_PROTOCOL.md`), and briefing/bootstrap artifacts (`docs/bmad/notes/LLM-bmad-briefing-template.md`).
- Routing authority is normative through CODEX_ENTRY -> CODEX_WORKFLOW_POLICY, while contextual startup support is distributed across handover and briefing artifacts.
- Artifact placement mixes reusable governance assets and blueprint self-history, requiring explicit category definitions and folder invariants to avoid cross-layer bleed.
- Project Mode and EDB Mode share workflow semantics but target different canonical document paths, creating a boundary-sensitive orchestration model.
- This model phase documents classification and boundary logic only; it does not select final restructuring actions.

## 2) Key Concepts / Terms
- BMAD Feature: workflow classification for structural/feature work requiring BMAD artifacts.
- Minor Change (workflow): workflow classification for bounded governance/documentation deltas.
- SemVer classification: version namespace (`SemVer PATCH`, `SemVer MINOR`, `SemVer MAJOR`) separate from workflow namespace.
- Entry Artifact: document used to route reading order and operational mode behavior.
- Policy Artifact: normative rule source controlling Codex behavior.
- History Artifact: blueprint self-history document tied to EDB evolution state.
- Template Artifact: reusable scaffold intended for downstream instantiation.
- Guide Artifact: reusable explanatory/normative document defining process or discipline.
- Narrative Artifact: contextual/orientation document with explanatory intent but not primary routing authority.
- Folder Invariant: explicit placement rule describing what artifact categories are allowed in each folder.

## 3) Data Structures
- Name:
  - Fields:
    - `artifact_path`
    - `artifact_category` (`Guide | Template | History | Entry | Policy | Narrative`)
    - `authority_level` (`normative | routing | contextual | informational`)
    - `mode_scope` (`project | edb | both`)
    - `owns_state` (`yes | no`)
    - `placement_expected_folder`
  - Meaning:
    - Canonical descriptor for classifying each orchestration-relevant artifact and validating placement.
  - Invariants:
    - Every orchestration artifact has exactly one primary `artifact_category`.
    - `Policy` artifacts remain normative and must not be downgraded to contextual docs.
    - `History` artifacts may own EDB state but must not be used as downstream live targets.

- Name:
  - Fields:
    - `source_artifact`
    - `target_artifact`
    - `relation_type` (`routes_to | enforces | informs | snapshots | templates`)
    - `mode_condition`
  - Meaning:
    - Directed edge model of orchestration relationships between entry, policy, handover, and briefing artifacts.
  - Invariants:
    - At least one `routes_to` edge must exist from entry artifact to policy authority.
    - `templates` relations must not replace live state artifacts.
    - Mode conditions must be explicit for any edge that changes target path by mode.

- Name:
  - Fields:
    - `folder_path`
    - `allowed_categories`
    - `disallowed_categories`
    - `notes`
  - Meaning:
    - Folder invariant table used to evaluate structural placement consistency.
  - Invariants:
    - `notes/` holds notes/log narratives, not reusable templates.
    - `templates/` holds reusable scaffolds, not live governance state.
    - `guides/` holds reusable guidance/policy explanations.
    - `_edb-development-history/` holds blueprint self-history and EDB-specific feature tracks.

## 4) State Machine (if applicable)
### States
- S0: Unclassified Artifact Set
- S1: Classified Artifact Inventory
- S2: Draft Folder Invariants Defined
- S3: Authority/Mode Mapping Consolidated
- S4: Structural Tensions Documented (Model complete)

### Transitions
- S0 -> S1: inventory and classify orchestration-related docs / all target artifacts mapped to categories.
- S1 -> S2: derive placement expectations / folder invariants drafted without implementing moves.
- S2 -> S3: map routing and authority edges / mode conditions captured for Project vs EDB.
- S3 -> S4: identify unresolved tensions / contradictions recorded without resolution decisions.

## 5) Algorithms / Rules (if applicable)
- Rule:
  - Inputs:
    - Artifact set: `CODEX_ENTRY`, `CODEX_WORKFLOW_POLICY`, `EDB_CHAT_HANDOVER_PROTOCOL`, `LLM-bmad-briefing-template`, selected templates/guides touching orchestration.
  - Output:
    - Current-state artifact map with category, authority level, mode scope, and placement expectation.
  - Notes:
    - Classification is descriptive, not prescriptive in this phase.

- Rule:
  - Inputs:
    - Classified inventory and folder paths.
  - Output:
    - Folder invariant draft for `notes`, `templates`, `guides`, `_edb-development-history`, and entrypoint artifacts.
  - Notes:
    - Invariants express intended boundaries only; no file move decision is produced here.

- Rule:
  - Inputs:
    - Routing and enforcement references across entry/policy/handover/briefing docs.
  - Output:
    - Authority model mapping with explicit mode-boundary touchpoints.
  - Notes:
    - Distinguishes routing authority from contextual startup guidance.

## 6) Failure Modes / Edge Cases
- Artifact classified as both `History` and downstream live `Entry`, causing ambiguous write targets.
- Template and live-state documents drift semantically, producing contradictory startup guidance.
- A notes artifact behaves as a reusable template without explicit reclassification.
- Mode boundary assumptions are implicit, leading to writes in the wrong layer (EDB vs Project).
- Policy references and routing references diverge, resulting in non-deterministic onboarding behavior.

## 7) Observability (optional)
- Logs:
  - Classification decision log per artifact (category, authority level, mode scope).
  - Routing edge log (`routes_to`, `enforces`, `informs`) with source/target references.
  - Invariant check log listing placement matches/mismatches.
- Metrics:
  - `% artifacts with single unambiguous category`.
  - `# of cross-layer ambiguities (history vs live template/state)`.
  - `# of mode-boundary ambiguities detected`.
