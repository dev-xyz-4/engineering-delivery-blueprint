# Model — core-governance-kernel-stabilization

## 1) System Overview (2–5 bullets)
- Phase 1 models the Core Governance Kernel as three tightly coupled domains: Workflow Governance, Versioning Governance, and Historical Logging boundaries.
- Each governance rule-topic must have exactly one normative owner document; all non-owner artifacts may only reference, not redefine.
- Authority-layer contracts are explicit for Routing, Normative, Historical, and Structural layers to remove mixed authority behavior.
- This model defines target-state invariants and allowed reference relationships only; it does not define migration/refactor execution.
- Orchestrator construction is out of scope for this phase.

## 2) Key Concepts / Terms
- `Normative Source`: The single document allowed to define binding rules for one domain/rule-topic.
- `Normative Topic`: Atomic rule area (for example: workflow classification rule, SemVer decision rule, log content rule).
- `Reference-Only Link`: A non-normative mention that points to the normative source without restating rule text.
- `Authority Boundary Contract`: A hard rule set defining what each authority layer may and may not contain.
- `Log Entnormification`: Target condition where logs are purely historical (chronology/evidence) and contain no active governance rules.
- `Structural Neutrality`: Target condition where templates/scaffolds define structure only and contain no governance obligations.
- `Namespace Separation`: Mandatory distinction between `Minor Change (workflow)` / `BMAD Feature` and `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.

## 3) Data Structures
- Name: `DomainAuthorityOwner`
  - Fields:
    - `domain_id` (`workflow | versioning | logging-boundary`)
    - `owner_doc` (path)
    - `owner_layer` (`Normative Authority`)
    - `owner_scope` (list of rule-topics owned)
  - Meaning:
    - Canonical ownership map for single-source governance.
  - Invariants:
    - Exactly one `owner_doc` per `domain_id` for Phase 1 core domains.
    - Normative ownership is defined at rule-topic granularity, not at whole-document granularity.
    A document may contain multiple rule-topics, but each rule-topic must have exactly one normative owner.
    - `owner_layer` is always `Normative Authority`.
  - Note:
    - The logging-boundary domain does not represent a normative ownership domain.
    - It represents a negative-constraint domain defining what must NOT be owned or defined within Historical Authority artifacts.


- Name: `DocumentAuthorityProfile`
  - Fields:
    - `doc_path`
    - `primary_layer` (`Routing | Normative | Historical | Structural | Informational`)
    - `contains_normative_language` (`true|false`)
    - `defines_rule_topics` (set of topic IDs)
    - `references_normative_topics` (set of topic IDs)
  - Meaning:
    - Authority behavior profile of each relevant document.
  - Invariants:
    - If `primary_layer` is `Historical`, then `contains_normative_language=false` and `defines_rule_topics=empty`.
    - If `primary_layer` is `Structural`, then `contains_normative_language=false` and `defines_rule_topics=empty`.
    - If `primary_layer` is `Routing`, then `defines_rule_topics=empty`.

- Name: `ReferenceContract`
  - Fields:
    - `source_doc`
    - `source_layer`
    - `target_doc`
    - `target_layer`
    - `relation_type` (`reference_only`)
  - Meaning:
    - Allowed authority-safe cross-document dependency.
  - Invariants:
    - `relation_type` is always `reference_only` for non-normative layers.
    - `source_layer=Normative` may reference other normative docs only for boundary declarations, not to re-own topics.

- Name: `TargetStateInvariantSet`
  - Fields:
    - `invariant_id`
    - `statement`
    - `applies_to` (documents/layers/domains)
  - Meaning:
    - Non-negotiable Phase-1 target conditions.
  - Invariants:
    - All invariants must be satisfiable without introducing new governance domains.

## 4) State Machine (if applicable)
### States
- `S0 Mixed-Authority Baseline`
- `S1 Owner Map Defined`
- `S2 Boundary Contracts Defined`
- `S3 Phase-1 Target Model Complete`

### Transitions
- From `S0` -> `S1`: Core domains have explicit single normative owner declarations.
- From `S1` -> `S2`: Layer contracts + allowed reference relationships are explicitly defined.
- From `S2` -> `S3`: Prohibitions + target-state invariants are fully specified for Workflow, Versioning, and Logging boundary.

## 5) Algorithms / Rules (if applicable)
- Rule: `Single Normative Source Enforcement (Conceptual)`
  - Inputs:
    - `DomainAuthorityOwner`
    - `DocumentAuthorityProfile[]`
  - Output:
    - `owner_conflict_report` (`none | conflicting_docs[]`)
  - Notes:
    - A conflict exists if more than one document defines the same normative topic in Phase 1 core domains.

- Rule: `Authority Boundary Contract`
  - Inputs:
    - `DocumentAuthorityProfile`
  - Output:
    - `boundary_compliance` (`compliant | violation_type`)
  - Notes:
    - Routing vs Normative:
      - Routing may route/sequence/reference.
      - Routing must not create normative rules.
    - Normative vs Historical:
      - Historical documents may record events/decisions.
      - Historical documents must not define active governance rules.
    - Structural vs Normative:
      - Templates may define structure/placeholders/required sections.
      - Templates must not define governance obligations.

- Rule: `Allowed Reference Relationship Matrix`
  - Inputs:
    - `source_layer`, `target_layer`
  - Output:
    - `allowed` (`yes|no`) + `constraint`
  - Notes:
    - `Routing -> Normative`: yes, reference-only.
    - `Routing -> Historical`: yes, reference-only context.
    - `Routing -> Structural`: yes, reference-only scaffold pointer.
    - `Historical -> Normative`: yes, reference-only citation; no rule restatement.
    - `Structural -> Normative`: yes, reference-only owner pointer.
    - `Structural -> Routing`: no, because templates must not embed routing logic.
    - `Historical -> Routing`: no active routing behavior in logs.

- Rule: `Explicit Prohibitions`
  - Inputs:
    - `DocumentAuthorityProfile[]`
  - Output:
    - `prohibition_violations[]`
  - Notes:
    - Prohibit multi-source normative definition for the same topic.
    - Prohibit normative language in logs.
    - Prohibit normative language in templates.
    - Prohibit normative rule creation inside routing documents.

- Rule: `Phase-1 Target Invariants`
  - Inputs:
    - Owner map + boundary contracts
  - Output:
    - `invariant_status` (`pass|fail` per invariant)
  - Notes:
    - Invariant I1: Workflow Governance has exactly one normative source.
    - Invariant I2: Versioning Governance has exactly one normative source.
    - Invariant I3: Logs are historical-only and contain no active governance rules.
    - Invariant I4: Routing documents contain no rule creation.
    - Invariant I5: Templates are structural-only and contain no governance obligations.
    - Invariant I6: Namespace separation remains explicit (`Minor Change (workflow)` vs `SemVer` classes).
    - Invariant I7: No new governance domain is introduced.

## 6) Failure Modes / Edge Cases
- `Owner Collision`: Two docs claim normative ownership for the same Workflow or Versioning topic.
- `Hidden Normative Leakage`: Non-owner docs keep MUST/SHOULD/MAY rule statements for owned topics.
- `Log Regression`: Historical log text reintroduces active process obligations.
- `Template Governance Injection`: Templates encode behavioral obligations instead of owner references.
- `Routing Drift`: Routing docs begin to define policy details rather than delegating.
- `Namespace Collapse`: Workflow and SemVer terms are conflated in rule text.
- `Phase Boundary Violation`: Model attempts to include Phase-2 operational harmonization or orchestrator design.

## 7) Observability (optional)
- Logs:
  - Conceptual monitoring artifact: `authority-violation register` (classification-only) tracking owner collisions and leakage classes during planning review.
- Metrics:
  - `single_source_conflict_count` (target: 0 in Phase-1 model)
  - `log_normative_leak_count` (target: 0 in target state)
  - `template_normative_leak_count` (target: 0 in target state)
  - `routing_rule_creation_count` (target: 0 in target state)
