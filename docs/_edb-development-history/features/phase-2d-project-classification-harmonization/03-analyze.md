# Analyze — phase-2d-project-classification-harmonization

## 1) Options Considered
### Option A: Full semantic inventory + rule-based classification (chosen)
- Summary:
  - Enumerate all artifacts referencing project types and apply `TaxonomyDuplicationDetectionRule`, `OwnerAssertionOutsideOwnerRule`, and `CrossDomainAuthorityLeakageRule` with deterministic counter aggregation.
- Pros:
  - Aligns directly with `02-model.md`.
  - Distinguishes true duplication from reference-only and ambiguous reference patterns.
  - Produces auditable evidence for follow-up execution decisions.
- Cons:
  - Higher analysis effort than token-only scan.
- Risks:
  - Borderline cases (reference + local restatement) require explicit interpretation.
- Complexity:
  - Medium.

### Option B: Token-only scan for canonical project-type strings
- Summary:
  - Count matching terms and infer drift from occurrence volume.
- Pros:
  - Fast.
- Cons:
  - Cannot separate reference-only usage from owner-assertion/duplication.
- Risks:
  - False positives/negatives in drift classification.
- Complexity:
  - Low.

### Option C (optional): Owner-reference-only validation
- Summary:
  - Validate only whether non-owner artifacts link to `PROJECT_CLASSIFICATION.md`.
- Pros:
  - Minimal overhead.
- Cons:
  - Misses local duplicated taxonomy definitions and local owner assertions.
- Risks:
  - Underestimates structural drift.
- Complexity:
  - Low.

---

## 2) Decision
- Chosen option:
  - Option A.
- Rationale (short):
  - Required for deterministic drift counters and defensible separation between duplication, owner assertion, and ambiguity.
- Assumptions (explicit):
  - `docs/engineering/guides/PROJECT_CLASSIFICATION.md` is the taxonomy owner.
  - Non-owner artifacts may reference taxonomy but must not function as alternate taxonomy owners.
- Out-of-scope impacts:
  - No owner relocation.
  - No new governance domains.
  - No workflow/SemVer authority change.
  - No lifecycle redesign.
  - Explicit version decision: `no SemVer change`.

---

## 3) Risk Register (minimal)
- Risk:
  - Non-owner guides may contain historical taxonomy restatements that function as parallel source.
  - Likelihood:
    - High.
  - Impact:
    - High.
  - Mitigation:
    - Classify each artifact with explicit evidence and apply deterministic counters.

- Risk:
  - Template placeholders may encode partial taxonomy lists and create drift pressure.
  - Likelihood:
    - Medium.
  - Impact:
    - Medium.
  - Mitigation:
    - Classify as ambiguity or duplication only when they function as taxonomy source.

---

## 4) Rejected Approaches (if any)
- Approach:
  - Token-only scanning.
  - Why rejected:
    - Fails to separate local authoritative assertions from informational references.

---

## 5) Artifact Enumeration (project-type references)
Artifacts referencing project types:
1. `docs/engineering/guides/PROJECT_CLASSIFICATION.md` (taxonomy owner)
2. `docs/engineering/guides/RELEASE_GUIDE.md`
3. `docs/engineering/guides/PERFORMANCE_GUIDE.md`
4. `docs/engineering/guides/OBSERVABILITY_SCOPE_GUIDE.md`
5. `docs/engineering/guides/SECURITY_SCOPE_GUIDE.md`
6. `docs/engineering/guides/TESTING_SCOPE_GUIDE.md`
7. `docs/engineering/guides/VERSIONING_GUIDE.md`
8. `docs/engineering/templates/security.template.md`
9. `docs/engineering/templates/testing-strategy.template.md`

---

## 6) Rule Application Evidence

### 6.1 `TaxonomyDuplicationDetectionRule`
- Duplication hits:
  - `docs/engineering/guides/RELEASE_GUIDE.md`
    - Local `Project Classification Matrix` + canonical six-type list restated.
  - `docs/engineering/guides/PERFORMANCE_GUIDE.md`
    - Local `Project Classification Matrix` + canonical six-type list restated.
  - `docs/engineering/guides/OBSERVABILITY_SCOPE_GUIDE.md`
    - Local `Project Classification Matrix` + canonical six-type list restated.
  - `docs/engineering/guides/SECURITY_SCOPE_GUIDE.md`
    - Contains local restatements of canonical project-type definitions that function as parallel taxonomy descriptions rather than strict reference-only delegation.
  - `docs/engineering/guides/TESTING_SCOPE_GUIDE.md`
    - Contains local restatements of canonical project-type definitions that function as parallel taxonomy descriptions rather than strict reference-only delegation.
- No duplication hit:
  - `docs/engineering/guides/VERSIONING_GUIDE.md`
    - Explicitly marks list as examples and non-independent matrix (treated as ambiguity, not owner-duplication).
  - Templates:
    - `docs/engineering/templates/security.template.md`
    - `docs/engineering/templates/testing-strategy.template.md`
    - Contain partial option lists without taxonomy authority claims (treated as ambiguity).

### 6.2 `OwnerAssertionOutsideOwnerRule`
- Owner assertion hits:
  - `docs/engineering/guides/RELEASE_GUIDE.md`
    - `The guide MUST define at least the following project types:`
  - `docs/engineering/guides/PERFORMANCE_GUIDE.md`
    - `The guide MUST define at least the following project types:`
  - `docs/engineering/guides/OBSERVABILITY_SCOPE_GUIDE.md`
    - `The guide MUST define at least the following project types:`
- No owner assertion hit:
  - `docs/engineering/guides/SECURITY_SCOPE_GUIDE.md`
  - `docs/engineering/guides/TESTING_SCOPE_GUIDE.md`
  - `docs/engineering/guides/VERSIONING_GUIDE.md`
  - Templates

### 6.3 `CrossDomainAuthorityLeakageRule`
- Leakage hits: none.
- Verified:
  - No classification statement claims SemVer authority ownership.
  - No classification statement claims workflow-policy authority ownership.

### 6.4 Reference Ambiguity Findings
- Ambiguity hits:
  - `docs/engineering/guides/VERSIONING_GUIDE.md`
    - Reuses full canonical type list as examples without explicit delegation to `PROJECT_CLASSIFICATION.md`, but does not assert local taxonomy ownership.
  - `docs/engineering/templates/security.template.md`
    - Partial project-type options can diverge from canonical taxonomy over time.
  - `docs/engineering/templates/testing-strategy.template.md`
    - Partial project-type options can diverge from canonical taxonomy over time.

---

## 7) Deterministic Classification Counters
- `duplication_count = 5`
- `owner_assertion_count = 3`
- `reference_ambiguity_count = 3`
- `cross_domain_leakage_count = 0`
- `classification_domain_status = StructuralDrift`

Rationale:
- Non-owner duplication is present across multiple guides.
- Explicit owner-assertion outside owner appears in three artifacts.
- Ambiguity exists in informational/template contexts, but structural status is already triggered by duplication + owner assertion.

---

## 8) BoundaryGuardRule Validation
- Status: Pass
- Justification:
  - Analysis remains diagnostic and does not propose owner relocation.
  - No new governance domains introduced.
  - No workflow/SemVer authority changes proposed.
  - No lifecycle redesign implied.

---

## 9) Namespace and Version Decision Confirmation
- Namespace clarifier preserved:
  - Workflow classification uses `Minor Change (workflow)` / `BMAD Feature`.
  - Version classification uses `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.
- Explicit version decision:
  - `no SemVer change`

---

## 10) Unknowns / Open Questions
- No blocking unknowns identified in this analysis pass.
- No append to `docs/_edb-development-history/features/phase-2d-project-classification-harmonization/questions.md` required.
