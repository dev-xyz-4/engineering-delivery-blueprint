# PR Helper Guide

## 1) Overview

`scripts/quality/pr-helper.sh` standardizes governance-oriented PR operations in this repository.

Purpose:
- Reduce manual mistakes in branch/commit/PR/merge flows
- Keep PR metadata consistent with Conventional Commits
- Ensure deterministic squash metadata (PR title/body parity on main)
- Support governance hygiene through explicit workflow steps

---

## 2) Prerequisites

Before running helper commands:
- Run from repository context (the helper resolves repo root automatically)
- Ensure git working tree is clean (unless explicitly using `--allow-dirty`)
- Ensure `gh` is installed
- Ensure `gh` is authenticated: `gh auth status`
- Do not run commit/PR actions from `main`

---

## 3) Supported Workflows

Detected from `docs/bmad/templates/*.prompt.md`:
- `minor-change`
- `documentation-only`
- `feature-implementation`

Use:
```bash
scripts/quality/pr-helper.sh detect
```

---

## 4) Subcommands

- `help`:
  Show usage and examples.
- `detect`:
  Print detected workflow-template mappings.
- `doctor`:
  Print environment/guardrail status (repo root, branch, git status, gh auth, workflow detection).
- `branch`:
  Create a workflow-aligned branch name (`minor/<slug>` or `feature/<slug>`).
- `commit`:
  Create a conventional commit message and commit staged changes.
- `push`:
  Push current branch to origin with upstream tracking.
- `pr-create`:
  Create PR with Conventional Commit title and narrative governance body.
- `pr-merge`:
  Squash-merge PR with explicit subject/body matching PR metadata.
- `sync-main`:
  Checkout/pull `main` and delete previous local branch.
- `tag`:
  Create and push tag only when explicit `--tag vX.Y.Z` is provided.

---

## 5) Required `pr-create` Parameters

`pr-create` requires all of the following:
- `--type`
- `--scope`
- `--summary`
- `--rationale`
- `--files`
- `--out-of-scope`
- `--versioning`
- `--governance`
- `--validation`

Minimal shape:
```bash
scripts/quality/pr-helper.sh pr-create \
  --workflow <minor-change|documentation-only|feature-implementation> \
  --type <docs|chore|feat|...> \
  --scope <scope> \
  --summary "<human summary>" \
  --rationale "<why>" \
  --files "<comma-separated file list>" \
  --out-of-scope "<non-goals>" \
  --versioning "<semver expectation>" \
  --governance "<governance notes>" \
  --validation "<checks done / planned>"
```

---

## 6) Conventional Commit Title Rules

PR title format:
- `<type>(<scope>): <summary>`

Examples:
- `docs(governance): align handover baseline with latest minor log`
- `chore(quality): make PR metadata deterministic in pr-helper`
- `feat(pr-helper): add deterministic squash metadata flow`

Notes:
- `--summary` must be human-readable text and should not repeat `type(scope):`
- The helper validates title format before creating a PR

---

## 7) End-to-End Flows

### A) Minor Change Lifecycle

```bash
# 1) Create branch
scripts/quality/pr-helper.sh branch --workflow minor-change --slug handover-baseline-sync

# 2) Commit
scripts/quality/pr-helper.sh commit --workflow minor-change --subject "sync handover baseline"

# 3) Push
scripts/quality/pr-helper.sh push

# 4) Create PR
scripts/quality/pr-helper.sh pr-create \
  --workflow minor-change \
  --type docs \
  --scope governance \
  --summary "align handover baseline with latest patch state" \
  --rationale "prevent drift between handover protocol and minor-change log" \
  --files "docs/engineering/CHAT_HANDOVER_PROTOCOL.md,docs/bmad/notes/minor-changes.md" \
  --out-of-scope "no governance policy changes" \
  --versioning "PATCH expected: documentation hygiene" \
  --governance "minor log and handover updates included" \
  --validation "manual review + helper guardrail checks"

# 5) Merge deterministically
scripts/quality/pr-helper.sh pr-merge

# 6) Sync local main
scripts/quality/pr-helper.sh sync-main

# 7) Optional tag (explicit only)
scripts/quality/pr-helper.sh tag --tag vX.Y.Z
```

### B) Feature Implementation Lifecycle

```bash
# 1) Create branch
scripts/quality/pr-helper.sh branch --workflow feature-implementation --slug data-export

# 2) Commit
scripts/quality/pr-helper.sh commit --workflow feature-implementation --scope data-export --subject "implement deliver contract"

# 3) Push
scripts/quality/pr-helper.sh push

# 4) Create PR
scripts/quality/pr-helper.sh pr-create \
  --workflow feature-implementation \
  --type feat \
  --scope data-export \
  --summary "implement deliver contract for export flow" \
  --rationale "execute approved BMAD deliver specification" \
  --files "src/...,docs/bmad/features/data-export/04-deliver.md" \
  --out-of-scope "no unrelated architecture changes" \
  --versioning "MINOR expected if new behavior is introduced" \
  --governance "deliver/spec alignment verified" \
  --validation "tests + review checklist complete"

# 5) Merge
scripts/quality/pr-helper.sh pr-merge

# 6) Sync
scripts/quality/pr-helper.sh sync-main
```

---

## 8) Troubleshooting

### Dirty working tree
Error pattern:
- `git working tree is not clean...`

Resolution:
- Commit/stash changes first, or use `--allow-dirty` only when intentionally required.

### `gh` auth issues
Error pattern:
- `gh is not authenticated. Run: gh auth login`

Resolution:
```bash
gh auth login
gh auth status
```

### Title validation failures
Error pattern:
- `PR title must match Conventional Commits format: <type>(<scope>): <summary>`

Resolution:
- Ensure `--type`, `--scope`, and `--summary` are valid.
- Keep `--summary` human-readable; do not prefix with `type(scope):`.

### Squash title drift (historical)
Historical risk:
- Squash commit message differed from PR metadata.

Current behavior:
- `pr-merge` resolves PR title/body and passes explicit `--subject` and `--body` to squash merge.
- Result: main history stays aligned with PR metadata.
