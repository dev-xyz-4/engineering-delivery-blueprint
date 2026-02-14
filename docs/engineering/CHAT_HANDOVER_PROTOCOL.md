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

This repository is a **professional governance-first blueprint**.

It separates three structural layers:

1) docs/00-project  
   → Project identity (scope, risk profile, architecture overview, glossary)

2) docs/bmad  
   → Feature governance (Break → Model → Analyze → Deliver)  
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
- Append entry to docs/bmad/notes/minor-changes.md
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

MAJOR  
→ Structural or architectural change

MINOR  
→ Governance expansion (new guides, new templates)

PATCH  
→ Documentation hygiene, log corrections, formatting fixes

Tags are authoritative.
Releases optional for PATCH, recommended for MINOR+.

---

# 5. Current Repository State

Latest Tag:
v1.8.13

Governance Baseline Includes:

- Minor Change governance formalized (policy-backed)
- Mandatory Minor log enforcement (policy-backed)
- SECURITY_SCOPE_GUIDE.md
- security.template.md
- TESTING_SCOPE_GUIDE.md
- VERSIONING_GUIDE.md
- RELEASE_GUIDE.md
- BRANCH_WORKFLOW.md
- testing-strategy.template.md
- Prompt templates in docs/bmad/templates (*.prompt.md)
- LLM-bmad-briefing-template.md repository tree sync
- Repository governance documentation standardized to English
- PR helper CLI for standardized workflow execution (branch/commit/PR/merge/sync/tag)
- Deterministic PR metadata flow (Conventional titles + narrative body + squash subject/body parity)
- PR helper usage formally documented in PR_HELPER_GUIDE.md
- PR helper doctor strengthened with governance PASS/WARN/FAIL validation checks
- PR helper commit corrected to staged-only behavior with explicit unstaged/no-staged failure conditions
- PR_HELPER_GUIDE clarified staged-only prerequisites and explicit doctor exit semantics
- Branch protection enabled
- PR-based workflow verified
- CHAT_HANDOVER_PROTOCOL

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
