# TypeScript Audit Routine (BMAD-compliant)

## Purpose
The TS audit supports a structured decision on
whether TypeScript errors can be fixed as **Minor Changes**
or represent a **BMAD trigger** (new contract / new architecture).

The audit is a **diagnostic tool**, not a mandatory artifact for every feature.

---

## Standard Rule
- **Default gate:** `tsc --noEmit` (or `npm run typecheck`) must be green.
- No audit protocol is required for 0–2 trivial TS errors.

---

## When to run a TS audit?
Run an audit script (`ts:audit:*`) when at least one of the following applies:

- > 3–5 TS errors at the same time
- Errors are concentrated in:
  - a central UI component (`<critical-ui-file>`)
  - a central domain entity (`<core-domain-module>`)
  - dataflow/mapping logic (`<mapping-layer>`)
  - history/transaction logic (`<history-layer>`)
- Uncertainty whether the fix:
  - is only type narrowing (**Minor Change (workflow)**)
  - or implies a new contract (**BMAD**)

---

## Audit Output
An audit produces a Markdown protocol containing:

- TS code + original error message
- file + line/column
- code context
- classification:
  - `Minor Change (workflow)`
  - `BMAD-TRIGGER`
- short rationale
- fix direction (non-implementing)

Example:
`docs/bmad/notes/ts-audits/YYYY-MM-DD-<scope>.md`

### Repo Integration (Template)
- Standard script file: `scripts/ts-audit-chart.mjs`
- Standard command: `node scripts/ts-audit-chart.mjs --project <project-dir> --target <relative-file>`
- Optional NPM command: `npm run <ts-audit-command>`

When adopting this routine in another repository:
- carry over/adapt script path and NPM script
- update output path in the guide accordingly

---

## Classification Rules (Short Form)

### Minor Change (workflow)
- null / undefined guards
- union narrowing
- event, ref, hook types
- generics / imports
- local prop or callback types
- type consistency at API boundaries (without semantic changes)

### BMAD-TRIGGER
- new persistent state
- change of interaction contracts
- change of central entity relationships
- changes in mapping/orchestration logic
- change of undo/redo or transaction semantics
- multiple plausible architecture options

If in doubt: **BMAD-TRIGGER**.

---

## Versioning of Audit Protocols
Audit protocols are **not committed automatically**.

Commit a protocol only if:
- a larger fix sweep was performed
- a BMAD trigger is documented
- a fix decision must be traceable later

Recommended naming:
`docs/bmad/notes/ts-audits/YYYY-MM-DD-<scope>.md`

---

## Definition of Done (for TS stabilization)
- `npm run typecheck` is green
- audit run and evaluated if applicable
- all remaining errors are consciously:
  - fixed (Minor Change (workflow))
  - or documented (BMAD / deferred)

---

## Non-Goals
- no replacement for BMAD Break/Model/Analyze
- no automatic refactoring
- no "greenwashing" via `any` or TS disable
