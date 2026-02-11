---
name: pm-link
version: 1.0.0
description: Link APEX documents to JIRA epics/stories
triggers:
  - /pm-link
disable-model-invocation: true
---

# PM Link

Link an APEX document to JIRA.

## Usage

```
/pm-link PRD-2026-001 EPIC-123
/pm-link I-2026-001 THEME-456
```

## What It Does

1. Updates the document's `epic_id` or `jira_link` field
2. Optionally adds link in JIRA (if configured)

## Mapping

| APEX Document | JIRA Type |
|---------------|-----------|
| Initiative | Theme (Portfolio) |
| Experiment | Story (optional) |
| PRD | Epic |

## Process

**Step 1: Parse command**
```
/pm-link {apex_id} {jira_id}
```

**Step 2: Update document**
```yaml
# For PRD
epic_id: EPIC-123

# For Initiative
jira_link: THEME-456
```

**Step 3: Report**
```
✅ Linked PRD-2026-001 → EPIC-123
   JIRA: https://duetto.atlassian.net/browse/EPIC-123
```

## Example

```
/pm-link PRD-2026-001 BOOK-456

✅ Linked PRD-2026-001 → BOOK-456
   Updated: prds/active/PRD-2026-001/PRD-2026-001.md
   JIRA: https://duetto.atlassian.net/browse/BOOK-456
```
