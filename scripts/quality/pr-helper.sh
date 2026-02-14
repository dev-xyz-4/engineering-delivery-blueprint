#!/usr/bin/env bash
set -euo pipefail

SCRIPT_NAME="$(basename "$0")"

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"
if [[ -z "$REPO_ROOT" ]]; then
  echo "Error: not inside a git repository." >&2
  exit 1
fi
cd "$REPO_ROOT"

TEMPLATE_DIR="docs/bmad/templates"

log() {
  printf '%s\n' "$*"
}

err() {
  printf 'Error: %s\n' "$*" >&2
}

require_clean_git() {
  local allow_dirty="${1:-false}"
  if [[ "$allow_dirty" == "true" ]]; then
    return 0
  fi
  if [[ -n "$(git status --porcelain)" ]]; then
    err "git working tree is not clean. Commit/stash changes or pass --allow-dirty."
    exit 1
  fi
}

require_not_main() {
  local branch
  branch="$(git rev-parse --abbrev-ref HEAD)"
  if [[ "$branch" == "main" ]]; then
    err "current branch is 'main'. Switch to a non-main branch first."
    exit 1
  fi
}

require_gh() {
  if ! command -v gh >/dev/null 2>&1; then
    err "GitHub CLI (gh) is not installed."
    exit 1
  fi
  if ! gh auth status >/dev/null 2>&1; then
    err "gh is not authenticated. Run: gh auth login"
    exit 1
  fi
}

slugify() {
  local raw="$1"
  echo "$raw" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//; s/-{2,}/-/g'
}

declare -A WORKFLOW_TEMPLATE=()
declare -A WORKFLOW_FOUND=()

init_workflow_state() {
  WORKFLOW_TEMPLATE=(
    [documentation-only]=""
    [feature-implementation]=""
    [minor-change]=""
  )
  WORKFLOW_FOUND=(
    [documentation-only]="no"
    [feature-implementation]="no"
    [minor-change]="no"
  )
}

detect_templates() {
  init_workflow_state
  if [[ ! -d "$TEMPLATE_DIR" ]]; then
    return 0
  fi

  local file base
  while IFS= read -r file; do
    base="$(basename "$file")"
    case "$base" in
      documentation-only.prompt.md)
        WORKFLOW_TEMPLATE[documentation-only]="$file"
        WORKFLOW_FOUND[documentation-only]="yes"
        ;;
      feature-implementation.prompt.md)
        WORKFLOW_TEMPLATE[feature-implementation]="$file"
        WORKFLOW_FOUND[feature-implementation]="yes"
        ;;
      minor-change.prompt.md)
        WORKFLOW_TEMPLATE[minor-change]="$file"
        WORKFLOW_FOUND[minor-change]="yes"
        ;;
    esac
  done < <(find "$TEMPLATE_DIR" -maxdepth 1 -type f -name '*.prompt.md' | sort)
}

print_template_detection() {
  detect_templates
  log "Detected prompt templates in $TEMPLATE_DIR:"
  local wf
  for wf in documentation-only feature-implementation minor-change; do
    if [[ "${WORKFLOW_FOUND[$wf]}" == "yes" ]]; then
      log "  - $wf -> ${WORKFLOW_TEMPLATE[$wf]}"
    else
      log "  - $wf -> MISSING"
    fi
  done
}

require_workflow() {
  local wf="$1"
  detect_templates
  case "$wf" in
    documentation-only|feature-implementation|minor-change) ;;
    *)
      err "invalid workflow '$wf'. Use: documentation-only | feature-implementation | minor-change"
      exit 1
      ;;
  esac

  if [[ "${WORKFLOW_FOUND[$wf]}" != "yes" ]]; then
    err "workflow '$wf' unavailable: corresponding template not found under $TEMPLATE_DIR"
    print_template_detection
    exit 1
  fi
}

branch_prefix_for_workflow() {
  local wf="$1"
  if [[ "$wf" == "minor-change" ]]; then
    echo "minor"
  else
    echo "feature"
  fi
}

default_commit_type_for_workflow() {
  local wf="$1"
  case "$wf" in
    minor-change) echo "docs" ;;
    feature-implementation) echo "feat" ;;
    documentation-only) echo "docs" ;;
    *) echo "chore" ;;
  esac
}

default_pr_title_for() {
  local wf="$1"
  local slug="$2"
  case "$wf" in
    minor-change)
      echo "minor(docs): $slug"
      ;;
    feature-implementation)
      echo "feat($slug): implement workflow updates"
      ;;
    documentation-only)
      echo "docs(bmad): $slug"
      ;;
    *)
      echo "chore: $slug"
      ;;
  esac
}

print_help() {
  print_template_detection
  cat <<'USAGE'

Usage:
  pr-helper.sh help
  pr-helper.sh detect
  pr-helper.sh doctor

  pr-helper.sh branch --workflow <workflow> --slug <slug> [--allow-dirty]
  pr-helper.sh commit --workflow <workflow> [--type <type>] [--scope <scope>] (--subject <text> | --message <msg>) [--allow-dirty]
  pr-helper.sh push [--allow-dirty]
  pr-helper.sh pr-create --workflow <workflow> --slug <slug> [--base <branch>] [--title <title>] [--allow-dirty]
  pr-helper.sh pr-merge [--allow-dirty]
  pr-helper.sh sync-main [--allow-dirty]
  pr-helper.sh tag --tag vX.Y.Z [--allow-dirty]

Workflows:
  - documentation-only
  - feature-implementation
  - minor-change

Examples:
  pr-helper.sh branch --workflow minor-change --slug handover-baseline-sync
  pr-helper.sh commit --workflow minor-change --subject "sync handover baseline"
  pr-helper.sh push
  pr-helper.sh pr-create --workflow minor-change --slug handover-baseline-sync
  pr-helper.sh pr-merge
  pr-helper.sh sync-main
  pr-helper.sh tag --tag v1.9.0
USAGE
}

run_doctor() {
  log "Repo root: $REPO_ROOT"
  log "Current branch: $(git rev-parse --abbrev-ref HEAD)"
  if [[ -n "$(git status --porcelain)" ]]; then
    log "Git status: DIRTY"
  else
    log "Git status: CLEAN"
  fi

  if command -v gh >/dev/null 2>&1; then
    if gh auth status >/dev/null 2>&1; then
      log "gh: installed and authenticated"
    else
      log "gh: installed but NOT authenticated"
    fi
  else
    log "gh: NOT installed"
  fi

  print_template_detection
}

cmd_branch() {
  local wf="" slug="" allow_dirty="false"
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --workflow) wf="$2"; shift 2 ;;
      --slug) slug="$2"; shift 2 ;;
      --allow-dirty) allow_dirty="true"; shift ;;
      *) err "unknown option for branch: $1"; exit 1 ;;
    esac
  done

  [[ -n "$wf" ]] || { err "--workflow is required"; exit 1; }
  [[ -n "$slug" ]] || { err "--slug is required"; exit 1; }

  require_clean_git "$allow_dirty"
  require_workflow "$wf"

  local safe_slug prefix target
  safe_slug="$(slugify "$slug")"
  prefix="$(branch_prefix_for_workflow "$wf")"
  target="$prefix/$safe_slug"

  git checkout -b "$target"
  log "Created branch: $target"
  log "Next: $SCRIPT_NAME commit --workflow $wf --subject \"<summary>\""
}

cmd_commit() {
  local wf="" type="" scope="" subject="" message="" allow_dirty="false"
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --workflow) wf="$2"; shift 2 ;;
      --type) type="$2"; shift 2 ;;
      --scope) scope="$2"; shift 2 ;;
      --subject) subject="$2"; shift 2 ;;
      --message) message="$2"; shift 2 ;;
      --allow-dirty) allow_dirty="true"; shift ;;
      *) err "unknown option for commit: $1"; exit 1 ;;
    esac
  done

  [[ -n "$wf" ]] || { err "--workflow is required"; exit 1; }
  require_workflow "$wf"
  require_clean_git "$allow_dirty"
  require_not_main

  if [[ -z "$message" ]]; then
    [[ -n "$subject" ]] || { err "--subject is required when --message is not provided"; exit 1; }
    if [[ -z "$type" ]]; then
      type="$(default_commit_type_for_workflow "$wf")"
    fi
    if [[ -n "$scope" ]]; then
      message="$type($scope): $subject"
    else
      message="$type: $subject"
    fi
  fi

  git add -A
  if git diff --cached --quiet; then
    err "no staged changes to commit (after git add -A)."
    exit 1
  fi
  git commit -m "$message"

  log "Committed: $message"
  log "Next: $SCRIPT_NAME push"
}

cmd_push() {
  local allow_dirty="false"
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --allow-dirty) allow_dirty="true"; shift ;;
      *) err "unknown option for push: $1"; exit 1 ;;
    esac
  done
  require_clean_git "$allow_dirty"
  require_not_main

  local branch
  branch="$(git rev-parse --abbrev-ref HEAD)"
  git push -u origin "$branch"

  log "Pushed branch: $branch"
  log "Next: $SCRIPT_NAME pr-create --workflow <workflow> --slug <slug>"
}

cmd_pr_create() {
  local wf="" slug="" base="main" title="" allow_dirty="false"
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --workflow) wf="$2"; shift 2 ;;
      --slug) slug="$2"; shift 2 ;;
      --base) base="$2"; shift 2 ;;
      --title) title="$2"; shift 2 ;;
      --allow-dirty) allow_dirty="true"; shift ;;
      *) err "unknown option for pr-create: $1"; exit 1 ;;
    esac
  done

  [[ -n "$wf" ]] || { err "--workflow is required"; exit 1; }
  [[ -n "$slug" ]] || { err "--slug is required"; exit 1; }

  require_clean_git "$allow_dirty"
  require_gh
  require_workflow "$wf"
  require_not_main

  local head safe_slug body_file
  head="$(git rev-parse --abbrev-ref HEAD)"
  safe_slug="$(slugify "$slug")"

  if [[ -z "$title" ]]; then
    title="$(default_pr_title_for "$wf" "$safe_slug")"
  fi

  body_file="$(mktemp)"
  cat > "$body_file" <<EOF_BODY
## Summary
- workflow: $wf
- scope: $safe_slug

## Checklist
- [ ] documentation/log updates included where required
- [ ] no unrelated refactors
- [ ] governance guardrails respected

## Validation
- [ ] local checks completed
- [ ] ready for squash merge
EOF_BODY

  gh pr create --base "$base" --head "$head" --title "$title" --body-file "$body_file"
  rm -f "$body_file"

  log "PR created from $head -> $base"
  log "Next: $SCRIPT_NAME pr-merge"
}

cmd_pr_merge() {
  local allow_dirty="false"
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --allow-dirty) allow_dirty="true"; shift ;;
      --tag)
        err "tagging requires explicit command: $SCRIPT_NAME tag --tag vX.Y.Z"
        exit 1
        ;;
      *) err "unknown option for pr-merge: $1"; exit 1 ;;
    esac
  done

  require_clean_git "$allow_dirty"
  require_gh
  require_not_main

  gh pr merge --squash --delete-branch

  log "PR merged with squash and remote branch deletion."
  log "Next: $SCRIPT_NAME sync-main"
}

cmd_sync_main() {
  local allow_dirty="false"
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --allow-dirty) allow_dirty="true"; shift ;;
      *) err "unknown option for sync-main: $1"; exit 1 ;;
    esac
  done

  require_clean_git "$allow_dirty"

  local current
  current="$(git rev-parse --abbrev-ref HEAD)"

  git checkout main
  git pull --ff-only origin main

  if [[ "$current" != "main" ]]; then
    git branch -d "$current" || true
  fi

  log "Local main synced."
  if [[ "$current" != "main" ]]; then
    log "Attempted local branch cleanup: $current"
  fi
  log "Optional next step: $SCRIPT_NAME tag --tag vX.Y.Z"
}

cmd_tag() {
  local tag="" allow_dirty="false"
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --tag) tag="$2"; shift 2 ;;
      --allow-dirty) allow_dirty="true"; shift ;;
      *) err "unknown option for tag: $1"; exit 1 ;;
    esac
  done

  require_clean_git "$allow_dirty"

  if [[ -z "$tag" ]]; then
    err "refusing to tag without explicit --tag vX.Y.Z"
    exit 1
  fi

  if ! [[ "$tag" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    err "tag must match vX.Y.Z"
    exit 1
  fi

  git tag "$tag"
  git push origin "$tag"

  log "Created and pushed tag: $tag"
}

main() {
  local cmd="${1:-help}"
  shift || true

  case "$cmd" in
    help|-h|--help) print_help ;;
    detect) print_template_detection ;;
    doctor) run_doctor ;;
    branch) cmd_branch "$@" ;;
    commit) cmd_commit "$@" ;;
    push) cmd_push "$@" ;;
    pr-create) cmd_pr_create "$@" ;;
    pr-merge) cmd_pr_merge "$@" ;;
    sync-main) cmd_sync_main "$@" ;;
    tag) cmd_tag "$@" ;;
    *)
      err "unknown command: $cmd"
      print_help
      exit 1
      ;;
  esac
}

main "$@"
