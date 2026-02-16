# Minor Changes --- Governance Definition & Log

Generated on: <YYYY-MM-DD>

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

Example: minor/<scope>-<description>

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

If needed due to external dependency or cross-repo reference, a SemVer PATCH tag MAY be created (e.g., vX.Y.Z).

------------------------------------------------------------------------

## Log of Minor Changes

Use this section to record changes in chronological order.
| Version | Date | Scope | Description | PR reference |
|---|---|---|---|---|
| vX.Y.Z | YYYY-MM-DD | <scope> | <short description> | #<PR> |

------------------------------------------------------------------------

## Principles

-   Minor Changes are governance evolutions, not features.
-   They preserve BMAD's feature boundaries.
-   They reinforce documentation quality and consistency.
-   They provide traceable evolution outside of major feature rollouts.
