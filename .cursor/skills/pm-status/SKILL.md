---
name: pm-status
version: 1.0.0
description: Show APEX workflow status and alerts
triggers:
  - /pm-status
  - show status
  - workflow status
disable-model-invocation: true
---

# PM Status

When user types `/pm-status`, show the current state of the APEX pipeline.

## Usage

**Overview (no args):**
```
/pm-status
```

**Specific document:**
```
/pm-status I-2026-001
```

## Overview Output Format

```
📊 APEX WORKFLOW STATUS
=======================

🔬 DISCOVERY (6 week max)
-------------------------
I-2026-001: Booking Conversion    Week 4/6  🟡  2 experiments
I-2026-002: Pricing Optimization  Week 1/6  🟢  0 experiments

🧪 EXPERIMENTS (2 week max)
---------------------------
E-2026-003: Checkout Interviews   Day 5/14  🟢  → I-2026-001
E-2026-004: A/B Test Pricing      Day 12/14 🟡  → I-2026-002

📝 PRDs
-------
PRD-2026-001: Checkout v2         draft     Awaiting: CPO, CTO

✅ RECENTLY SHIPPED
-------------------
PRD-2026-000: Search Improvements  2026-02-05

⚠️  ALERTS
----------
• I-2026-001 approaching 6-week limit (10 days left)
• E-2026-004 near 2-week limit (2 days left)
```

## Status Indicators

| Icon | Meaning |
|------|---------|
| 🟢 | On track |
| 🟡 | >75% of time box used |
| 🔴 | Over time box |
| ✅ | Completed |
| ⏳ | Planned |
| 🔄 | Running |

## Detail Output Format

For `/pm-status I-2026-001`:

```
📋 INITIATIVE: I-2026-001
=========================
Title: Booking Conversion
Status: discovery 🔬
Created: 2026-01-15 (Week 4 of 6)
Metric: booking_conversion_rate
Confidence: medium

EXPERIMENTS:
  ✅ E-2026-001: Interview Round 1 (validated)
  🔄 E-2026-003: Checkout Interviews (day 5)
  ⏳ E-2026-005: Prototype Test (planned)

PRD: None yet

TIMELINE:
  Jan 15  Created
  Jan 22  E-2026-001 validated
  Feb 01  E-2026-003 started
  Feb 26  Decision deadline ⚠️

NEXT: Complete E-2026-003, then decide: PRD or kill
```

## How to Calculate

1. Read all files in `initiatives/2026/`, `experiments/2026/`, `prds/active/`
2. Parse frontmatter for status, created date, relationships
3. Calculate days/weeks elapsed from created date
4. Generate alerts for items approaching or over time box
