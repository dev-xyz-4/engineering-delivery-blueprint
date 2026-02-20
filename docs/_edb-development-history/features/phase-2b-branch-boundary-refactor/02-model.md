# Model — phase-2b-branch-boundary-refactor

## 1) System Overview (2–5 bullets)
- This model defines a deterministic wording-level transformation for Branch-domain owner-violation removal.
- It transforms one identified `OwnerViolation` pattern into a `ReferenceOnly` delegation pattern while preserving operational tagging guidance.
- It enforces no semantic expansion, no structural section additions, and no new governance obligations.
- Post-transform evaluation requires Branch domain classification `Clean` under Phase-2B rules.
- Explicit SemVer decision for this execution feature: `SemVer PATCH`.

## 2) Key Concepts / Terms
- Current Wording Pattern (`OwnerViolation`):
  - Branch-domain statement that asserts authoritative version meaning.
- Target Wording Pattern (`ReferenceOnly delegation`):
  - Branch-domain statement that keeps operational context and delegates version semantics to `docs/engineering/versioning.md`.
- Operational Tagging Guidance:
  - Procedural tagging/branch/PR flow wording without SemVer ownership claims.
- Transformation Unit:
  - A section-scoped statement replacement within an existing section.
- Post-Transform Clean State:
  - No owner-violation phrasing, no implicit rule creation, no versioning leakage.

## 3) Data Structures
- Name: `TransformationTarget`
  - Fields:
    - `artifact_path` (path)
    - `section_anchor` (string)
    - `current_pattern` (string)
    - `target_pattern_intent` (string)
  - Meaning:
    - Defines exact statement-level transformation scope.
  - Invariants:
    - `artifact_path` is restricted to `docs/engineering/guides/BRANCH_WORKFLOW.md`.
    - Section scope is unchanged.

- Name: `PatternClassificationRecord`
  - Fields:
    - `statement` (string)
    - `semantic_class` (enum: OperationalGuidance, ReferenceOnly, OwnerViolation)
    - `owner_reference` (path or `N/A`)
  - Meaning:
    - Captures pre/post semantic class of transformed statement.
  - Invariants:
    - Post-transform semantic class for target statement must not be `OwnerViolation`.

- Name: `PostTransformAssessment`
  - Fields:
    - `owner_violation_count` (int)
    - `implicit_rule_creation_count` (int)
    - `versioning_leakage_count` (int)
    - `branch_status` (enum: Clean, MinorDrift, StructuralDrift)
  - Meaning:
    - Deterministic acceptance state after wording transformation.
  - Invariants:
    - `branch_status = Clean` requires all counts equal `0`.

## 4) State Machine (if applicable)
### States
- S0: `TargetIdentified`
- S1: `PatternMapped`
- S2: `ConstraintChecked`
- S3: `ReferenceOnlyDraftable`
- S4: `PostTransformEvaluable`
- S5: `CleanStateDeterminable`

### Transitions
- `TargetIdentified` -> `PatternMapped`: evidence-backed current pattern is bound.
- `PatternMapped` -> `ConstraintChecked`: transformation constraints are validated.
- `ConstraintChecked` -> `ReferenceOnlyDraftable`: replacement intent is semantically valid.
- `ReferenceOnlyDraftable` -> `PostTransformEvaluable`: post-transform checks are defined.
- `PostTransformEvaluable` -> `CleanStateDeterminable`: clean/minor/structural outcome is determinable.

## 5) Algorithms / Rules (if applicable)
- Rule: `OwnerViolationToReferenceOnlyTransformRule`
  - Inputs:
    - `TransformationTarget.current_pattern`
    - normative owner path (`docs/engineering/versioning.md`)
  - Output:
    - `target_pattern_intent` with delegation semantics
  - Notes:
    - Must keep operational context and remove authoritative version meaning assertion.

- Rule: `NoSemanticExpansionConstraint`
  - Inputs:
    - pre/post wording intent
  - Output:
    - pass/fail
  - Notes:
    - Post wording must not introduce new SemVer definitions, new obligations, or new scope.
    - Post wording must not introduce new cross-domain references outside the existing versioning owner path.

- Rule: `NoStructuralSectionChangeConstraint`
  - Inputs:
    - section structure map
  - Output:
    - pass/fail
  - Notes:
    - No new section headings or structural blocks are added.

- Rule: `NoNewGovernanceObligationConstraint`
  - Inputs:
    - post-transform statement set
  - Output:
    - pass/fail
  - Notes:
    - Replacement wording must not add governance obligations outside existing owner model.

- Rule: `PostTransformBranchCleanRule`
  - Inputs:
    - `PostTransformAssessment`
  - Output:
    - `Clean` / non-clean
  - Notes:
    - Clean requires:
      - `owner_violation_count = 0`
      - `implicit_rule_creation_count = 0`
      - `versioning_leakage_count = 0`

## 6) Failure Modes / Edge Cases
- Replacement removes owner-violation but accidentally introduces ambiguous implicit ownership language.
- Replacement introduces an additional obligation phrase not present before.
- Replacement preserves operational utility but omits necessary owner delegation where version meaning is implied.
- Transformation proposal implies owner relocation or governance redesign (out-of-scope trigger).
- Replacement introduces new lifecycle-phase framing language
  not present in original Branch artifact.

## 7) Observability (optional)
- Logs:
  - Not applicable (documentation-only modeling).
- Metrics:
  - `target_statement_count`
  - `owner_violation_count_post`
  - `implicit_rule_creation_count_post`
  - `versioning_leakage_count_post`
  - `branch_clean_state`

## 8) Deterministic Transformation Mapping
- Current wording pattern (`OwnerViolation`):
  - Artifact: `docs/engineering/guides/BRANCH_WORKFLOW.md`
  - Section: `## Non-Negotiables`
  - Statement: `Treat tags as authoritative version markers.`

- Target wording pattern (`ReferenceOnly delegation` intent):
  - Preserve operational tagging guidance (tag usage remains procedural).
  - Remove authoritative version-meaning assertion from Branch domain.
  - Delegate version meaning to `docs/engineering/versioning.md`.
  - Replacement must explicitly reference `docs/engineering/versioning.md` when version meaning or tag authority is implied.

## 9) Fixed Constraints (Phase-1 Invariants)
- Normative versioning owner remains unchanged:
  - `docs/engineering/versioning.md`
- No governance model redesign.
- No owner relocation.
- No new governance domains.
- No SemVer model semantics changes.
- No repository structure changes.
- Namespace clarifier remains explicit:
  - Workflow classification uses `Minor Change (workflow)` / `BMAD Feature`.
  - Version classification uses `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.

## 10) Unknowns / Open Questions
- None identified in this model stage.
- If unknowns arise during analysis/execution planning, append to:
  - `docs/_edb-development-history/features/phase-2b-branch-boundary-refactor/questions.md`
