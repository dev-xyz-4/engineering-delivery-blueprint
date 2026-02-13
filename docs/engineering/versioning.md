## Commit Hygiene

Commit hygiene ensures repository integrity, traceability, and reproducibility.

Every commit must follow these rules.

---

### 1. Pre-Commit Checklist (Mandatory)

Before committing, verify:

- `git status` shows no unintended files.
- No OS artifacts (e.g. `.DS_Store`, `Thumbs.db`).
- No editor artifacts (e.g. `.vscode/`, `.idea/`, swap files).
- No build outputs (`dist/`, `build/`, `out/`, `coverage/`).
- No dependency folders (`node_modules/`).
- No secret files (`.env`, private keys, tokens).
- No temporary debug files or local experiment artifacts.

If such files appear:
- Either delete them,
- Or update `.gitignore` explicitly.

---

### 2. .gitignore Governance

`.gitignore` must:

- Ignore generated artifacts only.
- Never ignore source files.
- Be extended deliberately when new tools introduce new artifacts.
- Be reviewed whenever build tooling changes.

Structure hygiene is part of system quality.

---

### 3. Commit Structure

All commits must:

- Build successfully (if build exists).
- Not introduce unrelated file changes.
- Not mix refactors and features in a single commit.
- Use consistent commit conventions (see BMAD_COMMIT_CONVENTIONS.md).

Avoid:
- “WIP” commits on main.
- Large, unreviewable diffs.
- Silent structural changes.

---

### 4. Structural Changes

Any change to:

- Directory layout
- Governance documents
- Core architectural files

Must be:

- Explicitly mentioned in the commit message.
- Justified (short rationale).
- Separated from feature work.

Repository structure is part of the system contract.

---

### 5. Automation

If available:

- Run lint/typecheck before commit.
- Run local audit scripts (e.g. TypeScript audit).
- Ensure CI would pass before pushing.

Commits must not rely on CI to discover avoidable local issues.

---

### Principle

A clean repository is a signal of engineering discipline.

Commit hygiene is not cosmetic.
It protects reproducibility, security, and long-term maintainability.

### Version

Initial baseline established at v1.0.0.
