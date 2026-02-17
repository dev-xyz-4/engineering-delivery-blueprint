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

SemVer Decision (required):
- SemVer Decision: `<SemVer PATCH | SemVer MINOR | SemVer MAJOR | no SemVer change>`
- Rationale:
  - `<rationale-point-1>`
  - `<rationale-point-2>`
- Planned tag: `<vX.Y.Z | N/A>`

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
- Namespace clarifier: workflow classification uses `Minor Change (workflow)` / `BMAD Feature`; version classification uses `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.
- Declare an explicit version decision: `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR` / `no SemVer change`.
- Always append a mandatory entry to the canonical Minor Change (workflow) log according to the active mode (see CODEX_ENTRY.md).
- If planned tag is not `N/A` or the SemVer decision is not `no SemVer change`, update the canonical chat-handover document according to the active mode (see CODEX_ENTRY.md).
- If repository structure or workflow templates are affected, update:
  - docs/entry/LLM-bmad-briefing.md (Repro structure / Feature status sections) as needed.

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
- SemVer rationale (1-2 bullets) and planned tag (`vX.Y.Z` or `N/A`) are documented.
- The canonical Minor Change (workflow) log (per active mode) contains a new log entry.
- Canonical chat-handover update is present when SemVer decision is not `no SemVer change` or planned tag is set.
- Required governance documents updated if applicable.

```
