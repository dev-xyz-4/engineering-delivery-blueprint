# Break — phase-2b-branch-boundary-refactor

## 1) Problem Statement (one paragraph)
Phase-2B Branch Boundary Isolation identified a concrete owner-violation wording issue in `docs/engineering/guides/BRANCH_WORKFLOW.md`: the branch-domain statement `Treat tags as authoritative version markers.` creates effective versioning ownership semantics outside the declared SemVer owner. The execution problem is to remove this leakage while preserving branch-domain operational guidance and without changing SemVer semantics.

## 2) Goal
- Define a bounded execution scope for Branch boundary wording cleanup.
- Specify evidence-backed target statement(s) to transform in `BRANCH_WORKFLOW.md`.
- Define replacement intent:
  - preserve operational tagging guidance
  - remove authoritative version-meaning assertions from Branch domain
  - replace owner-violation phrasing with reference-only delegation to `docs/engineering/versioning.md`, without introducing new versioning semantics or structural sections
- Ensure outcome target:
  - Branch Governance reaches `Clean` under Phase-2B model rules.

## 3) Non-Goals
- No governance model redesign.
- No normative owner relocation.
- No lifecycle redesign.
- No SemVer model semantics change.
- No repository structure changes.
- No orchestrator logic.
- No scope expansion beyond Branch boundary wording cleanup.

## 4) Users / Actors (if any)
- EDB governance maintainers
- Engineering governance maintainers
- Workflow maintainers using branch SOP + pr-helper flow

## 5) Inputs / Outputs
### Inputs
- Phase-1 Core Governance Kernel Contract (single normative owners, authority boundaries, invariants I1-I7)
- `core-governance-kernel-refactor` checkpoints (C1-C5)
- Phase-2B Branch Boundary Isolation artifacts (`01-break`, `02-model`, `03-analyze`, `04-deliver`)
- `docs/engineering/guides/BRANCH_WORKFLOW.md`
- `docs/engineering/versioning.md` (sole normative versioning owner)
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
- `docs/engineering/guides/PR_HELPER_GUIDE.md` (operational context, non-owner)

### Outputs
- A break-level execution scope for Phase-2B Branch Boundary Refactor.
- Explicit transformation target list with evidence grounding.
- Defined success framing for achieving `Clean` branch-domain boundary classification.

## 6) Constraints
- Technical:
  - Wording-level refactor only.
  - No new governance obligations may be introduced.
  - No new references outside existing versioning owner path.
  - No implementation code changes.
  - No repository structure modifications.
- Performance:
  - Not applicable.
- UX:
  - Preserve operational clarity/usability of branch workflow instructions.
- Compatibility:
  - Preserve Phase-1 invariants and single-owner authority model.
- Legal/Compliance (if relevant):
  - Not applicable.
- Namespace clarifier:
  - Workflow classification uses `Minor Change (workflow)` / `BMAD Feature`.
  - Version classification uses `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.
- Explicit SemVer decision for this execution feature:
  - `SemVer PATCH` (wording-level authority cleanup, no model/semantic expansion).

## 7) Unknowns / Open Questions
- None identified at break stage.
- Any unknowns discovered later must be appended to:
  - `docs/_edb-development-history/features/phase-2b-branch-boundary-refactor/questions.md`

## 8) Success Criteria (high level)
- Evidence-backed target statement(s) are explicitly listed for transformation.
- Refactor scope remains wording-only and preserves operational tagging guidance.
- Branch-domain text no longer asserts authoritative version meaning.
- No implicit SemVer ownership semantics remain in Branch domain.
- Versioning-related meaning in Branch domain is delegated reference-only to `docs/engineering/versioning.md`.
- Branch Governance evaluates to `Clean` under Phase-2B model rules without SemVer semantics change.

## 9) Evidence-Backed Target Statements
- Primary target (owner-violation):
  - File: `docs/engineering/guides/BRANCH_WORKFLOW.md`
  - Section: `## Non-Negotiables`
  - Statement: `Treat tags as authoritative version markers.`
  - Evidence source: `docs/_edb-development-history/features/phase-2b-branch-boundary-isolation/03-analyze.md` (`BBI-001`).

- Operational statements to preserve (non-owner-violating context):
  - File: `docs/engineering/guides/BRANCH_WORKFLOW.md`
  - Sections: `## Happy Path (Using pr-helper)`, `## Relationship To pr-helper`
  - Statements:
    - `--versioning "SemVer PATCH expected"`
    - `Optional explicit tag` / `scripts/quality/pr-helper.sh tag --tag vX.Y.Z`
    - `Requires explicit --tag for tagging operations.`
