# CHAT_HANDOVER_PROTOCOL

## Purpose

This document provides the minimal required context for continuing work in a new ChatGPT session without reloading full repository history.

It defines:

- Repository structure
- Governance model
- Versioning discipline
- Workflow rules
- Current system state

This file must be kept up to date when major governance milestones are reached.

---

# 1. Repository Purpose

This repository is an **Engineering Delivery Blueprint (EDB)**.

It separates three structural layers:

1) docs/00-project  
   → Project identity (scope, risk profile, architecture overview, glossary)

2) docs/bmad  
   → BMAD-powered delivery operating model (Break → Model → Analyze → Deliver)  
   → Minor vs Feature classification  
   → Commit conventions  
   → CODEX workflow enforcement

3) docs/engineering  
   → Engineering governance  
   → Security  
   → Testing  
   → Versioning  
   → Release discipline  
   → Templates & Guides

Additionally:
- scripts/quality → quality automation layer

---

# 2. Governance Model

## BMAD Feature Workflow
Used for:
- New features
- Structural changes
- New enforcement mechanisms
- Architectural decisions

## Minor Change Workflow
Used for:
- Documentation updates
- Governance refinements
- Template additions
- Log hygiene
- Placeholder removals

Minor Changes MUST:
- Go through PR
- Append entry to docs/_edb-development-history/EDB_MINOR_CHANGE_LOG.md
- Not introduce architecture
- Not expand feature scope

Enforced in:
- docs/bmad/guides/CODEX_WORKFLOW_POLICY.md

---

# 3. Branching & PR Discipline

- main branch protected
- All changes via Pull Request
- Squash merge preferred
- No direct commits to main

Local cleanup required after merge:
- Delete local branch
- Delete remote branch if not auto-deleted

---

# 4. Versioning Discipline

Semantic Versioning strictly applied:

SemVer MAJOR  
→ Structural or architectural change

SemVer MINOR  
→ Governance expansion (new guides, new templates)

SemVer PATCH  
→ Documentation hygiene, log corrections, formatting fixes

Tags are authoritative.
Releases optional for SemVer PATCH, recommended for SemVer MINOR+.

---

# 5. Current Repository State

Latest Tag:
v1.12.12

Governance Baseline Includes:

- Minor Change governance formalized (policy-backed)
- Mandatory Minor log enforcement (policy-backed)
- SECURITY_SCOPE_GUIDE.md
- security.template.md
- TESTING_SCOPE_GUIDE.md
- VERSIONING_GUIDE.md
- RELEASE_GUIDE.md
- PERFORMANCE_GUIDE.md
- OBSERVABILITY_SCOPE_GUIDE.md
- GOVERNANCE_MODEL.md
- ORCHESTRATION_INDEX.md
- EDB_ENGINEERING_BASELINE.md
- ADR-0001-identity.md (EDB identity declaration)
- ADR-0002-orchestration-entrypoint-architecture.md
- EDB_CHAT_HANDOVER_PROTOCOL.md
- EDB_MINOR_CHANGE_LOG.md
- BRANCH_WORKFLOW.md
- testing-strategy.template.md
- Prompt templates in docs/bmad/templates (*.prompt.md)
- chat-handover.template.md
- engineering-baseline.template.md
- minor-change-log.template.md
- adr.template.md
- LLM-bmad-briefing-template.md repository tree sync
- Repository governance documentation standardized to English
- PR helper CLI for standardized workflow execution (branch/commit/PR/merge/sync/tag)
- Deterministic PR metadata flow (Conventional titles + narrative body + squash subject/body parity)
- PR helper usage formally documented in PR_HELPER_GUIDE.md
- PR helper doctor strengthened with governance PASS/WARN/FAIL validation checks
- PR helper commit corrected to staged-only behavior with explicit unstaged/no-staged failure conditions
- PR_HELPER_GUIDE clarified staged-only prerequisites and explicit doctor exit semantics
- Terminology separation clarified: Minor Change (workflow) vs SemVer PATCH/MINOR/MAJOR
- BMAD implementation prompts require explicit SemVer Decision, rationale, planned tag, and decision-bound canonical log/handover updates via CODEX_ENTRY routing
- Phase 2B hybrid orchestration model implemented (entry role layered on guides + canonical orchestration startup map)
- Branch protection enabled
- PR-based workflow verified
- Self-history/template separation for handover, baseline, and minor-change log
- Versioning authority contract enforcement: `docs/engineering/versioning.md` is explicit sole normative owner and `docs/engineering/guides/VERSIONING_GUIDE.md` is informational-only
- Core governance kernel refactor consolidation (C2-C5): routing docs are delegation-only, minor-change logs are historical-only, templates are structural/reference-only, and non-owner artifacts delegate governance authority to `docs/bmad/guides/CODEX_WORKFLOW_POLICY.md` and `docs/engineering/versioning.md`

Minor Change log is complete and enforced.

---

# 6. Current Focus

<UPDATE THIS SECTION BEFORE STARTING A NEW CHAT>

Example:
- Introduce VERSIONING_GUIDE
- Introduce release.template.md
- Expand ADR governance
- Define CI minimal governance layer

---

# 7. Instructions for New Chat

When starting a new ChatGPT session:

1. Provide this file.
2. State:
   - Current version
   - Next target
   - Whether change is Minor or Feature
3. Request template-conform BMAD prompt generation if applicable.

No need to restate:
- Branch protection rules
- Versioning logic
- Minor log requirement
- Repository structure

All governance rules are defined above.
