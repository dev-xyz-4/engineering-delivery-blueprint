# Break — phase-2b-branch-boundary-isolation

## 1) Problem Statement (one paragraph)
Phase-2A classified Branch Governance as `Minor Drift`, indicating boundary ambiguity between lifecycle-operational branch workflow guidance and versioning-rule ownership. The current problem is to isolate Branch Governance strictly as an operational lifecycle domain while preventing effective SemVer ownership leakage from branch artifacts, especially around tagging and version-adjacent wording.

## 2) Goal
- Define the Phase-2B problem scope for Branch Boundary Isolation.
- Identify where versioning-rule leakage exists in `docs/engineering/guides/BRANCH_WORKFLOW.md`.
- Establish analysis framing for allowed vs prohibited versioning-related phrasing in Branch Governance.
- Explicitly distinguish between:
  - operational tagging guidance (allowed)
  - versioning-rule definition or SemVer authority assertions (prohibited)
- Confirm Branch Governance target role:
  - operational
  - reference-only for versioning
  - non-authoritative for SemVer

## 3) Non-Goals
- No governance model redesign.
- No authority-owner relocation.
- No new governance domains.
- No orchestrator logic/modeling.
- No repository restructuring.
- No implementation/refactor execution in this break.
- No modification of `docs/engineering/versioning.md`.

## 4) Users / Actors (if any)
- EDB governance maintainers
- Engineering governance maintainers
- Phase-2 lifecycle harmonization planners

## 5) Inputs / Outputs
### Inputs
- Phase-1 Core Governance Kernel Contract (single normative owners, authority boundaries, invariants I1-I7)
- `core-governance-kernel-refactor` checkpoints (C1-C5)
- Phase-2A lifecycle repo gap analysis outputs
- `docs/engineering/guides/BRANCH_WORKFLOW.md`
- `docs/engineering/versioning.md` (sole normative versioning owner)
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`

### Outputs
- A bounded break artifact for Phase-2B Branch Boundary Isolation.
- Clear analysis scope for identifying versioning leakage in Branch Governance.
- Explicit framing for operational-only Branch Governance with versioning delegation.

## 6) Constraints
- Technical:
  - Documentation-only; no code changes.
  - No repository structure modifications.
- Performance:
  - Not applicable.
- UX:
  - Preserve readability and operational utility of Branch domain analysis.
- Compatibility:
  - Preserve Phase-1 authority invariants and declared normative owners.
- Legal/Compliance (if relevant):
  - Not applicable.
- Namespace clarifier:
  - Workflow classification uses `Minor Change (workflow)` / `BMAD Feature`.
  - Version classification uses `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.
- Explicit version decision:
  - `no SemVer change` (documentation-only modeling stage).

## 7) Unknowns / Open Questions
- No structural-governance unknowns identified at break stage.
- Any unknowns discovered in subsequent phases must be appended to:
  - `docs/_edb-development-history/features/phase-2b-branch-boundary-isolation/questions.md`

## 8) Success Criteria (high level)
- Branch Governance isolation scope is explicit and bounded to lifecycle-operational responsibilities.
- Versioning leakage detection scope in `BRANCH_WORKFLOW.md` is explicit and evidence-ready.
- Allowed vs prohibited versioning-related phrasing boundaries are clearly defined for analysis.
- Break scope does not imply lifecycle redesign, authority-model modification, or versioning owner relocation.
- Artifact is sufficient to proceed to `02-model.md` without introducing new requirements.
