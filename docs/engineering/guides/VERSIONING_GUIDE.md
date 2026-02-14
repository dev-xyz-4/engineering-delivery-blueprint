# VERSIONING GUIDE

Generated on: 2026-02-14

------------------------------------------------------------------------

## Purpose

Define minimum versioning requirements depending on project type and distribution model.

This guide:
- Defines scope-dependent requirements.
- Does NOT define project-specific version rules (see docs/engineering/versioning.md).
- Does NOT alter BMAD workflow rules.

------------------------------------------------------------------------

## Design Principle

Versioning requirements scale with:

- Distribution surface
- External dependency exposure
- User impact of breaking changes
- Regulatory or financial sensitivity

Avoid:
- Overengineering for local/internal tools.
- Underengineering for distributed/public systems.

------------------------------------------------------------------------

## Project Classification Matrix

The guide MUST define at least the following project types:

1. Local Tool (private use)
2. Internal Tool (team use)
3. Desktop Application (distributed binary)
4. Public Web Application
5. API / SDK
6. Web3 / Financial-Sensitive Application

------------------------------------------------------------------------

## Versioning Requirement Matrix

Provide a table with the following columns:

| Project Type | Semantic Versioning Required | Git Tags Required | Public Release Required | Changelog Required | Breaking Change Policy Required | CI Version Enforcement Required |
|---|---|---|---|---|---|---|
| Local Tool (private use) | SHOULD | MAY | NOT REQUIRED | MAY | MAY | NOT REQUIRED |
| Internal Tool (team use) | SHOULD | SHOULD | MAY | SHOULD | SHOULD | MAY |
| Desktop Application (distributed binary) | MUST | MUST | SHOULD | MUST | MUST | SHOULD |
| Public Web Application | MUST | SHOULD | SHOULD | MUST | MUST | SHOULD |
| API / SDK | MUST | MUST | MUST | MUST | MUST | MUST |
| Web3 / Financial-Sensitive Application | MUST | MUST | MUST | MUST | MUST | MUST |

Each row MUST specify whether the requirement is:
- MUST
- SHOULD
- MAY
- NOT REQUIRED

## Applicability Rule

If a project matches multiple classifications, the strictest requirement level MUST apply.

------------------------------------------------------------------------

## Requirement Definitions

Define what each requirement means:

### Semantic Versioning
- MUST follow MAJOR.MINOR.PATCH structure.
- MAJOR increment is mandatory for breaking contract/interface changes.
- MINOR increment is mandatory for backward-compatible feature additions.
- PATCH increment is sufficient for backward-compatible fixes and documentation hygiene updates.

### Git Tags
- Tags MUST match version numbers.
- Tags MUST be immutable once published.

### Public Release
- Required for distributed artifacts.
- Optional for internal/private systems.

### Changelog
- MUST describe breaking changes explicitly.
- SHOULD summarize feature additions.
- MAY omit trivial documentation-only patches (if internal tool).

### Breaking Change Policy
- MUST explicitly document contract changes.
- MUST reference migration guidance if external users exist.

### CI Version Enforcement
- MUST ensure version consistency if distributed.
- MAY be omitted for private/local tools.

------------------------------------------------------------------------

## Governance Boundary

This guide:

- MUST NOT override project-level decisions documented in:
  docs/engineering/versioning.md
- MUST NOT introduce release automation workflows.
- MUST NOT modify BMAD Feature governance.

------------------------------------------------------------------------

## Version

Initial baseline established at v1.0.0.
