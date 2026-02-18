# Deliver Spec — core-governance-kernel-stabilization

## 0) Status
- Owner: EDB governance maintainers
- Created: 2026-02-18
- Last updated: 2026-02-18
- Related docs:
  - Break: `docs/_edb-development-history/features/core-governance-kernel-stabilization/01-break.md`
  - Model: `docs/_edb-development-history/features/core-governance-kernel-stabilization/02-model.md`
  - Analyze: `docs/_edb-development-history/features/core-governance-kernel-stabilization/03-analyze.md`

---

## 1) Scope

### Goal (must be delivered)
- Establish the formal Phase-1 conceptual governance contract for the Core Governance Kernel.
- Finalize single normative owners for:
  - Workflow Governance
  - Versioning Governance
- Define the formal Log Entnormification Rule Set.
- Define formal authority-boundary contracts for:
  - Routing vs Normative
  - Normative vs Historical
  - Structural vs Normative
- Define explicit Prohibition Matrix.
- Declare must-hold Phase-1 invariants.
- Explicitly confirm that this contract introduces:
  - no new governance domains
  - no SemVer model changes
  - no repository restructuring
- Provide explicit Phase-2 deferral list.

### Non-Goals (explicitly out of scope)
- No migration steps.
- No file-level refactor instructions.
- No System-Orchestrator design.
- No Branch/Release/Project Classification harmonization.
- No modifications to existing governance documents in this deliver artifact.

### Constraints
- Tech:
  - Documentation-only conceptual contract.
- Perf:
  - Not applicable.
- UX:
  - Maintain clear authority language and deterministic boundary statements.
- Backward compatibility:
  - Preserve existing behavior outside this feature scope.
- Security/Privacy (if relevant):
  - Not applicable.

---

## 2) Implementation Rules (Codex Contract)

### Allowed
- Produce conceptual governance contract text only.
- Define ownership and boundary rules at policy/authority level.
- Flag out-of-scope implications without modeling solutions.

### Not Allowed
- Do not define migration or refactor execution.
- Do not prescribe file edits or moves.
- Do not design or specify System-Orchestrator implementation.
- Do not introduce new governance domains.
- Do not alter SemVer model semantics.

### If Information Is Missing
- Stop and request clarification.
- Append missing items to `docs/bmad/features/core-governance-kernel-stabilization/questions.md`.

---

## 3) Target Files / Folders
List exact paths. No placeholders.

- `docs/_edb-development-history/features/core-governance-kernel-stabilization/01-break.md`
- `docs/_edb-development-history/features/core-governance-kernel-stabilization/02-model.md`
- `docs/_edb-development-history/features/core-governance-kernel-stabilization/03-analyze.md`
- `docs/_edb-development-history/features/core-governance-kernel-stabilization/04-deliver.md`

---

## 4) Public API (if any)
Describe final API as it should exist after implementation.

### Exports / Signatures
- No code/API surface (documentation-only governance contract).

### Inputs / Outputs
- Inputs:
  - `01-break.md`, `02-model.md`, `03-analyze.md`
- Output:
  - Formal Phase-1 target-state contract (this document)

### Error behavior
- If requested content crosses Phase-1 scope, stop and request clarification.

---

## 5) Data Model / State (if any)
- Entities:
  - `DomainAuthorityOwner`
  - `DocumentAuthorityProfile`
  - `ReferenceContract`
  - `TargetStateInvariantSet`
- Persistence (if any):
  - Markdown governance artifacts only.
- Invariants (must always hold):
  - I1: Workflow Governance has exactly one normative owner.
  - I2: Versioning Governance has exactly one normative owner.
  - I3: Logs contain no normative governance rules.
  - I4: Routing documents do not create normative rules.
  - I5: Templates do not define governance obligations.
  - I6: Namespace separation remains explicit:
    - `Minor Change (workflow)` / `BMAD Feature`
    - `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`
  - I7: No new governance domain is introduced.
- Edge cases:
  - Historical documents referencing normative sources are allowed if reference-only.
  - Normative documents may cite boundary docs but may not duplicate topic ownership.

---

## 6) Implementation Plan (ordered)
Write as a strict sequence. Each step should be checkable.

1. Declare final Phase-1 single normative source for Workflow Governance.
2. Declare final Phase-1 single normative source for Versioning Governance.
3. Declare formal Log Entnormification Rule Set.
4. Declare formal Authority Boundary Contracts.
5. Declare Explicit Prohibition Matrix.
6. Declare must-hold Phase-1 Invariant Set.
7. Declare explicit Phase-1 confirmations (no new domains / no SemVer model changes / no restructuring).
8. Declare explicit Phase-2 deferral list.

---

## 7) Tests / Validation
Specify how correctness is verified.

### Must-have checks
- Single normative owner declarations are explicit and unique:
  - Workflow Governance owner:
    - `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
  - Versioning Governance owner:
    - `docs/engineering/versioning.md`
- Log Entnormification Rule Set is explicit and prohibition-based.
- Authority boundary contracts are explicit for all required layer pairs.
- Prohibition Matrix includes all required prohibitions:
  - No multi-source normative definition.
  - No normative language in logs.
  - No normative language in templates.
  - No normative rule creation in routing docs.
- Phase-2 topics are separated into deferral list only.

### Optional checks
- Cross-check consistency with:
  - `docs/_edb-development-history/features/core-governance-kernel-stabilization/02-model.md`
  - `docs/_edb-development-history/features/core-governance-kernel-stabilization/03-analyze.md`

---

## 8) Acceptance Criteria (Definition of Done)
Must be objective and testable.

- [ ] Final single normative source declaration exists for Workflow Governance:
      `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`.
- [ ] Final single normative source declaration exists for Versioning Governance:
      `docs/engineering/versioning.md`.
- [ ] Formal Log Entnormification Rule Set is declared.
- [ ] Formal authority-boundary contracts are declared for required layer pairs.
- [ ] Explicit Prohibition Matrix is declared.
- [ ] Phase-1 invariants are declared as must-hold contract conditions.
- [ ] Explicit confirmations are present:
      no new domains, no SemVer model changes, no repository restructuring.
- [ ] Explicit Phase-2 deferral list is present and separate.

---

## 9) Rollback / Safety (if relevant)
- Feature flags:
  - Not applicable.
- Migration steps:
  - Not applicable by contract (migration definition is out of scope).
- Revert steps:
  - Revert this contract artifact if superseded.

---

## Phase-1 Contract Body (Normative)

### A) Final Single Normative Source Declarations

- Workflow Governance single normative source:
  - `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`

- Versioning Governance single normative source:
  - `docs/engineering/versioning.md`

Declaration rule:
- All other documents may reference these owners but must not redefine owned rule-topics.

### B) Formal Log Entnormification Rule Set

- Logs are historical-only artifacts.
- Logs may contain:
  - chronology
  - evidence
  - decisions (historical records)
- Logs must not contain:
  - active governance obligations
  - process requirements
  - new rule definitions
  - normative decision criteria

### C) Formal Authority Boundary Contracts

- Routing vs Normative:
  - Routing may delegate and sequence.
  - Routing may reference normative owners.
  - Routing must not create or redefine normative rules.

- Normative vs Historical:
  - Normative layer defines active rules.
  - Historical layer records what happened.
  - Historical layer must not carry active normative governance.

- Structural vs Normative:
  - Structural layer defines scaffold/format/required sections.
  - Structural layer may reference normative owners.
  - Structural layer must not define governance obligations.

### D) Explicit Prohibition Matrix

- P1: Multi-source normative definition for one rule-topic is prohibited.
- P2: Normative language in logs is prohibited.
- P3: Normative governance obligations in templates are prohibited.
- P4: Normative rule creation inside routing documents is prohibited.

### E) Phase-1 Invariant Declaration (Must Hold)

- I1: Exactly one normative owner for Workflow Governance.
- I2: Exactly one normative owner for Versioning Governance.
- I3: Logs are non-normative (historical-only).
- I4: Routing is delegation-only (no rule creation).
- I5: Templates are structural-only (no governance obligations).
- I6: Namespace separation is explicit and maintained:
  - Workflow classification: `Minor Change (workflow)` / `BMAD Feature`
  - Version classification: `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`
- I7: No new governance domains are introduced.

### F) Explicit Phase-1 Scope Confirmations

- No new governance domains are introduced.
- No SemVer model changes are introduced.
- No repository restructuring is defined.

### G) Explicit Phase-2 Deferral List

Deferred beyond Phase 1 (declared, not solved here):
- Branch Governance harmonization with Versioning boundaries.
- Release Governance harmonization with Versioning boundaries.
- Project Classification de-duplication across scope guides.
- System-Orchestrator design and routing-center construction.
- Any migration/refactor execution sequencing.
