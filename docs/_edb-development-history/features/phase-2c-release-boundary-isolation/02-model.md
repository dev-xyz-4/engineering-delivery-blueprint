# Model — phase-2c-release-boundary-isolation

## 1) System Overview (2–5 bullets)
- This model defines a deterministic Release-domain authority-boundary evaluation relative to Versioning Governance.
- Scope is limited to semantic inspection of `docs/engineering/guides/RELEASE_GUIDE.md` relative to the single SemVer owner (`docs/engineering/versioning.md`) and any versioning-adjacent references (including informational guides).
- The model formalizes detection for normative overlap, ownership duplication, implicit rule creation, and versioning leakage.
- Findings are classified deterministically as `Clean`, `Minor Drift`, or `Structural Drift`.
- Phase-1 authority invariants (single normative owner per rule-topic; I1-I7) are fixed constraints and must remain unchanged.

## 2) Key Concepts / Terms
- `ReleaseDomainArtifact`:
  - Release lifecycle-operational document under evaluation (`RELEASE_GUIDE.md`).
- `VersioningOwner`:
  - Sole normative source for versioning rule-topics: `docs/engineering/versioning.md`.
- `NormativeOverlap`:
  - Release wording that defines or redefines SemVer rule-topics already owned by `VersioningOwner`.
- `OwnershipDuplication`:
  - Effective dual-owner semantics, explicit or implicit, across Release and Versioning documents.
- `ImplicitRuleCreation`:
  - Enforcement semantics created without explicit MUST/SHOULD tokens (e.g., definitive matrices, exclusive local rules).
- `VersioningLeakage`:
  - Non-owner Release text asserting version meaning/obligation instead of reference-only delegation.

## 3) Data Structures
- Name: `ReleaseEvidenceEntry`
  - Fields:
    - `evidence_id` (string)
    - `artifact_path` (path)
    - `section_anchor` (string)
    - `observed_statement` (string)
    - `semantic_class` (enum: ReferenceOnly, OperationalGuidance, Overlap, Duplication, ImplicitRule, Leakage)
    - `owner_topic` (string)
    - `owner_reference` (path or `N/A`)
    - `rule_hits` (string[])
  - Meaning:
    - Atomic semantic observation record used to justify classification.
  - Invariants:
    - `artifact_path` must primarily reference `docs/engineering/guides/RELEASE_GUIDE.md`; secondary cross-reference checks may include linked artifacts where versioning ownership is asserted.
    - `owner_reference` for versioning-topic findings is `docs/engineering/versioning.md` or `N/A`.

- Name: `ReleaseBoundaryAssessment`
  - Fields:
    - `overlap_count` (int)
    - `duplication_count` (int)
    - `implicit_rule_creation_count` (int)
    - `versioning_leakage_count` (int)
    - `release_domain_status` (enum: Clean, MinorDrift, StructuralDrift)
  - Meaning:
    - Deterministic domain-level status for Release boundary integrity.
  - Invariants:
    - `Clean` requires all counts = 0.
    - `StructuralDrift` if duplication is systemic or rule-topic ownership is effectively split.

- Name: `BoundaryConstraintSet`
  - Fields:
    - `phase1_invariants_locked` (bool)
    - `owner_relocation_allowed` (bool)
    - `semver_model_change_allowed` (bool)
    - `new_domain_creation_allowed` (bool)
  - Meaning:
    - Hard guardrails for this model phase.
  - Invariants:
    - Must resolve to: `true`, `false`, `false`, `false` respectively.

## 4) State Machine (if applicable)
### States
- `S0: ScopeBound`
- `S1: StatementEnumerated`
- `S2: RulesApplied`
- `S3: DriftQuantified`
- `S4: BoundaryValidated`

### Transitions
- `ScopeBound -> StatementEnumerated`: target artifact confirmed and evidence extraction begins.
- `StatementEnumerated -> RulesApplied`: each statement receives semantic classification and rule-hit mapping.
- `RulesApplied -> DriftQuantified`: counters are aggregated into `ReleaseBoundaryAssessment`.
- `DriftQuantified -> BoundaryValidated`: final status assigned (`Clean`/`MinorDrift`/`StructuralDrift`) under fixed constraints.

## 5) Algorithms / Rules (if applicable)
- Rule: `NormativeOverlapDetectionRule`
  - Inputs:
    - release-domain statement
    - versioning owner topics (`docs/engineering/versioning.md`)
  - Output:
    - hit/no-hit + evidence annotation
  - Notes:
    - Hit when Release text locally defines SemVer rule-topic content owned elsewhere.

- Rule: `OwnershipDuplicationDetectionRule`
  - Inputs:
    - set of overlap hits
    - ownership claims in Release wording
  - Output:
    - duplication hit/no-hit + severity hint
  - Notes:
    - Effective dual-owner semantics count as duplication even without explicit authority labels.

- Rule: `ImplicitRuleCreationDetectionRule`
  - Inputs:
    - release statement semantics
  - Output:
    - hit/no-hit
  - Notes:
    - Detects non-token enforcement patterns (definitive rule matrices, exclusive local mandates).

- Rule: `VersioningLeakageDetectionRule`
  - Inputs:
    - statement about tags/versions/releases
    - owner-reference presence
  - Output:
    - leakage hit/no-hit
  - Notes:
    - No hit when statement is operational/reference-only and delegates semantics to `docs/engineering/versioning.md`.

- Rule: `ReleaseDriftClassificationRule`
  - Inputs:
    - `overlap_count`
    - `duplication_count`
    - `implicit_rule_creation_count`
    - `versioning_leakage_count`
  - Output:
    - `Clean` | `MinorDrift` | `StructuralDrift`
  - Notes:
    - `Clean`: all counts = 0.
    - `MinorDrift`: localized non-systemic hits, no effective owner split.
    - `StructuralDrift`: repeated/systemic owner duplication or persistent rule-topic redefinition in Release domain.
    - StructuralDrift additionally applies if Release documentation asserts versioning authority location that conflicts with the declared single normative owner (`docs/engineering/versioning.md`), even if only in Governance Boundary sections.

- Rule: `BoundaryGuardRule`
  - Inputs:
    - candidate model statement set
    - `BoundaryConstraintSet`
  - Output:
    - pass/fail
  - Notes:
    - Fail if model implies owner relocation, SemVer model modification, new governance domains, or lifecycle redesign.

## 6) Failure Modes / Edge Cases
- Release wording appears informational but semantically functions as binding rule ownership.
- SemVer references are present without explicit owner delegation, causing hidden leakage.
- Mixed sections combine operational release sequencing and normative version definitions.
- Classification ambiguity arises from historic examples phrased as implicit mandates.
- Model text accidentally introduces structural implications beyond Phase-2C scope.

## 7) Observability (optional)
- Logs:
  - Evidence captured as `ReleaseEvidenceEntry` records in Analyze phase artifact.
- Metrics:
  - `overlap_count`
  - `duplication_count`
  - `implicit_rule_creation_count`
  - `versioning_leakage_count`
  - `release_domain_status`

## 8) Fixed Constraints and Version Decision
- Fixed constraints:
  - Preserve Phase-1 invariants I1-I7.
  - Prohibit owner relocation.
  - Prohibit SemVer model modification.
  - Prohibit new governance domains.
  - Prohibit repository structure changes.
- Namespace clarifier:
  - Workflow classification uses `Minor Change (workflow)` / `BMAD Feature`.
  - Version classification uses `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.
- Explicit version decision (documentation-only model stage):
  - `no SemVer change`

## 9) Unknowns / Open Questions
- No blocking unknowns identified at model stage.
- If unknowns emerge during semantic analysis, append to:
  - `docs/_edb-development-history/features/phase-2c-release-boundary-isolation/questions.md`

## 10) Stop Condition
- If model application implies:
  - new workflow categories,
  - new governance areas/domains,
  - authority-owner relocation,
  - lifecycle redesign,
  - or SemVer semantics/model changes,
  stop and request clarification before proceeding.
