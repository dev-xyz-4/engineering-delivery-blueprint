# Model — phase-2d-project-classification-harmonization

## 1) System Overview (2–5 bullets)
- This model defines deterministic detection of Project Classification taxonomy duplication versus valid reference-only usage.
- It formalizes `docs/engineering/guides/PROJECT_CLASSIFICATION.md` as the single normative taxonomy owner for project-type definitions.
- It classifies findings as `Clean`, `Minor Drift`, or `Structural Drift` based on explicit semantic rules.
- It preserves Phase-1 authority invariants I1-I7 and forbids owner relocation or SemVer/workflow authority changes.
- Scope is documentation-only analysis modeling with no implementation execution.

## 2) Key Concepts / Terms
- `TaxonomyOwner`:
  - Canonical project-type owner document: `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.
- `ReferenceOnlyUsage`:
  - Non-owner artifact references taxonomy owner without redefining taxonomy entries, definitions, or authority.
- `TaxonomyDuplication`:
  - Non-owner artifact restates canonical project-type list/definitions as local authoritative content.
- `OwnerAssertionOutsideOwner`:
  - Non-owner artifact claims taxonomy authority or binding ownership for project classification.
- `CrossDomainAuthorityLeakage`:
  - Classification wording that implies versioning authority or workflow-policy authority from taxonomy references.

## 3) Data Structures
- Name: `ClassificationEvidenceEntry`
  - Fields:
    - `evidence_id` (string)
    - `artifact_path` (path)
    - `section_anchor` (string)
    - `observed_statement` (string)
    - `semantic_class` (enum: ReferenceOnly, Duplication, OwnerAssertion, Leakage, AmbiguousReference)
    - `owner_reference` (path or `N/A`)
    - `rule_hits` (string[])
  - Meaning:
    - Atomic evidence record for taxonomy-boundary evaluation.
  - Invariants:
    - `owner_reference` for taxonomy topics is `docs/engineering/guides/PROJECT_CLASSIFICATION.md` or `N/A`.

- Name: `ClassificationBoundaryAssessment`
  - Fields:
    - `duplication_count` (int)
    - `owner_assertion_count` (int)
    - `reference_ambiguity_count` (int)
    - `cross_domain_leakage_count` (int)
    - `classification_domain_status` (enum: Clean, MinorDrift, StructuralDrift)
  - Meaning:
    - Deterministic outcome for Project Classification harmonization status.
  - Invariants:
    - `Clean` requires all counters = 0.
    - `StructuralDrift` if any duplication or owner-assertion exists.

- Name: `BoundaryConstraintSet`
  - Fields:
    - `phase1_invariants_locked` (bool)
    - `owner_relocation_allowed` (bool)
    - `semver_authority_change_allowed` (bool)
    - `workflow_authority_change_allowed` (bool)
    - `new_domain_creation_allowed` (bool)
  - Meaning:
    - Hard constraints for model and downstream analysis.
  - Invariants:
    - Must resolve to: `true`, `false`, `false`, `false`, `false`.

## 4) State Machine (if applicable)
### States
- `S0: OwnerBound`
- `S1: EvidenceEnumerated`
- `S2: RulesApplied`
- `S3: DriftComputed`
- `S4: BoundaryValidated`

### Transitions
- `OwnerBound -> EvidenceEnumerated`: taxonomy owner and candidate artifacts are fixed.
- `EvidenceEnumerated -> RulesApplied`: each evidence statement is evaluated by detection rules.
- `RulesApplied -> DriftComputed`: counters aggregated into `ClassificationBoundaryAssessment`.
- `DriftComputed -> BoundaryValidated`: status assigned under fixed constraints and guard checks.

## 5) Algorithms / Rules (if applicable)
- Rule: `TaxonomyOwnerContractRule`
  - Inputs:
    - taxonomy owner path
    - candidate artifact statements
  - Output:
    - pass/fail + owner-binding map
  - Notes:
    - Only `docs/engineering/guides/PROJECT_CLASSIFICATION.md` may define canonical taxonomy entries/definitions.

- Rule: `ReferenceOnlyUsageRule`
  - Inputs:
    - non-owner classification statement
  - Output:
    - `ReferenceOnly` hit/no-hit
  - Notes:
    - Requires explicit delegation or clear dependency on taxonomy owner without local redefinition.

- Rule: `TaxonomyDuplicationDetectionRule`
  - Inputs:
    - non-owner artifact statement set
    - canonical taxonomy statement set
  - Output:
    - duplication hit/no-hit
  - Notes:
    - Hit on copied/restated project-type lists or definitions functioning as local taxonomy source.

- Rule: `OwnerAssertionOutsideOwnerRule`
  - Inputs:
    - non-owner statement
  - Output:
    - owner-assertion hit/no-hit
  - Notes:
    - Hit if non-owner claims authoritative control over taxonomy.

- Rule: `CrossDomainAuthorityLeakageRule`
  - Inputs:
    - classification statement
    - versioning/workflow owner boundaries
  - Output:
    - leakage hit/no-hit
  - Notes:
    - Hit if taxonomy statements imply SemVer authority (`docs/engineering/versioning.md`) or workflow-policy authority (`docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`) transfer.

- Rule: `DriftClassificationRule`
  - Inputs:
    - `duplication_count`
    - `owner_assertion_count`
    - `reference_ambiguity_count`
    - `cross_domain_leakage_count`
  - Output:
    - `Clean` | `MinorDrift` | `StructuralDrift`
  - Notes:
    - `Clean`:
      - all counters = 0
    - `MinorDrift`:
      - `reference_ambiguity_count > 0` and all other counters = 0
    - `StructuralDrift`:
      - `duplication_count > 0` or `owner_assertion_count > 0`
      - or `cross_domain_leakage_count > 0`
      - - StructuralDrift also applies when taxonomy statements implicitly function as a parallel classification source even without explicit owner-assertion wording.

- Rule: `BoundaryGuardRule`
  - Inputs:
    - candidate model implications
    - `BoundaryConstraintSet`
  - Output:
    - pass/fail
  - Notes:
    - Fail if model implies owner relocation, workflow/SemVer authority change, new domains, or lifecycle redesign.

## 6) Failure Modes / Edge Cases
- Non-owner artifacts paraphrase taxonomy definitions and appear informational but function as local owners.
- References omit owner link and become ambiguous (`Minor Drift`) despite no full duplication.
- Taxonomy references embed hidden versioning/workflow authority language.
- Duplicate taxonomy tables exist in templates and guides with slight wording changes.
- Model wording accidentally implies governance expansion beyond Phase-2D scope.

## 7) Observability (optional)
- Logs:
  - Evidence recorded as `ClassificationEvidenceEntry` in Analyze phase.
- Metrics:
  - `duplication_count`
  - `owner_assertion_count`
  - `reference_ambiguity_count`
  - `cross_domain_leakage_count`
  - `classification_domain_status`

## 8) Fixed Constraints and Version Decision
- Fixed constraints:
  - Preserve Phase-1 invariants I1-I7.
  - Maintain taxonomy single-owner contract on `PROJECT_CLASSIFICATION.md`.
  - Prohibit owner relocation.
  - Prohibit SemVer/workflow authority change through classification domain.
  - Prohibit new governance domains and repository structure changes.
- Namespace clarifier:
  - Workflow classification uses `Minor Change (workflow)` / `BMAD Feature`.
  - Version classification uses `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.
- Explicit version decision (documentation-only model stage):
  - `no SemVer change`

## 9) Unknowns / Open Questions
- No blocking unknowns identified at model stage.
- Any unknowns discovered in analysis must be appended to:
  - `docs/_edb-development-history/features/phase-2d-project-classification-harmonization/questions.md`

## 10) Stop Condition
- If model application implies:
  - new workflow categories,
  - new governance areas/domains,
  - authority-owner relocation,
  - SemVer/workflow authority changes,
  - or lifecycle redesign,
  stop and request clarification before proceeding.
