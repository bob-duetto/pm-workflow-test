---
name: pm-help
version: 1.0.0
description: Show all APEX PM commands and workflow guide
triggers:
  - /pm-help
  - pm help
  - help pm
disable-model-invocation: true
---

# PM Help

Show help for all APEX PM commands.

## Output

```
📚 APEX PM WORKFLOW HELP
========================

FIRST TIME
----------
/pm-setup          Configure git identity (name/email)
/pm-help           Show this help

CREATING DOCUMENTS
------------------
/pm-initiative     Create new initiative (strategic bet)
/pm-experiment     Create experiment for an initiative
/pm-prd            Create PRD from validated initiative

VIEWING & CHECKING
------------------
/pm-status         Show pipeline status and alerts
/pm-status [ID]    Show details for specific document
/pm-validate [ID]  Validate document frontmatter and links
/pm-doctor         Check configuration and document health

UPDATING
--------
/pm-update [ID] [status]   Change document status
/pm-link [ID] [JIRA-ID]    Link document to JIRA epic

GIT WORKFLOW
------------
/pm-commit         Commit changes with conventional format
/pm-pr             Create pull request with proper branch

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

WORKFLOW CHEATSHEET
===================

1. Start initiative:
   /pm-initiative

2. Add experiments (1-3):
   /pm-experiment

3. Complete experiment:
   /pm-update E-2026-XXX completed

4. Validate initiative:
   /pm-update I-2026-XXX validated

5. Create PRD:
   /pm-prd

6. Link to JIRA:
   /pm-link PRD-2026-XXX EPIC-123

7. Commit & PR:
   /pm-commit
   /pm-pr

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

STATUS VALUES
=============

Initiative: discovery → validated → delivery → shipped
                     ↘ killed

Experiment: planned → running → completed
            Outcome: validated | invalidated | inconclusive

PRD:        draft → review → approved → in-development → shipped → learning

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

TIME BOXES
==========

Initiative discovery: 6 weeks max
Experiment:           2 weeks max
Experiments per init: 3 max

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

BRANCH NAMING
=============

initiative/I-2026-NNN     For new initiatives
experiment/E-2026-NNN     For new experiments
prd/PRD-2026-NNN          For new PRDs
apex/brief-description    For mixed changes
docs/brief-description    For config/docs

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

QUICK EXAMPLES
==============

Create initiative:
  /pm-initiative

Create experiment for I-2026-001:
  /pm-experiment
  > Parent: I-2026-001

Update status:
  /pm-update I-2026-001 validated

Check everything:
  /pm-doctor

View pipeline:
  /pm-status
```

## Command Reference

### /pm-initiative

Creates a new initiative. Prompts for:
- Title
- Metric target
- Hypothesis ("We believe X will Y by Z")
- Team (optional)

**Creates:** `initiatives/2026/I-2026-NNN.md`

---

### /pm-experiment

Creates an experiment linked to an initiative. Prompts for:
- Parent initiative (I-2026-NNN)
- Title
- Hypothesis
- Validation method (interview/analytics/prototype/a_b_test/spike)
- Success criteria

**Creates:** `experiments/2026/E-2026-NNN.md`

---

### /pm-prd

Creates a PRD from a validated initiative. Prompts for:
- Parent initiative (must be validated)
- Title
- Problem statement
- Solution summary
- Success metrics

**Creates:** `prds/active/PRD-2026-NNN/PRD-2026-NNN.md`

---

### /pm-status

Shows pipeline overview:
- Initiatives in discovery (with week count)
- Running experiments (with day count)
- PRDs in review
- Time-box alerts

**Usage:**
```
/pm-status              # Overview
/pm-status I-2026-001   # Details
```

---

### /pm-update

Updates document status.

**Usage:**
```
/pm-update I-2026-001 validated
/pm-update E-2026-003 completed
/pm-update PRD-2026-001 approved
```

For experiments, also prompts for learnings when completing.

---

### /pm-validate

Validates a document's frontmatter and links.

**Usage:**
```
/pm-validate I-2026-001
```

Checks:
- Required fields present
- Status is valid value
- Links point to existing documents
- Time-box status

---

### /pm-commit

Commits changes with conventional commit format.

**Auto-generates message like:**
```
feat(initiative): Add I-2026-003 - Booking Conversion
```

---

### /pm-pr

Creates a pull request.

- Creates feature branch if on main
- Pushes changes
- Creates PR with auto-generated title

---

### /pm-link

Links document to JIRA.

**Usage:**
```
/pm-link PRD-2026-001 BOOK-123
```

Updates the document's `epic_id` field.

---

### /pm-doctor

Runs configuration checks:
- Directory structure
- frontmatter.json present
- Cursor skills installed
- Link integrity
- Time-box violations
- Frontmatter validation

---

### /pm-help

Shows this help.
