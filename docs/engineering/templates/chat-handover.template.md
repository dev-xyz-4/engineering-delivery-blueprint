# CHAT_HANDOVER_PROTOCOL TEMPLATE

This is a template scaffold. Downstream projects should maintain the live document at `docs/engineering/chat-handover-protocol.md`.

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

This repository is an **<repository-identity>**.

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
- Append entry to <minor-change-log-path>
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
<latest-tag>

Governance Baseline Includes:

- <baseline-item-1>
- <baseline-item-2>
- <baseline-item-3>

Minor Change log is complete and enforced.

---

# 6. Current Focus

<UPDATE THIS SECTION BEFORE STARTING A NEW CHAT>

Example:
- <next-target-1>
- <next-target-2>
- <next-target-3>

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
