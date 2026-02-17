# CODEX Entry

This document is the **single entry point** for using Codex in this repository.
All Codex-assisted work must start here.

---

## Mandatory Reading Order

Codex must read these documents before starting any task.
The authoritative rules for Codex behavior are defined in
`docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`.

Reading order:

1. `docs/bmad/README.md`
2. `docs/bmad/guides/BMAD_DECISION_MATRIX.md`
3. `docs/bmad/guides/BMAD_SETUP_Lean_Integration.md`
4. `docs/bmad/guides/BMAD_COMMIT_CONVENTIONS.md`
5. `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`

These documents define the process, classification, and commit discipline.

---

## What To Do Next

After reading the documents above:

- Classify the task via `BMAD_DECISION_MATRIX.md`.
- Follow `CODEX_WORKFLOW_POLICY.md` for process behavior.
- Follow `BMAD_COMMIT_CONVENTIONS.md` for commit format and review expectations.
- Use `docs/entry/ORCHESTRATION_INDEX.md` as the canonical startup map for authority boundaries and mode-aware context (non-normative helper).

If classified as BMAD Feature:
- Work in `docs/bmad/features/<feature-name>/`.

If classified as Minor Change:
- Update the canonical Minor Change log according to the active mode (see Mode-Aware Routing below).


---

## Mode-Aware Routing

There are two operating modes:

### Project Mode (default)
Used by downstream projects.

Codex must write to:
- `docs/bmad/notes/minor-change-log.md`
- `docs/engineering/chat-handover-protocol.md`
- `docs/engineering/engineering-baseline.md`

### EDB Mode (blueprint development only)
Activated when .planning/EDB_MODE exists locally (gitignored) or EDB_MODE=1 is set.

Codex must write to:
- `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md`
- `docs/_edb-development-history/EDB_CHAT_HANDOVER_PROTOCOL.md`
- `docs/_edb-development-history/EDB_ENGINEERING_BASELINE.md`

If no mode indicator is present, Project Mode applies.

Guides and prompts route to downstream live documents.
`docs/_edb-development-history/` is blueprint-only self-history.
`docs/entry/ORCHESTRATION_INDEX.md` is a contextual orchestration map and does not replace policy authority.

---

## Final Rule

> ENTRY routes to the governing documents.  
> Codex behavior rules live exclusively in  
> `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`.
>  
> The Decision Matrix provides classification only.
