# Break — core-governance-kernel-refactor

## 1) Problem Statement (one paragraph)
- Phase 1 conceptual stabilization is complete (`core-governance-kernel-stabilization/04-deliver.md`), but the repository still contains operational authority violations: routing documents create normative rules, logs contain active governance definitions, templates embed governance obligations, and versioning ownership remains dual (`versioning.md` vs `VERSIONING_GUIDE.md`). This feature is the execution track that applies the already-approved Phase-1 contract without redesigning domains, lifecycle phases, or orchestrator architecture.

## 2) Goal
- Implement the approved Phase-1 governance contract operationally by:
  - enforcing Workflow Governance single normative source at `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
  - enforcing Versioning Governance single normative source at `docs/engineering/versioning.md`
  - converting log artifacts to historical-only content
  - converting routing artifacts to delegation-only behavior by removing rule-creation language and replacing it with reference-only links to normative owners.
  - neutralizing templates to structural/reference-only behavior
- Ensure non-owner artifacts become reference-only for owned rule-topics.
- Record explicit version decision for this execution feature.

## 3) Non-Goals
- No new governance domains.
- No SemVer model changes.
- No system orchestrator redesign or construction.
- No Phase-2 harmonization (Branch/Release/Project Classification).
- No repository restructuring beyond authority/wording refactors needed for Phase 1 contract enforcement.
- No re-modeling of the conceptual contract.

## 4) Users / Actors (if any)
- EDB governance maintainers executing Phase-1 contract enforcement.
- Codex sessions requiring deterministic authority boundaries and single-source behavior.
- Reviewers validating authority-layer compliance in governance documents.

## 5) Inputs / Outputs
### Inputs
- `docs/_edb-development-history/features/core-governance-kernel-stabilization/04-deliver.md`
- `docs/_edb-development-history/features/core-governance-kernel-stabilization/closure-note.md`
- `.planning/Entw-System-Orchestrator/1_EDB_Authority_Model_v0.1.md`
- `.planning/Entw-System-Orchestrator/2_EDB_Authority_Model_Validation_v0.1.md`
- `.planning/Entw-System-Orchestrator/3_EDB_Authority_Consolidation_Strategy_v0.1.md`
- `.planning/Entw-System-Orchestrator/4_EDB_Governance_Domain_Mapping_v0.1.md`
- `.planning/Entw-System-Orchestrator/5_EDB_Governance_Lifecycle_Model_v0.1.md`
- `.planning/Entw-System-Orchestrator/7_EDB_Authority_Consolidation_Roadmap_v0.1.md`
- `.planning/Entw-System-Orchestrator/8_EDB_Authority_Consolidation_FollowUp_v0.1.md`
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
- `docs/engineering/versioning.md`
- Hotspot set:
  - `docs/bmad/guides/CODEX_ENTRY.md`
  - `docs/bmad/guides/BMAD_DECISION_MATRIX.md`
  - `docs/bmad/notes/minor-change-log.md`
  - `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md`
  - `docs/bmad/templates/deliver.template.md`
  - `docs/bmad/templates/minor-change.prompt.md`
  - `docs/bmad/templates/feature-implementation.prompt.md`
  - `docs/bmad/templates/minor-change-log.template.md`
  - `docs/engineering/guides/VERSIONING_GUIDE.md`

### Outputs
- Execution-focused break scope for applying Phase-1 authority contract.
- Clear operational target categories:
  - Log entnormification targets
  - Routing de-normification targets
  - Template neutralization targets
  - Versioning single-owner operational resolution target
- Explicit SemVer decision for this feature:
  - SemVer Decision: `SemVer PATCH`
  - Rationale:
    - The feature enforces existing governance contract semantics and removes duplication/leakage.
    - No new domain semantics, no lifecycle expansion, and no SemVer model changes are introduced.
  - Planned tag: `v1.12.9` (subject to final review outcome)

## 6) Constraints
- Technical:
  - Refactor scope is limited to authority/wording enforcement against Phase-1 contract.
  - Non-owner artifacts must become reference-only for owned rule-topics.
- Performance:
  - Not applicable.
- UX:
  - Preserve readability and onboarding flow while removing normative leakage.
- Compatibility:
  - Preserve behavior outside targeted authority refactor scope.
  - Keep workflow classification and version classification namespace-separated.
- Legal/Compliance (if relevant):
  - Maintain existing compliance semantics; no model expansion.
- Terminology/namespace constraints:
  - Workflow classification: `Minor Change (workflow)` / `BMAD Feature`
  - Version classification: `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`

## 7) Unknowns / Open Questions
- No blocking unknowns identified at break stage.
- If enforcing Phase-1 contract requires any of the following, stop and request clarification before proceeding:
  - Branch/Release/Classifications harmonization
  - System orchestrator design work
  - governance-domain expansion beyond declared Phase-1 owners
- Any unknowns discovered in later phases must be appended to:
  - `docs/bmad/features/core-governance-kernel-refactor/questions.md`

## 8) Success Criteria (high level)
- Workflow Governance is operationally single-source-owned by `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`.
- Versioning Governance is operationally single-source-owned by `docs/engineering/versioning.md`.
- Target logs no longer contain active normative governance definitions.
- Target routing documents no longer create rules and only delegate/reference normative owners.
- Target templates no longer embed governance obligations and remain structural/reference-only.
- Non-owner documents reference owned rule-topics without redefining them.
- No scope expansion into Phase-2 domains or orchestrator design.
