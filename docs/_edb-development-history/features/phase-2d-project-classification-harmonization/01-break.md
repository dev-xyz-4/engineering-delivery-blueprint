# Break — phase-2d-project-classification-harmonization

## 1) Problem Statement (one paragraph)
Project Classification was classified as `Clean` at domain level in Phase-2A with respect to authority ownership; however, cross-domain duplication of taxonomy fragments remains a Phase-2 harmonization target. Without a bounded Phase-2D model, classification logic can drift into non-owner guides/templates and indirectly reintroduce authority ambiguity. This break defines a documentation-only scope to evaluate Project Classification as the single taxonomy source and to classify copied classification logic as either valid reference-only usage or duplication.

## 2) Goal
- Define the Phase-2D boundary model for Project Classification as single taxonomy source.
- Detect and classify replicated classification logic across engineering guides/templates.
- Distinguish reference-only classification usage from taxonomy duplication.
- Confirm that classification references do not introduce versioning/workflow authority leakage.
- Define evidence targets for follow-up model/analyze phases.

## 3) Non-Goals
- No governance model redesign.
- No new workflow categories.
- No new governance domains.
- No SemVer model change.
- No implementation or refactor execution.
- No repository structure changes.
- No orchestrator construction.

## 4) Users / Actors (if any)
- EDB governance maintainers
- Engineering documentation maintainers
- Release/versioning/workflow guide maintainers relying on taxonomy references

## 5) Inputs / Outputs
### Inputs
- Phase-1 Core Governance Kernel Contract (single normative owner per rule-topic; invariants I1-I7)
- Phase-2A Lifecycle x Repository Gap Analysis (Project Classification = `Clean`; cross-domain duplication remains a target)
- `docs/engineering/guides/PROJECT_CLASSIFICATION.md` (taxonomy owner candidate)
- Engineering guides/templates that reference project types (e.g., release/versioning/security/testing/performance/observability artifacts)

### Outputs
- Scoped Phase-2D break artifact for taxonomy harmonization analysis.
- Boundary framing for single-source taxonomy ownership.
- Evidence-target list for detecting classification duplication vs reference-only usage.

## 6) Constraints
- Technical:
  - Documentation-only phase; no implementation code.
  - No edits to governance documents in this step.
  - No repository structure changes.
- Performance:
  - Not applicable.
- UX:
  - Preserve readability and current operational intent of affected documentation.
- Compatibility:
  - Preserve Phase-1 invariants and single-owner authority model.
- Legal/Compliance (if relevant):
  - Not applicable.
- Namespace clarifier:
  - Workflow classification uses `Minor Change (workflow)` / `BMAD Feature`.
  - Version classification uses `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.
- Explicit version decision (documentation-only break stage):
  - `no SemVer change`

## 7) Unknowns / Open Questions
- No blocking unknowns identified at break stage.
- Unknowns discovered in later phases must be appended to:
  - `docs/_edb-development-history/features/phase-2d-project-classification-harmonization/questions.md`

## 8) Success Criteria (high level)
- Project Classification single-source boundary is explicitly defined.
- Evidence targets for duplication detection are explicitly enumerated.
- Reference-only vs duplication classification logic is clearly scoped for analysis.
- No cross-domain authority leakage (workflow/versioning) is assumed or introduced by this break.
- Scope remains documentation-only without structural expansion.

## 9) Evidence Targets (for later analysis)
- Primary taxonomy owner candidate:
  - `docs/engineering/guides/PROJECT_CLASSIFICATION.md`
- Candidate duplication surfaces:
  - Engineering guides containing project-type matrices/lists
  - Templates embedding project-type taxonomies beyond reference-only framing
  - Boundary sections that restate taxonomy as local authoritative source instead of reference-only delegation to `PROJECT_CLASSIFICATION.md`
- Leakage checks:
  - Classification statements that imply SemVer authority ownership
  - Classification statements that imply workflow-policy ownership

## 10) Stop Condition
- If this break implies:
  - new workflow categories,
  - new governance areas/domains,
  - authority-owner relocation,
  - lifecycle redesign,
  - or SemVer model changes,
  stop and request clarification before proceeding.
