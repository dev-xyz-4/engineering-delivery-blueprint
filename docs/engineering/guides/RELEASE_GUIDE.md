# RELEASE GUIDE

Generated on: 2026-02-14

------------------------------------------------------------------------

## Purpose

Define minimum release requirements depending on project type and distribution model.

This guide:
- Defines scope-dependent requirements.
- Distinguishes release dimensions (tags, GitHub Releases, release notes, artifacts, automation).
- Does NOT define project-specific release rules (see `docs/engineering/release.md`).
- Does NOT alter BMAD workflow rules.

------------------------------------------------------------------------

## Design Principle

Release requirements scale with:

- Distribution surface
- External dependency exposure
- User impact of release errors
- Regulatory or financial sensitivity

Avoid:
- Overengineering for local/internal tools.
- Underengineering for distributed/public systems.

------------------------------------------------------------------------

## Project Classification Reference

Use canonical project-type terminology from:
- `docs/engineering/guides/PROJECT_CLASSIFICATION.md`

This guide applies release requirements by canonical type and does not redefine taxonomy.

------------------------------------------------------------------------

## Release Requirement Matrix

For canonical project-type meanings, refer to `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.
Matrix reading aid:
- `Type Alpha` to `Type Zeta` are abstract row labels for scan-reading this matrix.
- Canonical project-type meanings are defined in `docs/engineering/guides/PROJECT_CLASSIFICATION.md`.

| Project Type | Git Tags Required | GitHub Releases Required | Release Notes Required | Artifact Publishing Required | CI/CD Release Automation Required |
|---|---|---|---|---|---|
| Type Alpha | MAY | NOT REQUIRED | NOT REQUIRED | NOT REQUIRED | NOT REQUIRED |
| Type Beta | SHOULD | MAY | SHOULD | MAY | MAY |
| Type Gamma | MUST | SHOULD | MUST | MUST | SHOULD |
| Type Delta | SHOULD | SHOULD | MUST | SHOULD | SHOULD |
| Type Epsilon | MUST | MUST | MUST | MUST | MUST |
| Type Zeta | MUST | MUST | MUST | MUST | MUST |

Each cell MUST use exactly one of:
- MUST
- SHOULD
- MAY
- NOT REQUIRED

------------------------------------------------------------------------

## Requirement Definitions

### Git Tags
- Tags are release markers used in release operations.
- For versioning semantics and authority, refer to `docs/engineering/versioning.md`.
- Tags SHOULD be applied only after merge/release readiness checks.

### GitHub Releases
- GitHub Releases formalize externally consumable release records.
- Required where external users or integrators depend on stable release discovery.
- Optional for internal/private systems unless required by team governance.

### Release Notes
- Release notes MUST summarize user-relevant changes.
- Release notes MUST call out breaking changes and required migrations.
- Release notes SHOULD include fixes, enhancements, and risk notes.

### Artifact Publishing (binaries/packages)
- Required when distributing executable binaries/packages to users/integrators.
- Published artifacts SHOULD be traceable to a specific tag/commit.
- Private/local projects MAY omit artifact publishing.

### CI/CD Release Automation
- Automation ensures repeatability and consistency in release operations.
- Required for high-impact/public/distributed systems.
- Optional for low-risk private/internal systems.

------------------------------------------------------------------------

## Governance Boundary

This guide:

- MUST NOT override project-level decisions documented in:
  `docs/engineering/release.md`
- MUST NOT change versioning semantics; `docs/engineering/versioning.md` is authoritative for SemVer.
- MUST NOT introduce release automation workflows.
- MUST NOT introduce new enforcement mechanisms.
- MUST NOT modify BMAD Feature governance.

------------------------------------------------------------------------

## Version

Initial baseline established at v1.0.0.
