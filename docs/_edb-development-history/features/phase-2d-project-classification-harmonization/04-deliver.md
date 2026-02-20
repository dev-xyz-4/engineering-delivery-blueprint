# Deliver Spec — phase-2d-project-classification-harmonization

## 0) Status
- Owner: EDB governance maintainers
- Created: 2026-02-20
- Last updated: 2026-02-20
- Related docs:
  - Break: `docs/_edb-development-history/features/phase-2d-project-classification-harmonization/01-break.md`
  - Model: `docs/_edb-development-history/features/phase-2d-project-classification-harmonization/02-model.md`
  - Analyze: `docs/_edb-development-history/features/phase-2d-project-classification-harmonization/03-analyze.md`

---

## 1) Scope

### Goal (target outcome)
- Consolidate deterministic `ClassificationBoundaryAssessment` for Phase-2D.
- Explicitly separate:
  - true taxonomy duplication
  - owner assertion outside owner
  - reference ambiguity (non-structural)
- Confirm `classification_domain_status = StructuralDrift`.
- Provide non-executing recommendation framing for Phase-2D execution.

### Non-Goals (explicitly out of scope)
- No refactor execution.
- No governance model redesign.
- No owner relocation.
- No workflow/SemVer authority change.
- No new governance domains.
- No lifecycle redesign.
- No repository structure changes.

### Constraints
- Tech:
  - Documentation-only deliver artifact.
  - No edits to governance documents in this step.
- Perf:
  - Not applicable.
- UX:
  - Preserve documentation readability and operational intent.
- Backward compatibility:
  - Preserve Phase-1 invariants I1-I7 and single-owner authority model.
- Security/Privacy (if relevant):
  - Not applicable.

---

## 2) Implementation Notes (Reference)

This deliver consolidates diagnostic outcomes and execution framing only.  
No implementation actions are executed by this artifact.

For implementation behavior, stop behavior, and execution gates, see:
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`

For versioning and SemVer ownership, see:
- `docs/engineering/versioning.md`

In-scope implementation notes:
- Consolidate analyze findings into deterministic drift counters.
- Preserve explicit taxonomy-owner contract:
  - `docs/engineering/guides/PROJECT_CLASSIFICATION.md`

Out-of-scope notes:
- No statement rewrites in guides/templates in this step.
- No owner transfer between documents.

Missing-information handling notes (reference `questions.md`):
- If future execution implies owner relocation, new governance domains, workflow/SemVer authority changes, or lifecycle redesign, stop and append to:
  - `docs/_edb-development-history/features/phase-2d-project-classification-harmonization/questions.md`

Namespace reminder:
- Workflow classification: `Minor Change (workflow)` / `BMAD Feature`
- Version classification: `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`

Explicit version decision:
- `no SemVer change`

---

## 3) Target Files / Folders
List exact paths. No placeholders.

- `docs/_edb-development-history/features/phase-2d-project-classification-harmonization/01-break.md`
- `docs/_edb-development-history/features/phase-2d-project-classification-harmonization/02-model.md`
- `docs/_edb-development-history/features/phase-2d-project-classification-harmonization/03-analyze.md`
- `docs/_edb-development-history/features/phase-2d-project-classification-harmonization/04-deliver.md`
- `docs/engineering/guides/PROJECT_CLASSIFICATION.md`
- Analysis surfaces (inspection-only; no modification in this stage):
  - docs/engineering/guides/RELEASE_GUIDE.md
  - docs/engineering/guides/PERFORMANCE_GUIDE.md
  - docs/engineering/guides/OBSERVABILITY_SCOPE_GUIDE.md
  - docs/engineering/guides/SECURITY_SCOPE_GUIDE.md
  - docs/engineering/guides/TESTING_SCOPE_GUIDE.md
  - docs/engineering/guides/VERSIONING_GUIDE.md
  - docs/engineering/templates/security.template.md
  - docs/engineering/templates/testing-strategy.template.md

---

## 4) Public API (if any)
Describe final API as it should exist after implementation.

### Exports / Signatures
- No code/API surface.

### Inputs / Outputs
- Inputs:
  - Taxonomy owner document: `docs/engineering/guides/PROJECT_CLASSIFICATION.md`
  - Referencing guides/templates listed in section 3
  - Rule set from `02-model.md`
- Outputs:
  - Deterministic `ClassificationBoundaryAssessment`
  - Separated evidence buckets (duplication / owner assertion / ambiguity)
  - Non-executing recommendation framing for next phase

### Error behavior
- If consolidation implies prohibited structural changes (owner relocation/new domains/authority changes/lifecycle redesign), stop and request clarification.

---

## 5) Data Model / State (if any)
- Entities:
  - `ClassificationEvidenceEntry`
  - `ClassificationBoundaryAssessment`
  - `BoundaryConstraintSet`
- Persistence (if any):
  - Markdown analysis/deliver artifacts only.
- Invariants (target-state constraints):
  - Single taxonomy owner remains `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.
  - Phase-1 invariants I1-I7 remain unchanged.
  - No SemVer/workflow authority transfer via classification domain.
- Edge cases:
  - Informational lists without authority claims are ambiguity, not structural duplication.

---

## 6) Implementation Plan (ordered)
Write as an ordered sequence. Each step should be checkable.

1. Consolidate all classification-reference artifacts from analysis.
2. Assign each finding to exactly one bucket:
   - taxonomy duplication
   - owner assertion outside owner
   - reference ambiguity
3. Aggregate deterministic counters.
4. Confirm final domain status.
5. Validate `BoundaryGuardRule`.
6. Record non-executing Phase-2D recommendation framing.

---

## 7) Tests / Validation
Specify how correctness is verified.

### Must-have checks
- Deterministic counters are explicitly declared:
  - `duplication_count = 5`
  - `owner_assertion_count = 3`
  - `reference_ambiguity_count = 3`
  - `cross_domain_leakage_count = 0`
- `classification_domain_status = StructuralDrift` is explicitly declared.
- Evidence separation is explicit:
  - duplication artifacts listed
  - owner-assertion artifacts listed
  - ambiguity artifacts listed
- `BoundaryGuardRule` is explicitly `Pass`.
- Explicit no-change confirmations exist for owner relocation, governance-domain expansion, workflow/SemVer authority, and lifecycle redesign.

### Optional checks
- Cross-check taxonomy owner contract wording in:
  - `docs/engineering/guides/PROJECT_CLASSIFICATION.md`

---

## 8) Acceptance Criteria (Definition of Done)
Must be objective and testable.

- [ ] `ClassificationBoundaryAssessment` is consolidated deterministically.
- [ ] Duplication, owner assertion, and ambiguity are explicitly separated.
- [ ] `classification_domain_status = StructuralDrift` is confirmed.
- [ ] `BoundaryGuardRule` pass is confirmed with no prohibited implications.
- [ ] Structured non-executing recommendation framing for Phase-2D execution is present.
- [ ] Explicit version decision `no SemVer change` is documented.

---

## 9) Rollback / Safety (if relevant)
- Feature flags:
  - Not applicable.
- Migration steps:
  - Not applicable.
- Revert steps:
  - Revert this deliver artifact if superseded by corrected analysis contract.

---

## Deliver Summary

### Deterministic ClassificationBoundaryAssessment
- `duplication_count = 5`
- `owner_assertion_count = 3`
- `reference_ambiguity_count = 3`
- `cross_domain_leakage_count = 0`
- `classification_domain_status = StructuralDrift`
StructuralDrift is triggered by:
- Non-owner duplication across multiple guides.
- Explicit owner-assertion wording outside `PROJECT_CLASSIFICATION.md`.
Ambiguity findings alone would not trigger StructuralDrift.

### Separated Finding Classes
- True taxonomy duplication:
  - `docs/engineering/guides/RELEASE_GUIDE.md`
  - `docs/engineering/guides/PERFORMANCE_GUIDE.md`
  - `docs/engineering/guides/OBSERVABILITY_SCOPE_GUIDE.md`
  - `docs/engineering/guides/SECURITY_SCOPE_GUIDE.md`
  - `docs/engineering/guides/TESTING_SCOPE_GUIDE.md`
- Owner assertion outside owner:
  - `docs/engineering/guides/RELEASE_GUIDE.md`
  - `docs/engineering/guides/PERFORMANCE_GUIDE.md`
  - `docs/engineering/guides/OBSERVABILITY_SCOPE_GUIDE.md`
- Reference ambiguity (non-structural):
  - `docs/engineering/guides/VERSIONING_GUIDE.md`
  - `docs/engineering/templates/security.template.md`
  - `docs/engineering/templates/testing-strategy.template.md`

### Phase-2D Recommendation Framing (Non-Executing)
- Restrict taxonomy ownership and canonical type-definition authority to `PROJECT_CLASSIFICATION.md`.
- Convert duplicated local taxonomy sections in non-owner guides to reference-only usage.
- Remove owner-assertion wording from non-owner guides.
- Keep templates lightweight with owner-linked reference patterns instead of embedded taxonomy authorities.

### Explicit Scope Confirmations
- No owner relocation.
- No new governance domains.
- No workflow/SemVer authority changes.
- No lifecycle redesign.
- No repository structure changes.

### Unknowns
- No blocking unknowns identified in this deliver step.
- If unknowns emerge later, append to:
  - `docs/_edb-development-history/features/phase-2d-project-classification-harmonization/questions.md`
