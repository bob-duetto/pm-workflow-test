---
name: pm-validate
version: 1.0.0
description: Validate an APEX document's frontmatter and links
triggers:
  - /pm-validate
disable-model-invocation: true
---

# PM Validate

Validate a specific document's frontmatter and links.

## Usage

```
/pm-validate I-2026-001
/pm-validate E-2026-003
/pm-validate PRD-2026-001
```

## What It Does

1. Reads the document
2. Checks required fields
3. Validates links to related documents
4. Reports issues

## Output

```
🔍 Validating I-2026-001
========================

✓ id: I-2026-001
✓ type: initiative
✓ status: discovery (valid)
✓ metric_target: present
✓ hypothesis: present
✓ created: 2026-02-01
✓ updated: 2026-02-11

🔗 Links:
✓ related_experiments: [E-2026-001, E-2026-003] (both exist)
✓ related_prd: null (OK - not yet created)

⏱️ Time-box:
  Created: 2026-02-01
  Elapsed: 10 days (Week 2 of 6)
  Status: 🟢 On track

✅ Document is valid
```

## Validation Rules

### Initiative

| Field | Required | Validation |
|-------|----------|------------|
| id | ✓ | Format: I-YYYY-NNN |
| type | ✓ | Must be "initiative" |
| status | ✓ | discovery\|validated\|delivery\|shipped\|killed |
| metric_target | ✓ | Non-empty string |
| hypothesis | ✓ | Non-empty string |
| created | ✓ | Valid date |

### Experiment

| Field | Required | Validation |
|-------|----------|------------|
| id | ✓ | Format: E-YYYY-NNN |
| type | ✓ | Must be "experiment" |
| parent_initiative | ✓ | Must exist in initiatives/ |
| status | ✓ | planned\|running\|completed |
| hypothesis.statement | ✓ | Non-empty string |
| hypothesis.validation_method | ✓ | interview\|analytics\|prototype\|a_b_test\|spike |
| success_criteria | ✓ | Non-empty string |

### PRD

| Field | Required | Validation |
|-------|----------|------------|
| id | ✓ | Format: PRD-YYYY-NNN |
| type | ✓ | Must be "prd" |
| parent_initiative | ✓ | Must exist and be validated/delivery |
| validated_experiments | ✓ | At least one, all must exist |
| status | ✓ | draft\|review\|approved\|in-development\|shipped\|learning |
