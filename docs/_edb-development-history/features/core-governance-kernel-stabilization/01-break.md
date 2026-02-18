# Break — core-governance-kernel-stabilization

## 1) Problem Statement (one paragraph)
- The current governance kernel is unstable because Workflow Governance and Versioning Governance are defined across multiple document types and authority layers (policy, routing, logs, templates). This creates Single Source violations, routing/policy coupling, and log contamination with active rules. Phase 1 requires a clear conceptual baseline that stabilizes core authority boundaries without refactoring repository structure or altering existing operational behavior.

## 2) Goal
- Define Phase-1 scope for Core Governance Kernel stabilization across:
  - Workflow Governance (single normative source target)
  - Versioning Governance (single normative source target)
  - Historical log entnormification rules
- Define explicit authority-separation rules between:
  - Routing Authority
  - Normative Authority
  - Historical Authority
  - Structural Authority
- Define conceptual target-state constraints for removing normative text from:
  - Logs
  - Routing documents
  - Templates
- Capture explicit versioning decision context for this planning phase.
- This break defines conceptual target-state authority ownership and separation rules but does not yet define migration mechanics.

## 3) Non-Goals
- No repository refactor, file move, rename, or restructuring.
- No edit of existing governance documents in this step.
- No change to SemVer model semantics.
- No introduction of new governance domains.
- No System-Orchestrator construction design in this break phase.
- No implementation-mode behavior.

## 4) Users / Actors (if any)
- EDB maintainers stabilizing governance authority boundaries.
- Governance editors preparing later consolidation phases.
- Codex sessions requiring deterministic authority ownership during planning.

## 5) Inputs / Outputs
### Inputs
- `.planning/Entw-System-Orchestrator/1_EDB_Authority_Model_v0.1.md`
- `.planning/Entw-System-Orchestrator/3_EDB_Authority_Consolidation_Strategy_v0.1.md`
- `.planning/Entw-System-Orchestrator/4_EDB_Governance_Domain_Mapping_v0.1.md`
- `.planning/Entw-System-Orchestrator/5_EDB_Governance_Lifecycle_Model_v0.1.md`
- `.planning/Entw-System-Orchestrator/6_EDB_Lifecycle_Domain_Consolidation_Analysis_v0.1.md`
- `.planning/Entw-System-Orchestrator/7_EDB_Authority_Consolidation_Roadmap_v0.1.md`
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
- `docs/engineering/versioning.md`
- `docs/engineering/guides/VERSIONING_GUIDE.md`
- `docs/bmad/notes/minor-change-log.md`
- `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md`

### Outputs
- Break-scope definition for Core Governance Kernel (Phase 1 only).
- Explicit target ownership intent:
  - Workflow Governance -> single normative source (conceptual)
  - Versioning Governance -> single normative source (conceptual)
- Explicit Log Entnormification rule set (conceptual boundary definition).
- Authority separation baseline for Routing vs Normative vs Historical vs Structural.
- Explicit SemVer Decision record for this phase:
  - SemVer Decision: `no SemVer change`
  - Rationale:
    - This step is documentation-only planning and defines conceptual scope only.
    - No normative implementation changes are applied to live governance artifacts in this step.
  - Version tagging required at this stage: `No` (Planned tag: `N/A`)

## 6) Constraints
- Technical: Documentation-only mode; no code or operational workflow execution.
- Performance: Not applicable (no runtime/implementation changes).
- UX: Maintain clarity and deterministic authority vocabulary.
- Compatibility: Preserve existing behavior and document contracts outside scope.
- Legal/Compliance (if relevant): Maintain current governance and compliance-model semantics; no regulatory model change.
- Process constraints:
  - Namespace separation must remain explicit:
    - `Minor Change (workflow)` / `BMAD Feature`
    - `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`
  - Phase boundary enforced: this break must not include Phase-2+ structural implications.

## 7) Unknowns / Open Questions
- No blocking unknowns identified for this break scope.
- If structural implications beyond Phase 1 are required during subsequent phases, stop and request clarification before proceeding.
- Any future unknowns must be appended to:
  - `docs/bmad/features/core-governance-kernel-stabilization/questions.md`

## 8) Success Criteria (high level)
- Break scope is explicitly limited to Core Governance Kernel (Workflow + Versioning + Log Entnormification).
- Target conceptual ownership for Workflow and Versioning is clearly stated as single-source intent.
- Authority-layer separation rules are explicitly captured for the four relevant layers.
- No new domains, no SemVer model change, and no orchestrator construction scope are introduced.
- SemVer decision and tagging status are explicitly recorded as:
  - `no SemVer change`
  - Planned tag: `N/A`
