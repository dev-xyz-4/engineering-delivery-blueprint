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
- Use `Minor Change (workflow)` terminology for workflow classification.
- `Minor Change (workflow)` is not the same as `SemVer MINOR`.
- Declare an explicit version decision: `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR` / `no SemVer change`.
- Append a mandatory entry to the canonical Minor Change (workflow) log according to the active mode (see CODEX_ENTRY.md).
- If version changes or governance baseline changes, update the canonical chat-handover document according to the active mode (see CODEX_ENTRY.md).
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
- Explicit version decision is documented as `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR` / `no SemVer change`.
- The canonical Minor Change (workflow) log (per active mode) contains a new log entry.
- Required governance documents updated if applicable.

```
