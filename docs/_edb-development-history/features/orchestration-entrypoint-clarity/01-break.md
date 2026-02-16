# Break — orchestration-entrypoint-clarity

## 1) Problem Statement (one paragraph)
- The repository currently uses multiple entry and orientation artifacts (CODEX_ENTRY.md, EDB_CHAT_HANDOVER_PROTOCOL.md, and LLM-bmad-briefing-template.md) that each support startup context, but their boundaries and orchestration roles are not fully explicit. This can create ambiguity about which artifact is authoritative for routing vs session context vs reusable briefing, and that ambiguity is amplified by mixed placement of entry-related and template-related documents across BMAD and EDB history paths.

## 2) Goal
- Produce a clear BREAK-level analysis scope for Phase 2A that defines how entrypoint orchestration should be assessed, which artifact boundaries must be clarified, and which folder invariants must be documented before any structural or enforcement change is considered.

## 3) Non-Goals
- Do not implement structural moves, renames, or path migrations.
- Do not modify governance rules, enforcement logic, or scripts.
- Do not create ADRs, model/analyze/deliver documents, or implementation tasks in this step.
- Do not change project-facing BMAD/engineering docs during this BREAK-only phase.

## 4) Users / Actors (if any)
- EDB maintainers defining blueprint-internal governance and orchestration boundaries.
- Codex/LLM agents that must decide which entry artifact to read and follow.
- Downstream adopters who need a predictable starting point without EDB-history leakage.

## 5) Inputs / Outputs
### Inputs
- `docs/bmad/guides/CODEX_ENTRY.md`
- `docs/_edb-development-history/EDB_CHAT_HANDOVER_PROTOCOL.md`
- `docs/bmad/notes/LLM-bmad-briefing-template.md`
- Current folder layout across `docs/bmad/`, `docs/engineering/`, and `docs/_edb-development-history/`
- Existing concern list for misplaced/overlapping artifacts (including `docs/bmad/notes/ts-errors-template.md`)

### Outputs
- A scoped BREAK artifact that defines analysis boundaries for entrypoint clarity.
- A concrete list of orchestration and boundary questions to resolve in later BMAD phases.
- Acceptance direction for Phase 2A analysis without introducing implementation changes.

## 6) Constraints
- Technical:
  - Work stays in EDB Mode and under `docs/_edb-development-history/` for this feature track.
  - This phase is documentation analysis only; no code/tooling changes.
  - Must preserve existing routing authority model until explicitly changed in later phases.
- Performance:
  - No runtime or CI impact is allowed in BREAK phase.
- UX:
  - Future entrypoint guidance should reduce startup ambiguity for both humans and LLM agents.
- Compatibility:
  - Must remain compatible with existing CODEX routing and BMAD policy references.
- Legal/Compliance (if relevant):
  - No additional compliance scope is introduced in this phase.

## 7) Unknowns / Open Questions
- Should CODEX_ENTRY remain in `docs/bmad/guides/` or be conceptually mirrored by a higher-level entry index without changing authority?
- What is the strict contract boundary between chat handover (state transfer) and briefing template (session bootstrap scaffold)?
- Which artifact should be treated as canonical onboarding hub for new adopters vs maintainers?
- Is `docs/bmad/notes/ts-errors-template.md` a legitimate notes artifact or a misplaced template candidate?
- Which folder invariants must be formally stated (notes vs templates vs guides vs history vs entry) before any move is proposed?

## 8) Success Criteria (high level)
- The BREAK artifact clearly frames orchestration-entrypoint ambiguity without implementing changes.
- Scope is explicit enough to proceed to Model/Analyze with no hidden expansion.
- All identified concerns are expressed as analyzable questions and constraints.
- No non-target files are modified.
