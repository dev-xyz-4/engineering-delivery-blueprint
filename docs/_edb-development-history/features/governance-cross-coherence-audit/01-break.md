# Break — governance-cross-coherence-audit

## 1) Problem Statement (one paragraph)
- Governance documentation has evolved across BMAD, Engineering, Entry, and EDB self-history layers. While baseline state is currently stable at v1.12.6, cross-document wording and structure may still contain drift patterns (normative phrasing inconsistencies, duplicated guidance, and potential source-of-truth ambiguity). A dedicated break-phase audit definition is required to evaluate cross-coherence without introducing semantic changes, workflow changes, or new governance domains.

## 2) Goal
- Define a documentation-only audit scope for cross-coherence validation across governance guides and adjacent entry artifacts.
- Confirm consolidation-only intent: detect inconsistencies and relocation candidates without changing governance meaning.
- Preserve baseline semantics at v1.12.6 while preparing structured findings for later phases.

## 3) Non-Goals
- No implementation code changes.
- No routing, policy, or enforcement semantics changes.
- No new governance domains, workflow categories, or architectural contracts.
- No immediate file relocations during this break phase.

## 4) Users / Actors (if any)
- Repository maintainers operating in EDB Mode.
- Governance editors aligning wording and structure.
- Downstream users who depend on clear Project Mode defaults and authoritative source boundaries.

## 5) Inputs / Outputs
### Inputs
- Governance baseline state at v1.12.6.
- Mode-aware routing model (Project Mode default, EDB Mode override).
- Existing authority split: entry vs template vs self-history vs guides.
- Minor Change (workflow) and SemVer namespace boundaries.

### Outputs
- A clearly bounded audit definition for cross-coherence review.
- Criteria for detecting normative-language inconsistency, duplication, and contradictions.
- Candidate list criteria for possible relocation to `docs/entry/` (analysis only, no moves).
- Explicit confirmation that the track is consolidation-only and non-expansive.

## 6) Constraints
- Technical: Documentation-only scope; no code, scripts, or enforcement logic changes.
- Performance: Not applicable (no runtime changes).
- UX: Improve clarity and reduce interpretation risk without altering behavior.
- Compatibility: Preserve existing references and governance semantics at v1.12.6.
- Legal/Compliance (if relevant): Maintain existing governance boundary language; no compliance model changes.

## 7) Unknowns / Open Questions
- No blocking unknowns identified at break stage.
- If structural implications emerge during later audit phases (for example new workflow categories or governance areas), stop and append questions to `docs/_edb-development-history/features/governance-cross-coherence-audit/questions.md`.

## 8) Success Criteria (high level)
- Break scope explicitly covers cross-coherence audit across BMAD / Engineering / Entry layers.
- Consolidation-only intent is explicit and unambiguous (no semantic expansion).
- Namespace separation is preserved: `Minor Change (workflow)` / `BMAD Feature` vs `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`.
- Scope is actionable for subsequent Model/Analyze phases without requiring governance changes in this step.
