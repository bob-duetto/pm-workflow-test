---
name: pm-doctor
version: 1.0.0
description: Verify APEX workflow configuration and check document health
triggers:
  - /pm-doctor
  - check config
  - verify setup
disable-model-invocation: true
---

# PM Doctor

Verify APEX workflow configuration, check document integrity, and diagnose issues.

## Usage

```
/pm-doctor           # Full diagnostic
/pm-doctor config    # Check configuration only
/pm-doctor links     # Check document links only
/pm-doctor time      # Check time-box violations only
```

## Full Diagnostic Output

```
🩺 APEX PM DOCTOR
=================

✅ CONFIGURATION
----------------
✓ Directory structure valid
✓ frontmatter.json present
✓ Front Matter CMS configured for 4 content types
✓ Cursor skills installed (4 skills)
✓ Claude agent present

📂 DIRECTORIES
--------------
✓ initiatives/2026/     (2 files)
✓ experiments/2026/     (3 files)
✓ prds/active/          (1 directory)
✓ team-charters/        (1 file)
✓ templates/            (4 templates)

🔗 LINK INTEGRITY
-----------------
✓ E-2026-001 → I-2026-001 (valid)
✓ E-2026-002 → I-2026-001 (valid)
✗ E-2026-003 → I-2026-099 (BROKEN - initiative not found)
✓ PRD-2026-001 → I-2026-001 (valid)

⏱️ TIME-BOX STATUS
------------------
✓ I-2026-001: Week 3/6 (OK)
⚠ I-2026-002: Week 5/6 (WARNING - approaching limit)
✗ E-2026-003: Day 16/14 (OVERDUE by 2 days)

📋 FRONTMATTER VALIDATION
-------------------------
✓ I-2026-001: All required fields present
✗ I-2026-002: Missing 'metric_target'
✓ E-2026-001: All required fields present
⚠ E-2026-002: 'hypothesis.validation_method' not in allowed values

📊 SUMMARY
----------
Configuration: 5/5 checks passed
Directories:   5/5 present
Links:         3/4 valid (1 broken)
Time-boxes:    1/3 OK, 1 warning, 1 overdue
Frontmatter:   2/4 valid, 1 error, 1 warning

🔧 RECOMMENDED FIXES
--------------------
1. E-2026-003: Update parent_initiative to valid ID or delete orphan
2. I-2026-002: Add 'metric_target' field
3. E-2026-002: Change validation_method to: interview|analytics|prototype|a_b_test|spike
4. E-2026-003: Address overdue experiment - complete or extend with justification
```

## Checks Performed

### Configuration Checks

| Check | What It Validates |
|-------|-------------------|
| Directory structure | All required directories exist |
| frontmatter.json | Front Matter CMS config present and valid |
| Cursor skills | Skills installed in .cursor/skills/ |
| Claude agent | Agent present in .claude/agents/ |
| Templates | All 4 templates present |

### Link Integrity

For each experiment:
- Verify `parent_initiative` points to existing initiative

For each PRD:
- Verify `parent_initiative` points to existing initiative
- Verify `validated_experiments` all exist

### Time-Box Validation

| Document | Time Box | Warning | Overdue |
|----------|----------|---------|---------|
| Initiative (discovery) | 6 weeks | Week 5+ | Week 7+ |
| Experiment | 2 weeks | Day 12+ | Day 15+ |
| PRD (review) | 2 weeks | Day 10+ | Day 15+ |

### Frontmatter Validation

**Initiative required fields:**
- id, type, status, metric_target, hypothesis, created

**Experiment required fields:**
- id, type, parent_initiative, status, hypothesis.statement, hypothesis.validation_method, success_criteria, created

**PRD required fields:**
- id, type, parent_initiative, validated_experiments, status, created

## How to Run Checks

### Check directories exist
```bash
for dir in initiatives/2026 experiments/2026 prds/active team-charters templates; do
  [ -d "$dir" ] && echo "✓ $dir" || echo "✗ $dir missing"
done
```

### Check frontmatter.json
```bash
[ -f "frontmatter.json" ] && echo "✓ frontmatter.json present" || echo "✗ frontmatter.json missing"
```

### Count documents
```bash
echo "Initiatives: $(ls initiatives/2026/*.md 2>/dev/null | wc -l)"
echo "Experiments: $(ls experiments/2026/*.md 2>/dev/null | wc -l)"
echo "PRDs: $(ls prds/active/*/PRD-*.md 2>/dev/null | wc -l)"
```

### Validate links
```bash
# For each experiment, check parent exists
for exp in experiments/2026/*.md; do
  parent=$(grep "parent_initiative:" "$exp" | awk '{print $2}')
  [ -f "initiatives/2026/$parent.md" ] && echo "✓ $exp → $parent" || echo "✗ $exp → $parent (broken)"
done
```

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | All checks passed |
| 1 | Configuration issues |
| 2 | Broken links found |
| 3 | Overdue items found |
| 4 | Frontmatter errors |
