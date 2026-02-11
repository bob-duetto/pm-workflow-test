---
name: pm-pr
version: 1.0.0
description: Create PR for APEX document changes
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

## What It Does

1. Creates feature branch (if on main)
2. Pushes changes
3. Creates PR with auto-generated title and body

## Process

**Step 1: Check branch**
```bash
git branch --show-current
```

If on `main`, create branch:
```bash
git checkout -b {type}/{id}
# e.g., initiative/I-2026-003
```

**Step 2: Push**
```bash
git push -u origin {branch}
```

**Step 3: Create PR**
```bash
gh pr create --title "{title}" --body "{body}"
```

## PR Title Format

| Type | Title |
|------|-------|
| Initiative | `Initiative: {title} (I-2026-NNN)` |
| Experiment | `Experiment: {title} (E-2026-NNN)` |
| PRD | `PRD: {title} (PRD-2026-NNN)` |
| Multiple | `APEX: {summary}` |

## PR Body Template

```markdown
## Summary

{Auto-generated based on changed files}

## Documents

- [ ] I-2026-NNN: {title}
- [ ] E-2026-NNN: {title}

## Checklist

- [ ] Frontmatter complete
- [ ] Links valid
- [ ] Time-box within limits
```

## Example

```
/pm-pr

📋 Creating PR for changes:
  A initiatives/2026/I-2026-003.md

Branch: initiative/I-2026-003
Title: Initiative: Booking Conversion (I-2026-003)

Creating PR...

✅ PR created: https://github.com/bob-duetto/pm-workflow-test/pull/5
```
