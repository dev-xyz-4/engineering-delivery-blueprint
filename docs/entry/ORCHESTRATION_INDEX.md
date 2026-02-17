# ORCHESTRATION INDEX

## Purpose

This document is the canonical startup map for orchestration across the Engineering Delivery Blueprint (EDB).

It clarifies which artifacts are authoritative for routing and policy, and which artifacts are contextual state/briefing helpers.

This index does not replace policy documents.
This document is descriptive, not normative.

---

## Authority Boundary Model

### Routing authority
- `docs/bmad/guides/CODEX_ENTRY.md`
- Role: deterministic entry router for Codex task flow and mode-aware path targeting.

### Policy authority
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
- Role: single normative source for Codex behavior.

### State snapshot artifacts
- Project Mode: `docs/entry/chat-handover-protocol.md`, `docs/engineering/engineering-baseline.md`
- EDB Mode: `docs/_edb-development-history/EDB_CHAT_HANDOVER_PROTOCOL.md`, `docs/_edb-development-history/EDB_ENGINEERING_BASELINE.md`
- Role: operational/current-state transfer for new sessions.

### Reusable templates
- BMAD templates: `docs/bmad/templates/*`
- Engineering templates: `docs/engineering/templates/*`
- Role: reusable scaffolds, not authoritative policy or live state.

### Briefing template
- `docs/entry/LLM-bmad-briefing.md`
- Role: contextual briefing scaffold for session startup; not routing/policy authority.

---

## Canonical Startup Path

1. Read routing entry:
   - `docs/bmad/guides/CODEX_ENTRY.md`
2. Follow routed mandatory reading set:
   - including `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
3. Apply mode-aware target paths from `CODEX_ENTRY.md`:
   - Project Mode or EDB Mode
4. Use handover/baseline artifacts for current state context
5. Use templates only as scaffolds; do not treat templates as live policy/state

---

## Mode Safety

### Project Mode (default)
- Live targets:
  - `docs/bmad/notes/minor-change-log.md`
  - `docs/entry/chat-handover-protocol.md`
  - `docs/engineering/engineering-baseline.md`

### EDB Mode
- Live targets:
  - `docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md`
  - `docs/_edb-development-history/EDB_CHAT_HANDOVER_PROTOCOL.md`
  - `docs/_edb-development-history/EDB_ENGINEERING_BASELINE.md`

Do not mix write targets across modes.

---

## Governance Namespace Clarifier

- Workflow namespace:
  - `Minor Change (workflow)` / `BMAD Feature`
- Version namespace:
  - `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`

These namespaces are orthogonal and must not be conflated.

---

## Related Documents

- `docs/bmad/guides/CODEX_ENTRY.md`
- `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md`
- `docs/_edb-development-history/ADR-0002-orchestration-entrypoint-architecture.md`
