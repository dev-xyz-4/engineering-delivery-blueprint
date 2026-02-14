# Prompt-Template: Minor Change (Implementation)

```text
Read docs/bmad/guides/CODEX_ENTRY.md.
Follow the routing and rules defined there (including the referenced policy).
Switch to Implementation Mode.

This task is a Minor Change.

Fix:
- <short-minor-change-title>

Problem:
- <problem-point-1>
- <problem-point-2>

Expected behavior:
- When <condition>:
  - <expected-point-1>
  - <expected-point-2>
- Out of scope:
  - <out-of-scope-point>

Rules:
- Do not introduce new features or architecture.
- Do not refactor unrelated files.
- Preserve behavior outside this fix.
- Append a mandatory entry to docs/bmad/notes/minor-changes.md.
- If version changes or governance baseline changes, update:
  - docs/engineering/CHAT_HANDOVER_PROTOCOL.md (Latest Tag and Governance Baseline Includes section).
- If repository structure or workflow templates are affected, update:
  - docs/bmad/notes/LLM-bmad-briefing-template.md (Repro structure / Feature status sections) as needed.

If requirements are missing or ambiguous:
- Stop implementation.
- Append open points to docs/bmad/features/<feature-slug>/questions.md.

Targets:
- <primary-target-file>
- <optional-secondary-target-file>

Validation:
- <validation-step-1>
- <validation-step-2>
- <regression-check-1>
- docs/bmad/notes/minor-changes.md contains a new log entry.
- Required governance documents updated if applicable.

```