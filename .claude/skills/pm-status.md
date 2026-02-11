# PM Status Skill

Show status of initiatives, experiments, and PRDs with their linked documents.

## Trigger
- User says "pm status", "show status", "initiative status"
- User asks "what's the status of [ID]"
- User says "show pipeline", "workflow status"

## Commands

### /pm-status (no args)
Show overview of all active work:

```
📊 PM WORKFLOW STATUS
=====================

INITIATIVES IN DISCOVERY (max 6 weeks each)
------------------------------------------
I-2026-001: [Title] - Week 3/6, 2 experiments
I-2026-002: [Title] - Week 1/6, 0 experiments

EXPERIMENTS RUNNING (max 2 weeks each)
--------------------------------------
E-2026-003: [Title] for I-2026-001 - Day 5/14
E-2026-004: [Title] for I-2026-002 - Day 2/14

PRDs IN REVIEW
--------------
PRD-2026-001: [Title] - Awaiting: CPO, CTO

RECENTLY SHIPPED
----------------
PRD-2026-000: [Title] - Shipped 2026-02-05

⚠️  ALERTS
----------
- I-2026-001: Approaching 6-week limit (3 days remaining)
- E-2026-003: Over 2-week time box by 1 day
```

### /pm-status [ID]
Show detailed status for specific document:

**For Initiative:**
```
📋 INITIATIVE: I-2026-001
=========================
Title: [Title]
Status: discovery
Created: 2026-01-15 (Week 4 of 6)
Metric Target: [metric]
Confidence: medium

EXPERIMENTS:
  ✅ E-2026-001: completed (validated)
  🔄 E-2026-003: running (day 5)
  ⏳ E-2026-005: planned

LINKED PRD: None yet

DECISION LOG:
  2026-01-15: Created - Initial hypothesis
  2026-01-22: E-2026-001 validated hypothesis A
  2026-02-01: E-2026-003 started for hypothesis B

NEXT STEPS:
  - Complete E-2026-003 (due 2026-02-08)
  - Decision point: 2026-02-26 (validate or kill)
```

**For Experiment:**
```
📋 EXPERIMENT: E-2026-003
=========================
Title: [Title]
Status: running
Parent: I-2026-001 ([Initiative Title])
Started: 2026-02-01 (Day 5 of 14)

HYPOTHESIS:
  "We believe X will Y because Z"
  Confidence: medium
  Method: prototype

SUCCESS CRITERIA:
  Validates if: >60% user adoption
  Invalidates if: <30% user adoption

CURRENT DATA:
  [None collected yet / Summary if available]

NEXT STEPS:
  - Continue data collection
  - Due: 2026-02-15
  - Then: Update learning section
```

## Process

### Step 1: Parse Request
- If no ID: Show overview
- If ID provided: Show detail for that document

### Step 2: Gather Data
```bash
# Count initiatives by status
grep -l "status: discovery" initiatives/2026/*.md | wc -l
grep -l "status: validated" initiatives/2026/*.md | wc -l

# Count experiments by status
grep -l "status: running" experiments/2026/*.md | wc -l

# Get PRDs in review
grep -l "status: review" prds/active/*/*.md
```

### Step 3: Calculate Time Boxes
- Initiative age = today - created date
- Experiment age = today - (status changed to running date or created date)

### Step 4: Generate Alerts
- Initiative > 5 weeks in discovery → Warning
- Initiative > 6 weeks → Critical
- Experiment > 2 weeks running → Warning
- PRD > 2 weeks in review → Warning

### Step 5: Format Output
Use the templates above with actual data.

## Validation Rules
- Calculate dates accurately
- Show linked documents
- Highlight overdue items
- Suggest next actions
