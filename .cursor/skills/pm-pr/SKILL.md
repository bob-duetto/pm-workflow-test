---
name: pm-pr
version: 1.0.0
description: Create PR for APEX document changes with proper branch naming
triggers:
  - /pm-pr
disable-model-invocation: true
---

# PM PR

Create a pull request for your APEX document changes.

## Usage

```
/pm-pr
```

## BRANCH NAMING CONVENTION

| Document Type | Branch Pattern | Example |
|---------------|----------------|---------|
| Initiative | `initiative/I-2026-NNN` | `initiative/I-2026-003` |
| Experiment | `experiment/E-2026-NNN` | `experiment/E-2026-005` |
| PRD | `prd/PRD-2026-NNN` | `prd/PRD-2026-002` |
| Multiple/Mixed | `apex/brief-description` | `apex/booking-discovery` |
| Docs/Config | `docs/brief-description` | `docs/update-templates` |

⚠️ ALWAYS use lowercase branch names
⚠️ Use hyphens, not underscores

## Process

### Step 1: Check Git Identity

```bash
name=$(git config user.name)
email=$(git config user.email)
```

**If missing:**
```
⚠️ Git identity not set. Run /pm-setup first.
```

### Step 2: Detect Branch Type

Based on changed files:
- Only `initiatives/` → `initiative/I-2026-NNN`
- Only `experiments/` → `experiment/E-2026-NNN`
- Only `prds/` → `prd/PRD-2026-NNN`
- Mixed → `apex/brief-description`

### Step 3: Check Current Branch

```bash
current=$(git branch --show-current)
```

**If on `main`:**
```
Creating branch: initiative/I-2026-003
```
```bash
git checkout -b initiative/I-2026-003
```

**If already on feature branch:**
```
Using existing branch: initiative/I-2026-003
```

### Step 4: Push Branch

```bash
git push -u origin $(git branch --show-current)
```

### Step 5: Create PR

```bash
gh pr create \
  --title "Initiative: Booking Conversion (I-2026-003)" \
  --body "$(cat <<EOF
## Summary

New initiative for booking conversion improvements.

## Documents

- [x] I-2026-003: Booking Conversion

## Checklist

- [ ] Frontmatter complete
- [ ] Links valid
- [ ] Reviewed by PM lead
EOF
)"
```

### Step 6: Report

```
✅ PR created

Branch: initiative/I-2026-003
PR:     https://github.com/bob-duetto/pm-workflow-test/pull/7
Title:  Initiative: Booking Conversion (I-2026-003)
```

## PR Title Format

| Type | Title Format |
|------|--------------|
| Initiative | `Initiative: {title} (I-2026-NNN)` |
| Experiment | `Experiment: {title} (E-2026-NNN)` |
| PRD | `PRD: {title} (PRD-2026-NNN)` |
| Multiple | `APEX: {brief description}` |

## Scope

This skill handles PRs **within this repo only**.

Out of scope:
- Creating new repositories
- Cross-repo PRs
- GitHub organization settings

Those are handled by experienced users or automation.
