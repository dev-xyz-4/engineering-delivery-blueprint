# Model — phase-2b-branch-boundary-isolation

## 1) System Overview (2–5 bullets)
- This model formalizes Branch Governance as a lifecycle-operational domain with no SemVer ownership authority.
- It defines semantic boundary controls between allowed operational tagging guidance and prohibited versioning-rule ownership phrasing.
- It provides deterministic detection structures for implicit rule creation and versioning leakage in Branch artifacts.
- It classifies Branch domain status as `Clean`, `Minor Drift`, or `Structural Drift` without redesigning governance architecture.
- Explicit version decision for this modeling artifact: `no SemVer change`.

## 2) Key Concepts / Terms
- Branch Operational Guidance:
  - Procedural branch/PR flow instructions supporting lifecycle execution.
- Allowed Tagging Guidance:
  - Operational instructions about when/how tagging is performed as part of workflow execution, without defining versioning semantics.
- Versioning Rule Ownership:
  - Authority to define SemVer semantics, version policy, and authoritative version meaning.
- Reference-Only Versioning:
  - Non-owner statements that delegate versioning semantics to `docs/engineering/versioning.md`.
- Implicit Rule Creation:
  - Phrasing that creates enforcement semantics for externally owned topics without explicit owner delegation.
- Leakage Event:
  - Branch-domain language that effectively defines or claims versioning-rule authority.

## 3) Data Structures
- Name: `BranchBoundaryRuleSet`
  - Fields:
    - `allowed_operational_phrasing` (list[string])
    - `prohibited_owner_semantics` (list[string])
    - `required_owner_reference` (path)
  - Meaning:
    - Formal boundary specification for branch-domain wording.
  - Invariants:
    - `required_owner_reference` is fixed to `docs/engineering/versioning.md` for versioning topics.
    - No rule in this set may redefine SemVer semantics.

- Name: `BranchEvidenceEntry`
  - Fields:
    - `artifact_path` (path)
    - `section_anchor` (string)
    - `observed_statement` (string)
    - `semantic_class` (enum: ReferenceOnly, OperationalGuidance, OwnerViolation)
    - `owner_topic` (enum: BranchWorkflow, Versioning)
    - `owner_reference` (path or `N/A`)
  - Meaning:
    - Evidence atom for semantic branch-boundary evaluation.
  - Invariants:
    - Every `OwnerViolation` entry must reference `owner_topic = Versioning` or explicit cross-owner conflict.

- Name: `BranchDriftAssessment`
  - Fields:
    - `leakage_count` (int)
    - `implicit_rule_count` (int)
    - `owner_violation_count` (int)
    - `classification` (enum: Clean, MinorDrift, StructuralDrift)
  - Meaning:
    - Deterministic summary of Branch domain boundary status.
  - Invariants:
    - `classification = Clean` requires all violation counters to be zero.

## 4) State Machine (if applicable)
### States
- S0: `BoundaryModelInitialized`
- S1: `PhrasingClassesBound`
- S2: `LeakageEvaluationReady`
- S3: `DriftDeterminable`
- S4: `InvariantChecked`

### Transitions
- `BoundaryModelInitialized` -> `PhrasingClassesBound`: allowed/prohibited semantic classes are fixed.
- `PhrasingClassesBound` -> `LeakageEvaluationReady`: evidence structure supports implicit-rule and leakage checks.
- `LeakageEvaluationReady` -> `DriftDeterminable`: drift-classification criteria are available.
- `DriftDeterminable` -> `InvariantChecked`: Phase-1 invariants are validated as fixed constraints.

## 5) Algorithms / Rules (if applicable)
- Rule: `AllowedOperationalTaggingRule`
  - Inputs:
    - branch-domain statement
  - Output:
    - `OperationalGuidance` or `not-operational`
  - Notes:
    - Allowed when statement describes execution flow (e.g., branching, PR, timing) without defining SemVer semantics. Must not define version meaning, version numbering rules, or authoritative tag interpretation.

- Rule: `ProhibitedVersioningOwnershipRule`
  - Inputs:
    - branch-domain statement
  - Output:
    - `OwnerViolation` or `non-violation`
  - Notes:
    - Triggers if statement asserts authoritative version meaning, SemVer rules, or version ownership in Branch domain.

- Rule: `ImplicitRuleCreationDetectionRule`
  - Inputs:
    - branch-domain statements
  - Output:
    - implicit-rule findings
  - Notes:
    - Semantic check; not keyword-only.
    - Violation when versioning obligations are created without explicit delegation to owner document.

- Rule: `VersioningLeakageDetectionRule`
  - Inputs:
    - versioning-adjacent statements in branch artifacts
  - Output:
    - leakage findings
  - Notes:
    - Any explicit or implicit assertion of SemVer ownership, authoritative tag meaning, or version classification logic outside docs/engineering/versioning.md constitutes leakage.

- Rule: `SemanticClassAssignmentRule`
  - Inputs:
    - branch statement + context
  - Output:
    - one of:
      - `ReferenceOnly`
      - `OperationalGuidance`
      - `OwnerViolation`
  - Notes:
    - `ReferenceOnly`: delegates to normative owner.
    - `OperationalGuidance`: lifecycle execution guidance only.
    - `OwnerViolation`: defines or implies externally owned rule authority.

- Rule: `BranchDriftClassificationRule`
  - Inputs:
    - `BranchDriftAssessment` counters
  - Output:
    - `Clean` / `Minor Drift` / `Structural Drift`
  - Notes:
    - `Clean`:
      - No leakage, no implicit rule creation, no owner violations.
    - `Minor Drift`:
      - Single or isolated owner-violation or leakage events that do not redefine SemVer semantics systemically.
    - `Structural Drift`:
      - Repeated or explicit owner-violation semantics, or multiple leakage events.

## 6) Failure Modes / Edge Cases
- A branch statement uses operational language but semantically claims version authority.
- Tagging guidance is written as policy ownership instead of execution reference.
- Cross-reference exists but surrounding wording still implies local SemVer authority.
- Mixed statements contain both valid operational guidance and owner-violation semantics.
- Boundary breach condition:
  - If modeling requires authority-owner relocation, lifecycle redesign, or governance-model modification, stop and request clarification.

## 7) Observability (optional)
- Logs:
  - Not applicable (documentation-only modeling).
- Metrics:
  - `branch_operational_statements_count`
  - `reference_only_statements_count`
  - `owner_violation_count`
  - `implicit_rule_creation_count`
  - `versioning_leakage_count`
  - `branch_drift_class`

## 8) Allowed vs Prohibited Semantic Classes (Formal)
- Allowed operational tagging guidance:
  - Describes branch/PR/tag workflow sequence.
  - Uses procedural phrasing without claiming SemVer ownership.
  - May reference `docs/engineering/versioning.md` for versioning semantics.

- Prohibited versioning-rule ownership semantics:
  - Defining SemVer class semantics in Branch domain.
  - Claiming authoritative version meaning in Branch domain.
  - Creating implicit versioning obligations without owner delegation.

## 9) Fixed Constraints (Phase-1 Invariants)
- Normative owner for versioning remains:
  - `docs/engineering/versioning.md`
- Branch Governance remains lifecycle-operational and non-authoritative for SemVer.
- No new governance domains.
- No governance redesign.
- No orchestrator logic.
- Namespace clarifier remains explicit:
  - Workflow classification uses `Minor Change (workflow)` / `BMAD Feature`.
  - Version classification uses `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.

## 10) Unknowns / Open Questions
- No authority-model modification requirements identified during modeling Analytical refinements may emerge during evidence-level semantic review.
- If unknowns emerge during analysis, append to:
  - `docs/_edb-development-history/features/phase-2b-branch-boundary-isolation/questions.md`
