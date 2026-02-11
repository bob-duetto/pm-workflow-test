---
name: pm-initiative
version: 1.0.0
description: Create a new APEX Initiative with guided prompts
triggers:
  - /pm-initiative
  - create initiative
disable-model-invocation: true
---

# Create Initiative

When user types `/pm-initiative`, guide them through creating a new initiative.

## Interactive Flow

**Step 1: Title**
> What is this initiative about?
> Example: "Improve booking conversion rate"

**Step 2: Metric Target**
> Which team metric will this move?
> Example: "booking_conversion_rate" or "time_to_value"

**Step 3: Hypothesis**
> Complete this sentence:
> "We believe [doing X] will [improve metric] by [amount]"
> Example: "We believe simplifying checkout will increase conversion by 15%"

**Step 4: Team (optional)**
> Which team owns this? Enter team charter ID or skip.
> Example: "TC-001" or press Enter to skip

## After Gathering Info

1. **Generate ID**: Find next available ID in `initiatives/2026/`
2. **Create file**: `initiatives/2026/I-2026-{NNN}.md`
3. **Populate template** with user answers
4. **Report**: "Created I-2026-{NNN}. Next: run `/pm-experiment I-2026-{NNN}` to add an experiment."

## Template Values

```yaml
title: [from Step 1]
id: I-2026-{auto}
type: initiative
status: discovery
metric_target: [from Step 2]
hypothesis: [from Step 3]
confidence: low
max_experiments: 3
time_box: "6 weeks"
created: {today}
updated: {today}
author: {user or "PM"}
team: [from Step 4 or null]
related_experiments: []
related_prd: null
tags: []
```

## Quick Mode

If user provides everything inline:
`/pm-initiative "Improve checkout" --metric conversion --hypothesis "We believe X will Y"`

Skip the prompts and create directly.
