# BRANCH WORKFLOW SOP

## Purpose

Define the canonical branch-first workflow for this repository to prevent working on `main`.

This SOP is operational and concise. It complements existing governance guides and does not redefine policy.

---

## Non-Negotiables

- Never work on `main`.
- Always create a branch before making changes.
- Use PR-only workflow.
- Use squash merge for PR integration.
- Treat tags as authoritative version markers.

---

## Happy Path (Using `pr-helper`)

```bash
# 1) Start from synced main
git checkout main
git pull --ff-only origin main

# 2) Create branch before editing
scripts/quality/pr-helper.sh branch --workflow minor-change --slug <scope-slug>

# 3) Edit files

# 4) Stage intended files
git add <intended-files>

# 5) Commit (staged-only)
scripts/quality/pr-helper.sh commit --workflow minor-change --subject "<summary>"

# 6) Push
scripts/quality/pr-helper.sh push

# 7) Validate governance before PR
scripts/quality/pr-helper.sh doctor --workflow minor-change

# 8) Create PR
scripts/quality/pr-helper.sh pr-create \
  --workflow minor-change \
  --type docs \
  --scope governance \
  --summary "<human summary>" \
  --rationale "<why>" \
  --files "<file1,file2,...>" \
  --out-of-scope "<non-goals>" \
  --versioning "SemVer PATCH expected" \
  --governance "<governance notes>" \
  --validation "<checks>"

# 9) Merge (deterministic squash metadata)
scripts/quality/pr-helper.sh pr-merge

# 10) Sync local main and cleanup
scripts/quality/pr-helper.sh sync-main

# 11) Optional explicit tag
scripts/quality/pr-helper.sh tag --tag vX.Y.Z
```

---

## Recovery Procedures

### A) You edited on `main` (unstaged changes)

Goal: keep changes, move work to a branch.

```bash
# create branch from current main state before staging anything
git checkout -b minor/<scope-slug>

# stage and continue normal flow
git add <intended-files>
scripts/quality/pr-helper.sh commit --workflow minor-change --subject "<summary>"
```

### B) You edited on `main` (staged/index dirty)

Goal: keep staged work, move to a branch safely.

```bash
# create branch from current state; index and working tree move with it
git checkout -b minor/<scope-slug>

# verify staged set and continue
git status
scripts/quality/pr-helper.sh commit --workflow minor-change --subject "<summary>"
```

### C) You already committed on `main`

Goal: recover with auditable PR-based remediation.

```bash
# 1) Create a revert branch from main
git checkout -b minor/revert-main-commit

# 2) Revert offending commit(s)
git revert <commit-sha>

# 3) Push and open PR for the revert
git push -u origin minor/revert-main-commit
# then create/merge PR via pr-helper or gh

# 4) Re-apply intended change on a proper feature/minor branch
scripts/quality/pr-helper.sh branch --workflow minor-change --slug <scope-slug>
# re-implement or cherry-pick as appropriate, then follow happy path
```

Notes:
- Prefer `git revert` over history rewriting on shared branches.
- Keep recovery itself reviewable through PR.

---

## Relationship To `pr-helper`

`pr-helper` enforces key safeguards:
- Blocks commit/push/PR/merge on `main` where applicable.
- Uses staged-only commit behavior (`git add` required first).
- Provides governance diagnostics via `doctor` with `PASS/WARN/FAIL`.
- Uses deterministic squash metadata in `pr-merge` (`--subject/--body`).
- Requires explicit `--tag` for tagging operations.

`pr-helper` does not auto-fix governance docs; it validates and reports.

---

## References

- `docs/engineering/guides/PR_HELPER_GUIDE.md`
- `docs/entry/chat-handover-protocol.md`
- `docs/bmad/notes/minor-change-log.md`
