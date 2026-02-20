# Break — phase-2c-release-boundary-refactor

## 1) Problem Statement (one paragraph)
Phase-2C Release Boundary Isolation (modeling deliver artifact) classified the Release domain as `StructuralDrift` because `docs/engineering/guides/RELEASE_GUIDE.md` still contains versioning-owner boundary violations: local assertions about authoritative version meaning and a SemVer authority misreference to `docs/engineering/guides/VERSIONING_GUIDE.md`. This break defines the minimal wording-level refactor scope required to remove versioning-owner leakage while preserving valid Release-domain normative scope for release operations.

## 2) Goal
- Define minimal, wording-level refactor scope for removing versioning-owner boundary violations from `docs/engineering/guides/RELEASE_GUIDE.md`.
- Preserve allowed Release-domain normative scope (release requirement matrix and release-only criteria).
- Replace SemVer authority misreference with reference-only delegation to `docs/engineering/versioning.md`.
- Define objective post-refactor validation criteria for boundary compliance.

## 3) Non-Goals
- No governance model redesign.
- No authority-owner relocation.
- No SemVer model change.
- No lifecycle redesign.
- No new governance domains.
- No repository structure change.
- No implementation code changes.
- No orchestrator construction.

## 4) Users / Actors (if any)
- EDB governance maintainers
- Engineering governance maintainers
- Documentation maintainers for release/versioning governance

## 5) Inputs / Outputs
### Inputs
- Phase-1 Core Governance Kernel Contract (single normative owner per rule-topic; invariants I1-I7)
- Phase-2C Release Boundary Isolation deliver artifact (`release_domain_status = StructuralDrift`, corrected evidence mapping)
- `docs/engineering/guides/RELEASE_GUIDE.md`
- `docs/engineering/versioning.md` (sole normative versioning owner)
- `docs/engineering/guides/VERSIONING_GUIDE.md` (informational-only)

### Outputs
- Scoped break artifact for Phase-2C Release Boundary Refactor execution planning.
- Explicit target violation set for wording-level correction in `RELEASE_GUIDE.md`.
- Objective post-refactor validation framing.

## 6) Constraints
- Technical:
  - Documentation-only phase; no execution/refactor in this step.
  - Scope is wording-level only for identified boundary violations.
  - Preserve release-domain structure and allowed release-only normative content.
  - No governance document edits in this step.
- Performance:
  - Not applicable.
- UX:
  - Preserve readability and operational utility of `RELEASE_GUIDE.md`.
- Compatibility:
  - Preserve Phase-1 invariants and single-owner contract.
- Legal/Compliance (if relevant):
  - Not applicable.
- Namespace clarifier:
  - Workflow classification uses `Minor Change (workflow)` / `BMAD Feature`.
  - Version classification uses `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.
- Explicit version decision (documentation-only break stage):
  - `no SemVer change`

## 7) Unknowns / Open Questions
- No blocking unknowns identified at break stage.
- If unknowns arise, append to:
  - `docs/_edb-development-history/features/phase-2c-release-boundary-refactor/questions.md`

## 8) Success Criteria (high level)
- Refactor scope is limited to versioning-owner boundary violations in `RELEASE_GUIDE.md`.
- Allowed Release-domain normative scope is explicitly preserved.
- SemVer authority reference target is defined as `docs/engineering/versioning.md` only.
- Objective post-refactor criteria are explicit:
  - `duplication_count = 0`
  - `versioning_leakage_count = 0`
  - `release_domain_status = Clean`
  - no statement in Release domain asserts SemVer ownership/authority location outside `docs/engineering/versioning.md`
  - Release-domain operational/normative release criteria remain intact.

## 9) Stop Condition
- If this break implies:
  - new workflow categories,
  - new governance domains/areas,
  - authority-owner relocation,
  - lifecycle redesign,
  - or SemVer model modification,
  stop and request clarification before proceeding.
