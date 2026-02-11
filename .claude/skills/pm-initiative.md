# PM Initiative Skill

Create a new APEX Initiative (The Bet) with proper frontmatter and structure.

## Trigger
- User says "create initiative", "new initiative", "start initiative"
- User mentions "I-2026" or "initiative for [topic]"

## Process

### Step 1: Get Next ID
```bash
# Find highest existing initiative ID
ls initiatives/2026/I-2026-*.md 2>/dev/null | sed 's/.*I-2026-//' | sed 's/\.md//' | sort -n | tail -1
```
Increment by 1 for new ID. If none exist, start at 001.

### Step 2: Gather Information
Ask for (if not provided):
- **Title**: What is this initiative about?
- **Metric Target**: Which team metric will this move?
- **Hypothesis**: "We believe [action] will [move metric] by [amount]"
- **Team Charter**: Which team owns this? (TC-NNN)

### Step 3: Create File
Location: `initiatives/2026/I-2026-{NNN}.md`

### Step 4: Populate Template

```yaml
---
title: "[Title from user]"
id: I-2026-{NNN}
type: initiative
status: discovery
metric_target: "[From user]"
hypothesis: "[From user]"
confidence: low
max_experiments: 3
time_box: "6 weeks"
created: {TODAY}
updated: {TODAY}
author: "[PM Name]"
team: TC-{NNN}
related_experiments: []
related_prd: null
tags:
  - [product-area]
  - q{Q}-2026
---

# Initiative: [Title]

## The Bet

**Hypothesis:** [Expanded hypothesis from user]

**Team Metric:** [metric_target]

**Current Baseline:** [Ask or TBD]
**Target:** [Ask or TBD]
**Measurement:** [Ask or TBD]

## Why This Bet?

[Rationale - ask user or leave for them to fill]

### Evidence/Signal
- [Signal 1]
- [Signal 2]

### Strategic Alignment
- **OKR:** [Reference]
- **Company Priority:** [Alignment]

## Discovery Plan

### Time Box
- **Max Duration:** 6 weeks
- **Max Experiments:** 3
- **Decision Date:** [6 weeks from today]

### Planned Experiments
1. **E-2026-{NNN}:** [First experiment - TBD]

## Exit Criteria

### Validate If:
- [Threshold that validates]

### Kill If:
- [Threshold that invalidates]
- After 6 weeks without clear signal

## Decision Log

| Date | Decision | Rationale | Next Step |
|------|----------|-----------|-----------|
| {TODAY} | Created | [Why now] | Begin discovery |

## Outcome

**Status:** discovery
**Key Learning:** TBD
**Next Step:** TBD
```

### Step 5: Confirm
Report:
- File created: `initiatives/2026/I-2026-{NNN}.md`
- Next step: Create first experiment with `/pm-experiment --initiative I-2026-{NNN}`

## Validation Rules
- ID must be unique
- Team charter must exist (warn if not)
- Hypothesis must follow "We believe X will Y" format
