# Model — governance-cross-coherence-audit

## 1) System Overview (2–5 bullets)
- The audit model treats governance documentation as a layered system with distinct roles: BMAD guides (routing/process), Engineering guides (scope governance), Entry docs (operational startup surface), and EDB self-history (traceability).
- Coherence is evaluated by three axes: authority ownership, normative-language consistency, and duplication/reference discipline.
- The target state is consolidation-only: improve consistency and discoverability without changing governance semantics or introducing new domains.
- Mode-aware routing remains intact: Project Mode is default, EDB Mode is explicit override.

## 2) Key Concepts / Terms
- Authority Source: Document that owns normative behavior and cannot be overridden by contextual artifacts.
- Contextual Artifact: Document that helps onboarding/operation but must defer to authority sources.
- Normative Token: Words such as `MUST`, `SHOULD`, `required`, used with explicit intent and consistent scope.
- Duplication Class:
  - Harmless repetition: same meaning, low drift risk.
  - Drift-risk duplication: repeated guidance likely to diverge over time.
  - Authority-risk duplication: repeated normative rules outside the owning source.
- Relocation Candidate: File whose current folder role and content role are clearly mismatched.

## 3) Data Structures
- Name:
  - `DocumentProfile`
  - Fields:
    - `path`
    - `layer` (`BMAD | Engineering | Entry | EDB-History`)
    - `role` (`authority | contextual | template | history`)
    - `normative_tokens` (`MUST/SHOULD/required` counts + context tags)
    - `duplication_refs` (list of overlapping sections/targets)
    - `ownership_target` (single-source-of-truth owner, if any)
    - `relocation_candidate` (`yes|no`)
  - Meaning:
    - Normalized representation for cross-coherence comparison without changing source semantics.
  - Invariants:
    - Each rule statement maps to at most one `ownership_target`.
    - Contextual/template artifacts do not become authority owners.
    - Consolidation-only scope: model output cannot introduce new governance requirement types.

## 4) State Machine (if applicable)
### States
- Baseline Capture
- Coherence Mapping
- Conflict Classification
- Consolidation Proposal (analysis-only)

### Transitions
- Baseline Capture → Coherence Mapping: baseline v1.12.6 context loaded
- Coherence Mapping → Conflict Classification: overlaps and normative tokens indexed
- Conflict Classification → Consolidation Proposal (analysis-only): inconsistencies classified with no semantic expansion

## 5) Algorithms / Rules (if applicable)
- Rule:
  - Single Source-of-Truth Ownership
  - Inputs:
    - `DocumentProfile` set + authority-role tags
  - Output:
    - Ownership map (`rule-topic -> owning document`)
  - Notes:
    - If multiple owners appear for same rule-topic, classify as authority-risk.

- Rule:
  - Normative Language Standardization
  - Inputs:
    - Normative token occurrences and section context
  - Output:
    - Consistency report (`consistent | drift-risk | authority-risk`)
  - Notes:
    - `MUST/SHOULD/required` usage should align with document role and existing semantics.

- Rule:
  - Duplication Resolution Model
  - Inputs:
    - Cross-document overlaps
  - Output:
    - Keep/Link boundary map
  - Notes:
    - Authority documents keep normative text; contextual/template/history docs reference rather than restate.

- Rule:
  - Section Layout Standardization Pattern
  - Inputs:
    - Guide section structures across BMAD/Engineering layers
  - Output:
    - Structural alignment map (analysis-only)
  - Notes:
    - Harmonization target is readability/coherence; no normative meaning change.

- Rule:
  - Relocation Decision Criteria
  - Inputs:
    - Folder role vs content role mismatch indicators
  - Output:
    - Candidate list with confidence labels (analysis-only, no moves)
  - Notes:
    - Relocation considered only when mismatch is obvious and semantics remain unchanged.

## 6) Failure Modes / Edge Cases
- Ambiguous role text where a contextual document appears normative.
- Historical records containing old paths/names that should not be treated as active authority drift.
- Token-level false positives (`required` in descriptive prose vs normative requirement).
- Mixed-mode references (Project Mode default vs EDB Mode override) interpreted as conflict despite being intentional.
- Over-harmonization risk: accidental semantic alteration while resolving duplication.

## 7) Observability (optional)
- Logs:
  - Audit log entries capturing document classifications, duplication classes, and ownership conflicts.
- Metrics:
  - Count of authority-risk duplications.
  - Count of drift-risk duplications.
  - Count of relocation candidates (analysis-only).
  - Count of normative-token inconsistencies by layer.
