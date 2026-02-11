---
name: pm-experiment
version: 1.0.0
description: Create a new APEX Experiment with guided prompts
triggers:
  - /pm-experiment
  - create experiment
disable-model-invocation: true
---

# Create Experiment

When user types `/pm-experiment`, guide them through creating a new experiment.

## Interactive Flow

**Step 1: Parent Initiative**
> Which initiative is this experiment for?
> Enter initiative ID (e.g., I-2026-001)

*Validate the initiative exists before continuing.*

**Step 2: Title**
> What are we testing?
> Example: "User interview on checkout friction"

**Step 3: Hypothesis**
> Complete this sentence:
> "We believe [X] will [Y] because [Z]"
> Example: "We believe users abandon checkout because of too many steps"

**Step 4: Validation Method**
> How will we test this? Choose one:
> 1. interview - User interviews
> 2. analytics - Data analysis
> 3. prototype - Build and test prototype
> 4. a_b_test - A/B test in production
> 5. spike - Technical spike/POC

**Step 5: Success Criteria**
> What result would validate this hypothesis?
> Example: ">60% of users cite step count as friction"

## After Gathering Info

1. **Generate ID**: Find next available ID in `experiments/2026/`
2. **Create file**: `experiments/2026/E-2026-{NNN}.md`
3. **Update parent**: Add experiment to initiative's `related_experiments`
4. **Report**: "Created E-2026-{NNN} for {initiative}. Status: planned. Run the experiment, then update the learning section."

## Template Values

```yaml
title: [from Step 2]
id: E-2026-{auto}
type: experiment
parent_initiative: [from Step 1]
status: planned
hypothesis:
  statement: [from Step 3]
  confidence: low
  validation_method: [from Step 4]
time_box: "2 weeks"
success_criteria: [from Step 5]
learning:
  outcome: null
  key_insight: null
  recommendation: null
created: {today}
updated: {today}
```

## Quick Mode

`/pm-experiment I-2026-001 "Test checkout" --method interview --criteria ">60% cite friction"`
