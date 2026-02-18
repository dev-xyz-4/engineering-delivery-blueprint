# VERSIONING GUIDE (Informational)

Generated on: 2026-02-14
Last updated: 2026-02-18

------------------------------------------------------------------------

## Normative Ownership Boundary

`docs/engineering/versioning.md` is the sole normative source for versioning rule-topics.

This guide is reference-only:
- It explains how to read and apply the versioning policy.
- It does not define or override binding versioning rules.
- It does not change BMAD workflow governance.

------------------------------------------------------------------------

## Purpose

Provide explanatory orientation for versioning decisions by project context.

Use this guide for:
- onboarding and interpretation support
- examples of context signals to evaluate
- quick navigation to the owner policy

For binding decisions and final rule interpretation, consult:
- `docs/engineering/versioning.md`

------------------------------------------------------------------------

## Context Signals (Explanatory)

Teams usually evaluate versioning strictness based on factors such as:
- distribution surface
- external dependency exposure
- user impact of breaking changes
- regulatory or financial sensitivity

These signals are descriptive only. Rule authority remains in
`docs/engineering/versioning.md`.

------------------------------------------------------------------------

## Typical Project Contexts (Examples)

Common contexts used during policy interpretation:

1. Local Tool (private use)
2. Internal Tool (team use)
3. Desktop Application (distributed binary)
4. Public Web Application
5. API / SDK
6. Web3 / Financial-Sensitive Application

These categories are examples for discussion and documentation quality.
They are not an independent normative matrix in this guide.

------------------------------------------------------------------------

## Practical Use Pattern

When classifying a change:
- use this guide to frame the context
- resolve obligations and final classification in `docs/engineering/versioning.md`
- keep workflow classification separate from SemVer classification

Namespace reminder:
- Workflow classification: `Minor Change (workflow)` / `BMAD Feature`
- Version classification: `SemVer PATCH` / `SemVer MINOR` / `SemVer MAJOR`

------------------------------------------------------------------------

## Governance Boundary

This guide does not:
- define binding versioning requirements
- define SemVer ownership
- introduce release automation workflows
- modify BMAD Feature governance

------------------------------------------------------------------------

## Version

Informational-only baseline aligned to the single-owner contract.
