# Model — core-governance-kernel-refactor

## 1) System Overview (2–5 bullets)
- This model defines how to operationally enforce the existing Phase-1 governance contract (no conceptual re-modeling).
- Transformations are limited to authority cleanup patterns: log entnormification, routing de-normification, template neutralization, and versioning dual-owner consolidation.
- The normative owner set is fixed in this phase:
  - Workflow Governance -> `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
  - Versioning Governance -> `docs/engineering/versioning.md`
- Non-owner documents may preserve explanatory/navigation content, but must be reference-only for owned rule-topics.
- Phase-2 domains (Branch/Release/Project Classification harmonization) and orchestrator design remain out of scope.

## 2) Key Concepts / Terms
- `Operational Transformation Pattern`: A bounded edit pattern that enforces Phase-1 contract rules in existing documents.
- `Reference-Only Replacement`: Replacing normative rule text with a pointer to the declared normative owner.
- `Normative Token`: Binding language such as `MUST`, `SHOULD`, `MAY`, `must`, `required`.
- `Invariant-Preserving Edit`: An edit that reduces leakage while maintaining Phase-1 invariants and namespace separation.
- `Topic Owner`: The single document allowed to define rules for a given rule-topic.
- `Document-Class Contract`: Class-specific refactor boundary for Log, Routing, Template, and Informational documents.
- `Rollback Safety`: Constraints ensuring changes are reversible and do not alter governance semantics beyond contract enforcement.

## 3) Data Structures
- Name: `TransformationPattern`
  - Fields:
    - `pattern_id` (`log_entnormify | routing_denormify | template_neutralize | versioning_owner_consolidate`)
    - `target_docs` (list of paths)
    - `allowed_edit_types` (list)
    - `forbidden_edit_types` (list)
  - Meaning:
    - Defines bounded operational change type for each hotspot class.
  - Invariants:
    - Each pattern only enforces Phase-1 contract; no domain expansion.

- Name: `AllowedEditType`
  - Fields:
    - `edit_type`
    - `description`
  - Meaning:
    - Canonical allowed edit categories.
  - Invariants:
    - Allowed edit types are only:
      - remove normative MUST/SHOULD/MAY (or equivalent binding wording)
      - replace with reference-only links to owner docs
      - preserve explanatory content

- Name: `TopicOwnershipMap`
  - Fields:
    - `topic_id` (`workflow_rules | versioning_rules`)
    - `owner_doc`
    - `non_owner_docs` (list)
  - Meaning:
    - Rule-topic ownership and non-owner reference scope.
  - Invariants:
    - `workflow_rules` owner is always `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`.
    - `versioning_rules` owner is always `docs/engineering/versioning.md`.

- Name: `DocumentClassContract`
  - Fields:
    - `doc_class` (`log | routing | template | informational`)
    - `allowed_content`
    - `prohibited_content`
    - `required_reference_behavior`
  - Meaning:
    - Refactor boundary per document class.
  - Invariants:
    - Logs and templates must not define governance obligations.
    - Routing docs must not create normative rules.

- Name: `RollbackConstraintSet`
  - Fields:
    - `constraint_id`
    - `constraint_statement`
  - Meaning:
    - Safety conditions that keep changes reversible and scoped.
  - Invariants:
    - No structural repo changes are required.
    - No SemVer model semantics change is introduced.

## 4) State Machine (if applicable)
### States
- `S0 Contract-Defined / Hotspots-Unresolved`
- `S1 Pattern-Scoped Edits Prepared`
- `S2 Topic Ownership Enforced`
- `S3 Class Contracts Enforced`
- `S4 Phase-1 Operationally Conformant`

### Transitions
- From -> To: trigger / condition
- `S0 -> S1`: Hotspot documents are mapped to one of the four transformation patterns.
- `S1 -> S2`: Workflow and Versioning non-owner rule definitions are converted to reference-only behavior.
- `S2 -> S3`: Log, Routing, Template, and Informational class contracts are satisfied.
- `S3 -> S4`: Invariant checks pass and rollback constraints remain satisfied.

## 5) Algorithms / Rules (if applicable)
- Rule:
  - `Log Entnormification`
  - Inputs:
    - Log-class target docs (`docs/bmad/notes/minor-change-log.md`, `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md`)
  - Output:
    - Logs contain chronology/evidence only + owner references where needed
  - Notes:
    - Remove normative governance definitions from logs.
    - Preserve historical entries and append-only chronology.

- Rule:
  - `Routing De-Normification`
  - Inputs:
    - Routing targets (`docs/bmad/guides/CODEX_ENTRY.md`, `docs/bmad/guides/BMAD_DECISION_MATRIX.md`)
  - Output:
    - Delegation-only routing language with explicit references to normative owners
  - Notes:
    - Remove rule-creation language.
    - Keep startup/decision routing behavior and references.

- Rule:
  - `Template Neutralization`
  - Inputs:
    - Template targets (`docs/bmad/templates/deliver.template.md`, `docs/bmad/templates/minor-change.prompt.md`, `docs/bmad/templates/feature-implementation.prompt.md`, `docs/bmad/templates/minor-change-log.template.md`)
  - Output:
    - Structural templates without embedded governance obligations
  - Notes:
    - Keep scaffold/sections/examples.
    - Replace governance obligations with owner references.

- Rule:
  - `Versioning Owner Consolidation`
  - Inputs:
    - `docs/engineering/versioning.md`, `docs/engineering/guides/VERSIONING_GUIDE.md`
  - Output:
    - `versioning.md` remains sole normative owner; `VERSIONING_GUIDE.md` is informational/reference-only
  - Notes:
    - Remove binding rule ownership semantics from `VERSIONING_GUIDE.md`.
    - Preserve explanatory guidance and cross-references.

- Rule:
  - `Invariant-Preserving Transformation`
  - Inputs:
    - Edited docs + `TopicOwnershipMap`
  - Output:
    - `invariant_check` (`pass|fail`)
  - Notes:
    - Must preserve:
      - Workflow/Versioning single ownership
      - no normative language in logs/templates
      - no normative rule creation in routing docs
      - namespace separation:
        - `Minor Change (workflow)` / `BMAD Feature`
        - `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`

- Rule:
  - `Document-Class Refactor Contracts`
  - Inputs:
    - doc class + target text blocks
  - Output:
    - class compliance status
  - Notes:
    - Log document contract:
      - Allowed: chronology, evidence, references
      - Prohibited: active governance obligations
    - Routing document contract:
      - Allowed: delegation, sequencing, owner references
      - Prohibited: rule creation
    - Template document contract:
      - Allowed: structure, placeholders, references
      - Prohibited: governance obligations/process enforcement
    - Informational document contract:
      - Allowed: explanation, onboarding, examples, references
      - Prohibited: ownership of rule-topics owned elsewhere

- Rule:
  - `Rollback Safety Constraints`
  - Inputs:
    - proposed edits
  - Output:
    - rollback safety status
  - Notes:
    - Changes must remain local and reversible.
    - No repository restructuring.
    - No domain expansion.
    - Maintain `SemVer PATCH` expectation (no model expansion).

## 6) Failure Modes / Edge Cases
- Normative language remains in logs after partial cleanup.
- Routing wording still implies normative obligation despite reference links.
- Template text reintroduces governance obligations through examples/instructions.
- `VERSIONING_GUIDE.md` retains effective normative ownership semantics.
- Namespace conflation appears in rewritten text (`Minor Change (workflow)` vs `SemVer MINOR`).
- Out-of-scope pressure emerges:
  - Branch/Release/Project Classification harmonization requested in-phase.
  - Orchestrator construction details requested.
  - SemVer model changes requested.
- Stop condition:
  - If any out-of-scope pressure is required to proceed, stop and request clarification.

## 7) Observability (optional)
- Logs:
  - Record per-document transformation class and compliance result in feature artifacts.
  - Track unresolved items as explicit blockers (if any) in `docs/bmad/features/core-governance-kernel-refactor/questions.md`.
- Metrics:
  - `log_normative_tokens_removed_count`
  - `routing_rule_creation_tokens_removed_count`
  - `template_governance_obligation_tokens_removed_count`
  - `versioning_owner_conflict_count` (target: 0)
  - `out_of_scope_trigger_count` (target: 0 for Phase-1 execution)
