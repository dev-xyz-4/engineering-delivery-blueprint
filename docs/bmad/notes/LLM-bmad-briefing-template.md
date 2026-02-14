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

``` text
docs/
  00-project/
    project-overview.md
    project-scope.md
    risk-profile.md
    architecture-overview.md
    glossary.md

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
    notes/
      minor-changes.md
      open-questions.md
      rejected-approaches.md
      decisions-log.md
      architecture-divergences.md
      <optional-project-note>.md
    features/
      <feature-slug>/
        01-break.md
        02-model.md
        03-analyze.md
        04-deliver.md
        questions.md

  engineering/
    CHAT_HANDOVER_PROTOCOL.md
    guides/
      SECURITY_SCOPE_GUIDE.md
      TESTING_SCOPE_GUIDE.md
      <additional-guides>.md
    templates/
      security.template.md
      testing-strategy.template.md
      <additional-templates>.md
```

------------------------------------------------------------------------

## 3) Binding Rules

-   `CODEX_WORKFLOW_POLICY.md` is the only normative source for Codex
    behavior.
-   `CODEX_ENTRY.md` acts as the router/entry point.
-   Minor Changes must be documented in
    `docs/bmad/notes/minor-changes.md`.
-   Minor Changes MUST append an entry to
    `docs/bmad/notes/minor-changes.md`.
-   If version or governance baseline changes,
    `docs/engineering/CHAT_HANDOVER_PROTOCOL.md` must be updated.
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
