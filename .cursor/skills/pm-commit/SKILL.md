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

## What It Does

1. Shows changed files
2. Auto-generates commit message based on changes
3. Commits with conventional format

## Commit Format

```
{type}({scope}): {description}

{body}
```

### Types (auto-detected)

| Change | Type | Example |
|--------|------|---------|
| New initiative | `feat(initiative)` | `feat(initiative): Add I-2026-003` |
| New experiment | `feat(experiment)` | `feat(experiment): Add E-2026-005` |
| New PRD | `feat(prd)` | `feat(prd): Add PRD-2026-002` |
| Update status | `chore` | `chore(initiative): Update I-2026-001 to validated` |
| Add learning | `docs` | `docs(experiment): Add learnings to E-2026-003` |

## Process

**Step 1: Check status**
```bash
git status --short
```

**Step 2: Detect changes**
- New file in `initiatives/` → `feat(initiative)`
- New file in `experiments/` → `feat(experiment)`
- New file in `prds/` → `feat(prd)`
- Modified file → detect type from path

**Step 3: Generate message**
- Extract ID from filename
- Extract title from frontmatter
- Build conventional commit

**Step 4: Commit**
```bash
git add -A
git commit -m "{generated message}"
```

**Step 5: Report**
```
✅ Committed: feat(initiative): Add I-2026-003 - Booking Conversion
   Files: initiatives/2026/I-2026-003.md
```

## Example

```
/pm-commit

📝 Changes detected:
  A initiatives/2026/I-2026-003.md
  M experiments/2026/E-2026-001.md

Commit message:
  feat(initiative): Add I-2026-003 - Booking Conversion

Proceed? [Y/n]

✅ Committed successfully
```
