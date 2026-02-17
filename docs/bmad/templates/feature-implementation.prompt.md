# Prompt-Template: BMAD Feature (Implementation)

```text
Read docs/bmad/guides/CODEX_ENTRY.md.
Follow the routing and rules defined there (including the referenced policy).
Switch to Implementation Mode.

This is a BMAD Feature Implementation:
- <feature-slug> (<short-feature-intent>).

Implementation scope:
Implement strictly according to:
- docs/bmad/features/<feature-slug>/04-deliver.md

Do not implement behavior outside that document.

Problem:
- <problem-point-1>
- <problem-point-2>
- <problem-point-3>

SemVer Decision (required):
- SemVer Decision: `<SemVer PATCH | SemVer MINOR | SemVer MAJOR | no SemVer change>`
- Rationale:
  - `<rationale-point-1>`
  - `<rationale-point-2>`
- Planned tag: `<vX.Y.Z | N/A>`

Expected behavior (binding):

A) <contract-block-a>
- <rule-a1>
- <rule-a2>
- <rule-a3>

B) <contract-block-b>
- <rule-b1>
- <rule-b2>
- <rule-b3>

C) <contract-block-c>
- <rule-c1>
- <rule-c2>
- <rule-c3>

D) <normative-sequence-name> (exact ordering)
Implement EXACT ordering:
1) <step-1>
2) <step-2>
3) <step-3>
4) <step-4>
5) <step-5>

E) <lifecycle-and-async-guards>
- <lifecycle-rule-1>
- <lifecycle-rule-2>
- <lifecycle-rule-3>

F) <live-update-and-recovery>
- <recovery-rule-1>
- <recovery-rule-2>
- <recovery-rule-3>

G) <cache-or-state-namespacing>
- <namespace-rule-1>
- <namespace-rule-2>
- <namespace-rule-3>

H) Non-Regression Guarantees
- Do NOT modify:
  - <protected-area-1>
  - <protected-area-2>
  - <protected-area-3>
- <additional-non-regression-rule>

Rules (strict):
- Do not introduce behavior not present in `04-deliver.md`.
- Do not introduce hidden scope expansion.
- Do not add architecture decisions not documented in BMAD artifacts.
- Do not refactor unrelated code.
- Do not degrade performance characteristics defined in deliver acceptance criteria.
- Use `Minor Change (workflow)` terminology for workflow classification.
- `Minor Change (workflow)` is not the same as `SemVer MINOR`.
- Namespace clarifier: workflow classification uses `Minor Change (workflow)` / `BMAD Feature`; version classification uses `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.
- Declare an explicit version decision: `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR` / `no SemVer change`.
- Always append a mandatory entry to the canonical Minor Change (workflow) log according to the active mode (see CODEX_ENTRY.md) for any Minor adjustments done as part of this implementation (docs/process hygiene only).
- If planned tag is not `N/A` or the SemVer decision is not `no SemVer change`, update the canonical chat-handover document according to the active mode (see CODEX_ENTRY.md).
- If repository structure or workflow templates are affected, update:
  - docs/entry/LLM-bmad-briefing.md (Repro structure / Feature status sections) as needed.

Targets (only these files may change):
- <target-file-1>
- <target-file-2>
- <target-file-3>

Non-targets:
- <non-target-path-1>
- <non-target-path-2>

Validation (must pass):
- <typecheck-command>
- <build-or-test-command>

Functional validation matrix:
- <behavior-check-1>
- <behavior-check-2>
- <behavior-check-3>
- <regression-check-1>
- <regression-check-2>

If any requirement is unclear:
Stop implementation.
Write clarification request to:
- docs/bmad/features/<feature-slug>/questions.md

Proceed step-by-step.
Do not widen scope.

```
