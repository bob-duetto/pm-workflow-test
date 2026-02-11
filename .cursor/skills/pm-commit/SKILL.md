---
name: pm-commit
version: 1.0.0
description: Commit APEX document changes with conventional format
triggers:
  - /pm-commit
disable-model-invocation: true
---

# PM Commit

Commit changes with proper conventional commit format.

## Usage

```
/pm-commit
```

## Process

### Step 1: Check Git Identity

```bash
name=$(git config user.name)
email=$(git config user.email)
```

**If missing:**
```
⚠️ Git identity not set.

Run /pm-setup to configure your name and email.
```
Stop here until identity is configured.

### Step 2: Check Status

```bash
git status --short
```

**If no changes:**
```
✓ Nothing to commit. Working tree clean.
```

### Step 3: Show Changes

```
📝 Changes detected:
  A initiatives/2026/I-2026-003.md
  M experiments/2026/E-2026-001.md
```

### Step 4: Auto-Generate Message

| Change Type | Commit Format |
|-------------|---------------|
| New initiative | `feat(initiative): Add I-2026-NNN - {title}` |
| New experiment | `feat(experiment): Add E-2026-NNN - {title}` |
| New PRD | `feat(prd): Add PRD-2026-NNN - {title}` |
| Update status | `chore({type}): Update {ID} to {status}` |
| Add learnings | `docs(experiment): Add learnings to E-2026-NNN` |
| Config changes | `chore: {description}` |

### Step 5: Confirm

```
Commit message:
  feat(initiative): Add I-2026-003 - Booking Conversion

Proceed? [Y/n]
```

### Step 6: Commit

```bash
git add -A
git commit -m "feat(initiative): Add I-2026-003 - Booking Conversion"
```

### Step 7: Report

```
✅ Committed

Message: feat(initiative): Add I-2026-003 - Booking Conversion
Files:   1 added, 1 modified
Author:  Jane Smith <jane@duetto.com>

Next: Run /pm-pr to create a pull request
```

## Commit Message Examples

```
feat(initiative): Add I-2026-003 - Booking Conversion
feat(experiment): Add E-2026-005 - User Interview Round 1
feat(prd): Add PRD-2026-002 - Streamlined Checkout
chore(initiative): Update I-2026-001 to validated
chore(experiment): Update E-2026-003 to completed
docs(experiment): Add learnings to E-2026-003
```

## Scope

This skill handles commits **within this repo only**.

Out of scope:
- Cross-repo commits
- Pushing (use /pm-pr for that)
- Force commits or amends

Those are handled by experienced users or automation.
