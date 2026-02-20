# Model — phase-2c-release-boundary-refactor

## 1) System Overview (2–5 bullets)
- This model defines a minimal wording-level transformation for `docs/engineering/guides/RELEASE_GUIDE.md`, without structural reformatting or section relocation.
- It removes versioning-owner assertions while preserving allowed Release-domain normative scope.
- It enforces single-owner versioning authority in `docs/engineering/versioning.md`.
- It provides deterministic post-refactor validation logic targeting `duplication_count = 0`, `versioning_leakage_count = 0`, and `release_domain_status = Clean`.
- Phase-1 invariants I1-I7 remain fixed and unchanged.

## 2) Key Concepts / Terms
- `AllowedReleaseNormativeScope`:
  - Normative release-operational content that may remain in `RELEASE_GUIDE.md` (release matrix, release-only criteria, release-process constraints).
- `DisallowedVersioningOwnerTopic`:
  - Any statement in `RELEASE_GUIDE.md` that asserts version meaning, SemVer ownership, or authority location outside `docs/engineering/versioning.md`.
- `ReferenceOnlyDelegation`:
  - Wording that points versioning authority to `docs/engineering/versioning.md` without creating local versioning rules.
- `TransformationUnit`:
  - Statement-level replacement/removal on identified violation lines only.
- `PostRefactorCleanState`:
  - Validation outcome where versioning-owner leakage and duplication are eliminated in Release domain.

## 3) Data Structures
- Name: `ReleaseTransformationTarget`
  - Fields:
    - `artifact_path` (path)
    - `section_anchor` (string)
    - `current_statement` (string)
    - `violation_class` (enum: VersioningAssertion, OwnerMisreference)
    - `target_pattern` (enum: Remove, ReplaceWithReferenceOnly)
  - Meaning:
    - Defines exact statement-level refactor targets in `RELEASE_GUIDE.md`.
  - Invariants:
    - `artifact_path` must equal `docs/engineering/guides/RELEASE_GUIDE.md`.
    - Only violation-target statements are transformed.
    - No modification of release requirement matrix structure or release-only criteria is permitted.

- Name: `ReleaseBoundaryScopeMap`
  - Fields:
    - `allowed_scope_items` (string[])
    - `disallowed_topic_items` (string[])
  - Meaning:
    - Explicit boundary map between allowed release norms and disallowed versioning-owner topics.
  - Invariants:
    - `disallowed_topic_items` must delegate versioning authority to `docs/engineering/versioning.md` after transformation.

- Name: `ReleasePostRefactorAssessment`
  - Fields:
    - `duplication_count` (int)
    - `versioning_leakage_count` (int)
    - `release_domain_status` (enum: Clean, MinorDrift, StructuralDrift)
  - Meaning:
    - Deterministic boundary status after wording refactor.
  - Invariants:
    - `release_domain_status = Clean` requires:
      - `duplication_count = 0`
      - `versioning_leakage_count = 0`

## 4) State Machine (if applicable)
### States
- `S0: TargetsBound`
- `S1: ScopeSeparated`
- `S2: TransformRulesApplied`
- `S3: ConstraintValidated`
- `S4: CleanStateEvaluated`

### Transitions
- `TargetsBound -> ScopeSeparated`: identified violations mapped against allowed/disallowed boundary.
- `ScopeSeparated -> TransformRulesApplied`: transformation pattern assigned per target statement.
- `TransformRulesApplied -> ConstraintValidated`: invariant and guard checks pass.
- `ConstraintValidated -> CleanStateEvaluated`: post-refactor counters evaluated and status assigned.

## 5) Algorithms / Rules (if applicable)
- Rule: `ReleaseOwnerViolationTargetRule`
  - Inputs:
    - `RELEASE_GUIDE.md` statements
  - Output:
    - Set of `ReleaseTransformationTarget`
  - Notes:
    - Target statements:
      - `Tags identify authoritative released versions.`
      - `Tags MUST align with version numbers.`
      - ``... `docs/engineering/guides/VERSIONING_GUIDE.md` remains authoritative for SemVer.``

- Rule: `AllowedReleaseNormativeScopeRule`
  - Inputs:
    - `RELEASE_GUIDE.md` sections
  - Output:
    - Allowed scope map
  - Notes:
    - Preserve release-only normative content (release matrix + release criteria).
    - No change to release-domain operational intent.

- Rule: `VersioningOwnerAssertionRemovalRule`
  - Inputs:
    - Target statements with `VersioningAssertion`
  - Output:
    - Transformed statements with no local SemVer ownership semantics
  - Notes:
    - Remove/replace only owner-violating semantics.
    - Do not add new versioning rules.

- Rule: `SemVerOwnerDelegationRule`
  - Inputs:
    - Target statements with `OwnerMisreference`
    - owner path `docs/engineering/versioning.md`
  - Output:
    - Reference-only delegation wording
  - Notes:
    - `docs/engineering/guides/VERSIONING_GUIDE.md` must not be used as authoritative owner.

- Rule: `NoSemanticExpansionConstraint`
  - Inputs:
    - pre/post statement semantics
  - Output:
    - pass/fail
  - Notes:
    - No new release requirements.
    - No new versioning definitions.
    - No new governance domains.

- Rule: `BoundaryInvariantGuardRule`
  - Inputs:
    - post-transform statement set
  - Output:
    - pass/fail
  - Notes:
    - Fail if owner relocation, SemVer model modification, or lifecycle redesign is implied.

- Rule: `PostRefactorCleanValidationRule`
  - Inputs:
    - `ReleasePostRefactorAssessment`
  - Output:
    - `Clean` / non-clean
  - Notes:
    - `Clean` iff:
      - `duplication_count = 0`
      - `versioning_leakage_count = 0`
      - no remaining SemVer authority assertion outside `docs/engineering/versioning.md`
    - Release-domain normative content for release operations remains intact and does not affect Clean classification if no versioning-owner topics are asserted locally.

## 6) Failure Modes / Edge Cases
- Replacement text removes explicit ownership terms but still implies local SemVer authority.
- Misreference to `VERSIONING_GUIDE.md` is rephrased but remains authoritative in meaning.
- Refactor accidentally weakens valid release-operational guidance.
- Transform introduces new normative requirements not present before.
- Model application requires authority-owner relocation (out-of-scope stop condition).

## 7) Observability (optional)
- Logs:
  - Evidence and target mapping are recorded in phase-2c analyze/deliver artifacts.
- Metrics:
  - `target_statement_count`
  - `duplication_count_post`
  - `versioning_leakage_count_post`
  - `release_domain_status_post`

## 8) Fixed Constraints and Version Decision
- Fixed constraints:
  - Preserve Phase-1 invariants I1-I7.
  - Preserve single versioning owner: `docs/engineering/versioning.md`.
  - Prohibit owner relocation.
  - Prohibit SemVer model modification.
  - Prohibit lifecycle redesign.
  - Prohibit repository structure changes.
- Namespace clarifier:
  - Workflow classification uses `Minor Change (workflow)` / `BMAD Feature`.
  - Version classification uses `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.
- Explicit version decision (documentation-only model stage):
  - `no SemVer change`

## 9) Unknowns / Open Questions
- No blocking unknowns identified at model stage.
- If unknowns arise, append to:
  - `docs/_edb-development-history/features/phase-2c-release-boundary-refactor/questions.md`

## 10) Stop Condition
- If model application implies:
  - new workflow categories,
  - new governance domains,
  - authority-owner relocation,
  - lifecycle redesign,
  - or SemVer model modification,
  stop and request clarification before proceeding.
