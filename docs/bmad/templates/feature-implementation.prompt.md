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
- Append a mandatory entry to docs/bmad/notes/minor-changes.md for any Minor adjustments done as part of this implementation (docs/process hygiene only).
- If version changes or governance baseline changes, update:
  - docs/engineering/CHAT_HANDOVER_PROTOCOL.md (Latest Tag and Governance Baseline Includes section).
- If repository structure or workflow templates are affected, update:
  - docs/bmad/notes/LLM-bmad-briefing-template.md (Repro structure / Feature status sections) as needed.

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

