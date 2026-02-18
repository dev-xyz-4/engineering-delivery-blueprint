# Deliver Spec — core-governance-kernel-refactor

## 0) Status
- Owner: EDB governance maintainers
- Created: 2026-02-18
- Last updated: 2026-02-18
- Related docs:
  - Break: `docs/_edb-development-history/features/core-governance-kernel-refactor/01-break.md`
  - Model: `docs/_edb-development-history/features/core-governance-kernel-refactor/02-model.md`
  - Analyze: `docs/_edb-development-history/features/core-governance-kernel-refactor/03-analyze.md`

---

## 1) Scope

### Goal (must be delivered)
- Define the Phase-1 execution contract for operational authority cleanup.
- Define exact operational refactor rules for:
  - Versioning dual-owner resolution
  - Routing de-normification
  - Log entnormification
  - Template neutralization
- Define per document class:
  - transformation contract
  - replacement pattern
  - allowed phrasing style
  - prohibited phrasing style
- Define compliance/violation criteria per document class.
- Preserve Phase-1 boundary and SemVer constraints.

### Non-Goals (explicitly out of scope)
- No migration sequencing plan.
- No Phase-2 domain harmonization (Branch/Release/Project Classification).
- No system orchestrator design/construction.
- No governance model redesign.
- No repository restructuring.

### Constraints
- Tech:
  - Refactor scope is limited to authority wording/ownership enforcement.
- Perf:
  - Not applicable.
- UX:
  - Keep documents readable and navigable while removing normative leakage.
- Backward compatibility:
  - Preserve behavior outside authority cleanup scope.
- Security/Privacy (if relevant):
  - Not applicable.

---

## 2) Implementation Rules (Codex Contract)

### Allowed
- Refactor wording and section ownership markers in targeted governance documents.
- Replace non-owner rule-defining text with reference-only pointers to owner docs.
- Preserve explanatory, historical, and structural utility per document class contract.

### Not Allowed
- Do not introduce new governance domains.
- Do not alter SemVer model semantics.
- Do not expand into lifecycle Phase-2 domains.
- Do not design orchestrator architecture.
- Do not define migration sequencing.

### If Information Is Missing
- Stop implementation.
- Append unknowns to `docs/bmad/features/core-governance-kernel-refactor/questions.md`.

---

## 3) Target Files / Folders
List exact paths. No placeholders.

- `docs/_edb-development-history/features/core-governance-kernel-refactor/01-break.md`
- `docs/_edb-development-history/features/core-governance-kernel-refactor/02-model.md`
- `docs/_edb-development-history/features/core-governance-kernel-refactor/03-analyze.md`
- `docs/_edb-development-history/features/core-governance-kernel-refactor/04-deliver.md`
- `docs/engineering/versioning.md`
- `docs/engineering/guides/VERSIONING_GUIDE.md`
- `docs/bmad/guides/CODEX_ENTRY.md`
- `docs/bmad/guides/BMAD_DECISION_MATRIX.md`
- `docs/bmad/notes/minor-change-log.md`
- `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md`
- `docs/bmad/templates/deliver.template.md`
- `docs/bmad/templates/minor-change.prompt.md`
- `docs/bmad/templates/feature-implementation.prompt.md`
- `docs/bmad/templates/minor-change-log.template.md`

---

## 4) Public API (if any)
Describe final API as it should exist after implementation.

### Exports / Signatures
- No code/API surface (documentation refactor only).

### Inputs / Outputs
- Inputs:
  - Refactor feature B/M/A artifacts and prior Phase-1 contract.
- Outputs:
  - Updated governance documents that satisfy Phase-1 authority invariants.

### Error behavior
- Stop if execution requires:
  - Branch/Release/Classification harmonization
  - SemVer model semantic changes
  - Orchestrator design

---

## 5) Data Model / State (if any)
- Entities:
  - `TransformationPattern`
  - `TopicOwnershipMap`
  - `DocumentClassContract`
  - `ComplianceCheck`
- Persistence (if any):
  - Markdown governance documents only.
- Invariants (must always hold):
  - Workflow owner remains `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`.
  - Versioning owner remains `docs/engineering/versioning.md`.
  - `docs/engineering/guides/VERSIONING_GUIDE.md` is informational-only.
  - Logs are historical-only.
  - Routing docs are delegation-only.
  - Templates are structural-only.
  - Namespace separation remains explicit:
    - `Minor Change (workflow)` / `BMAD Feature`
    - `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`
- Edge cases:
  - Explanatory examples are allowed in non-owner docs if they do not define/override rule-topics.

---

## 6) Implementation Plan (ordered)
Write as a strict sequence. Each step should be checkable.

1. Contract Checkpoint C1: Versioning dual-owner resolution contract is applied.
2. Contract Checkpoint C2: Routing de-normification contract is applied.
3. Contract Checkpoint C3: Log entnormification contract is applied.
4. Contract Checkpoint C4: Template neutralization contract is applied.
5. Contract Checkpoint C5: Per-class compliance/violation checks all pass.

Note:
- Checkpoints define completion criteria only.
- They do not prescribe migration sequencing.

---

## 7) Tests / Validation
Specify how correctness is verified.

### Must-have checks
- Ownership declarations:
  - `docs/engineering/versioning.md` remains sole normative versioning owner.
  - `docs/engineering/guides/VERSIONING_GUIDE.md` is informational/reference-only.
  - Workflow normative ownership stays in `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`.
- Document class compliance:
  - Logs: no active governance obligations.
  - Routing docs: no rule creation.
  - Templates: no governance obligations.
  - Informational docs: no normative ownership for externally owned topics.
- Namespace integrity:
  - Workflow and SemVer namespaces remain explicitly separated.
- Scope integrity:
  - No Phase-2 domain harmonization content introduced.
  - No SemVer model semantics changed.

### Optional checks
- Token + semantic scan for obligation language in non-owner docs.
- Cross-reference consistency check to owner documents.

---

## 8) Acceptance Criteria (Definition of Done)
Must be objective and testable.

- [ ] `docs/engineering/versioning.md` is explicitly and effectively the sole normative versioning owner.
- [ ] `docs/engineering/guides/VERSIONING_GUIDE.md` contains informational/reference-only content.
- [ ] Target logs are historical-only and non-normative.
- [ ] Target routing documents are delegation-only and non-rule-creating.
- [ ] Target templates are structural-only and non-normative.
- [ ] Per document class compliance criteria pass with no critical violations.
- [ ] `SemVer PATCH` expectation remains valid.
- [ ] No domain expansion, no lifecycle redesign, no orchestrator construction, and no repository restructuring introduced.

---

## 9) Rollback / Safety (if relevant)
- Feature flags:
  - Not applicable.
- Migration steps:
  - Not defined by contract.
- Revert steps:
  - Revert modified documents to previous commit state if contract checks fail.

---

## Execution Contract Body

### A) Operational Refactor Rules

- Versioning dual-owner resolution:
  - Keep normative rule ownership in `docs/engineering/versioning.md` only.
  - Convert `docs/engineering/guides/VERSIONING_GUIDE.md` to informational/reference-only.

- Routing de-normification:
  - In routing docs, remove rule creation/obligation text.
  - Keep routing/delegation flow and explicit links to owner docs.

- Log entnormification:
  - Remove governance-definition/workflow-rule sections from logs.
  - Preserve chronology/evidence tables and historical entries.

- Template neutralization:
  - Remove embedded governance obligations from template bodies.
  - Keep structural scaffolding and reference owner docs for rules.

### B) Document-Class Transformation Contracts

- Log document contract:
  - Transformation contract:
    - Convert governance-definition blocks to owner-reference blocks.
  - Replacement pattern:
    - Replace rule sections with: "For governing rules, see <owner doc>."
  - Allowed phrasing style:
    - Historical, descriptive, chronological, evidential.
  - Prohibited phrasing style:
    - "MUST/SHOULD/MAY", mandatory workflow obligations, normative definitions.

- Routing document contract:
  - Transformation contract:
    - Keep decision paths and mode routing; remove normative creation.
  - Replacement pattern:
    - Replace obligations with delegated references to owner docs.
  - Allowed phrasing style:
    - "route to", "refer to", "use owner policy".
  - Prohibited phrasing style:
    - "must do X" where X is a newly defined rule in routing doc.

- Template document contract:
  - Transformation contract:
    - Keep structure/sections/placeholders; remove governance enforcement text.
  - Replacement pattern:
    - Replace governance rules with compact owner reference lines.
  - Allowed phrasing style:
    - Structural instructions, placeholders, examples.
  - Prohibited phrasing style:
    - Behavioral enforcement, mandatory policy definitions, lifecycle obligations.

- Informational document contract:
  - Transformation contract:
    - Keep explanatory material; remove ownership of externally owned rule-topics.
  - Replacement pattern:
    - Convert rule statements to explanatory text + owner references.
  - Allowed phrasing style:
    - "explains", "summarizes", "see owner document".
  - Prohibited phrasing style:
    - Normative ownership claims for topics owned elsewhere.

### C) Verification Criteria Per Document Class

- Logs:
  - Compliance:
    - Contains chronology/evidence/history only; includes owner links where needed.
  - Violation:
    - Contains active governance definitions or process obligations.

- Routing docs:
  - Compliance:
    - Delegates to owners and sequences paths without rule creation.
  - Violation:
    - Defines binding workflow or versioning rules locally.

- Templates:
  - Compliance:
    - Structural scaffolds only, with references to normative owners.
  - Violation:
    - Contains governance obligations or lifecycle enforcement language.

- Informational docs:
  - Compliance:
    - Explanatory and reference-only for externally owned rule-topics.
  - Violation:
    - Establishes or redefines owned normative topics.

### D) Explicit Declarations

- `docs/engineering/versioning.md` remains sole normative owner for versioning.
- `docs/engineering/guides/VERSIONING_GUIDE.md` becomes informational-only.
- Logs become historical-only.
- Routing docs become delegation-only.
- Templates become structural-only.

### E) Scope/Version Constraints

- SemVer expectation: `SemVer PATCH`.
- No governance domain expansion.
- No lifecycle redesign.
- No orchestrator construction.
- No repository restructuring.

### F) Phase-2 Deferrals

- Branch Governance harmonization with Versioning boundaries.
- Release Governance harmonization with Versioning boundaries.
- Project Classification cross-guide harmonization.
- System-Orchestrator architecture/design work.

### G) Unresolved Risks

- Hidden normative leakage may persist via implicit obligation language after token cleanup.
- Routing readability may regress if delegation wording is over-compressed.
- Template neutralization may leave mixed signals if validation blocks are only partially normalized.
