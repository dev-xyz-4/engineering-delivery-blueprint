# TypeScript Error Audit - Template

Canonical scaffold template (non-authoritative).
Not routing authority, not policy authority.
For day-to-day startup context, prefer entry-surface docs under `docs/entry/`.

## 0) Meta
- Date: `<YYYY-MM-DD>`
- Scope: `<module-or-feature>`
- Auditor: `<name-or-agent>`
- Audit script: `scripts/ts-audit-chart.mjs`
- Audit command: `node scripts/ts-audit-chart.mjs --project <project-dir> --target <relative-file>`
- Baseline command: `<tsc --noEmit | npm run typecheck>`

## 1) Summary
- Total errors observed: `<number>`
- Estimated Minor Change (workflow) fixes: `<number>`
- Estimated BMAD-TRIGGER fixes: `<number>`
- Recommended next step: `<minor-change-fix-pass | start-bmad-feature | mixed>`

## 2) Error Entries
Repeat this block per error cluster.

### Entry `<id>`
- TS code: `<e.g. TS2322>`
- File: `<path/to/file.ts>`
- Line/Column: `<line:column>`
- Message (short): `<compiler-message>`
- Context (short): `<what the code is doing>`
- Classification: `<Minor Change (workflow) | BMAD-TRIGGER>`
- Rationale: `<why this classification>`
- Fix direction (non-implementing): `<high-level approach>`
- Risk if unchanged: `<low|medium|high>`

## 3) Classification Notes
### Minor Change (workflow) indicators
- Type narrowing/guards missing
- Local type mismatch without behavior change
- Generic or import typing inconsistency

### BMAD-TRIGGER indicators
- New state or contract required
- Cross-module behavior/architecture change required
- Multiple valid design options with trade-offs

## 4) Decision Log
- Decision: `<chosen path>`
- Why: `<short rationale>`
- Deferred items: `<optional list>`

## 5) Exit Criteria
- [ ] Typecheck command is green
- [ ] Remaining errors are documented with owner and plan
- [ ] BMAD triggers were moved into feature docs (if any)
