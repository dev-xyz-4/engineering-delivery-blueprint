# BMAD LLM Briefing Template

## Usage

This file is a reusable briefing template for starting a new
ChatGPT/Codex session.\
Replace all placeholders in `<...>` before use.

------------------------------------------------------------------------

## 1) Context / Goal

Project: - Name: `<project-name>` - Goal: `<one-sentence-goal>` -
Current focus: `<current-focus>`

Current Baseline Version: - `<latest-tag>`

BMAD Framework: - Workflow: Break -\> Model -\> Analyze -\> Deliver -
Implementation must strictly follow `04-deliver.md` - Decisions must be
documented, not inferred

------------------------------------------------------------------------

## 2) Relevant Repository Structure

Engineering layer lists representative examples only; consult the directory for the full set of governance docs.

``` text
docs/
  00-project/
    project-overview_EMPTY.md
    project-scope_EMPTY.md
    risk-profile_EMPTY.md
    architecture-overview_EMPTY.md
    glossary_EMPTY.md

  entry/
    ORCHESTRATION_INDEX.md

  bmad/
    README.md
    guides/
      CODEX_ENTRY.md
      CODEX_WORKFLOW_POLICY.md
      BMAD_DECISION_MATRIX.md
      BMAD_COMMIT_CONVENTIONS.md
      BMAD_SETUP_Lean_Integration.md
      TS_AUDIT_ROUTINE.md
      BMAD_ENFORCEMENT_ROADMAP.md
    templates/
      break.template.md
      model.template.md
      analyze.template.md
      deliver.template.md
      minor-change-log.template.md
      minor-change.prompt.md
      feature-implementation.prompt.md
      documentation-only.prompt.md
    notes/
      open-questions.md
      rejected-approaches.md
      decisions-log.md
      architecture-divergences.md
      ts-errors-template.md
      <optional-project-note>.md
    features/
      .keep
      <feature-slug>/  # example; created as needed
        01-break.md
        02-model.md
        03-analyze.md
        04-deliver.md
        questions.md

  _edb-development-history/
    ADR-0001-identity.md
    EDB_ENGINEERING_BASELINE.md
    EDB_CHAT_HANDOVER_PROTOCOL.md
    EDB_MINOR_CHANGE_LOG.md

  engineering/
    guides/
      SECURITY_SCOPE_GUIDE.md
      TESTING_SCOPE_GUIDE.md
      <additional-guides>.md
    templates/
      chat-handover.template.md
      engineering-baseline.template.md
      security.template.md
      testing-strategy.template.md
      <additional-templates>.md
```

------------------------------------------------------------------------

## 3) Binding Rules

-   `CODEX_WORKFLOW_POLICY.md` is the only normative source for Codex
    behavior.
-   `CODEX_ENTRY.md` acts as the router/entry point.
-   `docs/entry/ORCHESTRATION_INDEX.md` is the canonical startup map for
    authority boundaries (contextual, not normative).
-   Minor Changes must be documented in
    `docs/bmad/notes/minor-change-log.md`.
-   Minor Changes MUST append an entry to
    `docs/bmad/notes/minor-change-log.md`.
-   If version or governance baseline changes,
    `docs/entry/chat-handover-protocol.md` must be updated.
-   New structure, new contracts, or new system decisions require a BMAD
    Feature process.

------------------------------------------------------------------------

## 4) Current Feature Status (Template)

Feature: `<feature-slug-1>` - Status:
`<planned|in-progress|implemented|stabilizing>` - Documentation state:
`<01-04 complete|partial>` - Open issues: `<none|summary>`

Feature: `<feature-slug-2>` - Status:
`<planned|in-progress|implemented|stabilizing>` - Documentation state:
`<01-04 complete|partial>` - Open issues: `<none|summary>`

------------------------------------------------------------------------

## 5) Implementation Context

-   Governing implementation contract:
    `docs/bmad/features/<feature-slug>/04-deliver.md`

-   Open questions must be written to:
    `docs/bmad/features/<feature-slug>/questions.md`

-   Out-of-scope areas remain unchanged.

------------------------------------------------------------------------

## 6) Expected Working Style in Chat

-   Concise and precise answers
-   Clear classification: Minor Change vs BMAD Feature
-   Provide directly usable prompts when needed
-   No silent assumptions when requirements are incomplete
-   No scope drift
-   No structural changes without explicit classification
