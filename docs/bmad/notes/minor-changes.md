# Minor Changes --- Governance Definition & Log

Generated on: 2026-02-13

------------------------------------------------------------------------

## Purpose

A **Minor Change** is a documented adjustment to repository governance,
documentation, or non-feature content that:

-   Does **not** constitute a new BMAD feature
-   Does **not** introduce new architectural contracts
-   Does **not** alter deliverable code behavior
-   Does **not** expand functional scope

Minor Changes are traceable, reviewable, and versioned corrections or
evolutions that maintain system quality.

------------------------------------------------------------------------

## What Counts as a Minor Change

A Minor Change is one of:

1.  Documentation fixes
    -   Typo corrections
    -   Clarity improvements
    -   Fixing truncated or malformed content
    -   Updating explanatory text
2.  Governance updates
    -   Updating policy language
    -   Clarifying procedures
    -   Adding clarifications to existing guides
3.  Template updates (non-structural)
    -   Adjusting template formatting
    -   Adding missing sample sections
    -   Improving placeholder guidance
4.  Process adjustments
    -   Enhancing branch-protection texts
    -   Adding commit hygiene checklists
    -   Refining versioning language

Does NOT include: new features, contracts, APIs, structural changes, or
new system modules.

------------------------------------------------------------------------

## What Is Not a Minor Change

Do not classify as Minor:

-   New BMAD features
-   Structural repository changes
-   Changes that introduce new workflows
-   Changes to enforcement mechanisms
-   Any code changes that affect functional behavior

Those must go through the BMAD Feature process.

------------------------------------------------------------------------

## Governance Criteria for Minor Changes

To qualify as a Minor Change, the update MUST:

1.  Be confined to documentation, templates, or policies.
2.  Not alter existing defined behaviors or contracts.
3.  Be justified with a clear rationale.
4.  Be traceable via commit messages and PR descriptions.
5.  Pass review and approval in a pull request.

------------------------------------------------------------------------

## Minor Change Workflow

### 1) Create a Minor Change Branch

Use a descriptive branch name:

minor/<scope>-<brief-description>

Example: minor/security-scope-guide-update

------------------------------------------------------------------------

### 2) Implement the Change

Make modifications only to the relevant docs/templates.

Every Minor Change MUST append a row to the Minor Changes Log table in this document.

------------------------------------------------------------------------

### 3) Commit with Conventional Message

Follow commit conventions:

docs: short description of change

Optionally prefix: minor: shorter scoped tag

------------------------------------------------------------------------

### 4) Open a Pull Request

The PR MUST:

-   Target main
-   Include:
    -   Clear description of purpose
    -   Rationale why this is a Minor Change
    -   List of files changed
-   Be merged after review

------------------------------------------------------------------------

### 5) Tag if Applicable

Minor Changes typically do not receive a new release version.

If needed due to external dependency or cross-repo reference, a patch
tag MAY be created (e.g., v1.0.1).

------------------------------------------------------------------------

## Log of Minor Changes

Use this section to record changes in chronological order.
| Version | Date | Scope | Description | PR reference |
|---|---|---|---|---|
| v1.0.1 | 2026-02-13 | versioning.md | Fixed truncated section. | tag: v1.0.1 |
| v1.1.0 | 2026-02-13 | minor-changes.md | Formalized minor change governance definition. | #2 |
| v1.2.0 | 2026-02-14 | SECURITY_SCOPE_GUIDE.md | Introduced SECURITY_SCOPE_GUIDE governance matrix. | tag: v1.2.0 |
| v1.3.0 | 2026-02-14 | CODEX_WORKFLOW_POLICY.md, minor-changes.md, SECURITY_SCOPE_GUIDE_EMPTY.md | Governance enforcement and cleanup. | #5 |
| v1.3.1 | 2026-02-13 | minor-changes.md | Log hygiene, formatting cleanup, PR reference normalization. |
| v1.4.0 | 2026-02-14 | security.template.md | Added structured security policy template aligned with SECURITY_SCOPE_GUIDE. | #<PR> |
| v1.5.0 | 2026-02-14 | TESTING_SCOPE_GUIDE.md | Introduced testing scope governance matrix. | #<PR> |
| v1.6.0 | 2026-02-14 | testing-strategy.template.md | Introduced testing strategy template aligned with TESTING_SCOPE_GUIDE. | #<PR> |
| v1.7.1 | 2026-02-14 | CHAT_HANDOVER_PROTOCOL.md update | Updated latest tag reference in CHAT_HANDOVER_PROTOCOL.md | #<PR> |
| v1.8.0 | 2026-02-14 | Prompt templates, LLM-bmad-briefing-template.md | Extracted BMAD prompt templates and standardized English briefing baseline. | #<PR> |
| v1.8.1 | 2026-02-14 | LLM-bmad-briefing-template.md, minor-changes.md | Synchronized briefing template repository tree with current repo structure. | #<PR> |
| v1.8.2 | 2026-02-14 | minor-changes.md | Added v1.8.2 log entry (patch: log completeness after v1.8.0 backfill). | #<PR> |
| v1.8.3 | 2026-02-14 | CHAT_HANDOVER_PROTOCOL.md, minor-changes.md | Updated handover baseline to v1.8.2 and aligned governance inclusions. | #<PR> |
| v1.8.4 | 2026-02-14 | README.md, BMAD_SETUP_Lean_Integration.md, TS_AUDIT_ROUTINE.md, BMAD_integration_core.LEGACY.md, CHAT_HANDOVER_PROTOCOL.md, minor-changes.md | Standardized German-language governance documentation to English (translation-only). | #<PR> |
| v1.8.5 | 2026-02-14 | pr-helper.sh, minor-changes.md, CHAT_HANDOVER_PROTOCOL.md | Added PR helper CLI for standardized branch/commit/PR/merge/sync/tag workflows with guardrails. | #<PR> |
| v1.8.6 | 2026-02-14 | pr-helper.sh, minor-changes.md, CHAT_HANDOVER_PROTOCOL.md | Enforced Conventional Commit PR titles, narrative PR body sections, and deterministic squash metadata in pr-helper. | #<PR> |
| v1.8.7 | 2026-02-14 | PR_HELPER_GUIDE.md, minor-changes.md, CHAT_HANDOVER_PROTOCOL.md | Added PR helper guide documenting required flags, workflows, narrative PR structure, and troubleshooting. | #<PR> |
| v1.8.8 | 2026-02-14 | pr-helper.sh, PR_HELPER_GUIDE.md, minor-changes.md, CHAT_HANDOVER_PROTOCOL.md | Extended doctor with governance PASS/WARN/FAIL checks for minor log and handover update conditions. | #<PR> |
| v1.8.9 | 2026-02-14 | pr-helper.sh, PR_HELPER_GUIDE.md, minor-changes.md, CHAT_HANDOVER_PROTOCOL.md | Corrected commit staged-only behavior; removed implicit staging and added explicit unstaged/no-staged failure messages. | #<PR> |
| v1.8.10 | 2026-02-14 | PR_HELPER_GUIDE.md, minor-changes.md, CHAT_HANDOVER_PROTOCOL.md | Clarified staged-only prerequisite wording and explicit doctor PASS/WARN/FAIL exit semantics in PR helper documentation. | #<PR> |
| v1.8.11 | 2026-02-14 | VERSIONING_GUIDE.md, minor-changes.md, CHAT_HANDOVER_PROTOCOL.md | Replaced VERSIONING guide placeholder with formal scope-based versioning governance matrix and definitions. | #<PR> |
| v1.8.12 | 2026-02-14 | BRANCH_WORKFLOW.md, minor-changes.md, CHAT_HANDOVER_PROTOCOL.md | Added branch workflow SOP with non-negotiables, pr-helper happy path, and recovery procedures for main-branch mistakes. | #<PR> |
| v1.8.13 | 2026-02-14 | RELEASE_GUIDE.md, minor-changes.md, CHAT_HANDOVER_PROTOCOL.md | Replaced RELEASE guide placeholder with formal scope-based release governance matrix and boundaries. | #<PR> |



------------------------------------------------------------------------

## Principles

-   Minor Changes are governance evolutions, not features.
-   They preserve BMAD's feature boundaries.
-   They reinforce documentation quality and consistency.
-   They provide traceable evolution outside of major feature rollouts.
