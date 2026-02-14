# Prompt-Template: Documentation-Only (Break)

```text
Read docs/bmad/guides/CODEX_ENTRY.md.
Follow the routing and rules defined there (including the referenced policy).
Work in Documentation-Only Mode.

Create:
- docs/bmad/features/<feature-slug>/01-break.md

Use:
- docs/bmad/templates/break.template.md

Context:
- Existing behavior/system contracts to consider:
  - <existing-contract-1>
  - <existing-contract-2>
  - <existing-contract-3>

Break focus:
- <requirement-1>
- <requirement-2>
- <requirement-3>
- <requirement-4>

Constraints:
- Preserve existing behavior outside scope.
- Do not invent new requirements.
- Do not write implementation code.
- Do not modify repository structure.
- Do not modify governance documents unless explicitly instructed.

Unknowns must be appended to:
- docs/bmad/features/<feature-slug>/questions.md

If the break introduces structural implications (e.g., new workflow categories, new governance areas):
- Stop and request clarification before proceeding.

```

