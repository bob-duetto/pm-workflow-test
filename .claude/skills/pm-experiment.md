# PM Experiment Skill

Create a new APEX Experiment with hypothesis and learning sections, linked to parent initiative.

## Trigger
- User says "create experiment", "new experiment", "run experiment"
- User mentions "E-2026" or "experiment for [initiative]"

## Process

### Step 1: Validate Parent Initiative
```bash
# Check initiative exists
ls initiatives/2026/I-2026-{NNN}.md
```
If not found, ask user to specify valid initiative ID.

### Step 2: Get Next Experiment ID
```bash
ls experiments/2026/E-2026-*.md 2>/dev/null | sed 's/.*E-2026-//' | sed 's/\.md//' | sort -n | tail -1
```
Increment by 1. If none exist, start at 001.

### Step 3: Gather Information
Ask for (if not provided):
- **Title**: What are we testing?
- **Parent Initiative**: I-2026-NNN (required)
- **Hypothesis**: "We believe [X] will [Y] because [Z]"
- **Validation Method**: interview | analytics | prototype | a_b_test | spike
- **Success Criteria**: What threshold validates/invalidates?
- **Time Box**: Default 2 weeks

### Step 4: Create File
Location: `experiments/2026/E-2026-{NNN}.md`

### Step 5: Populate Template

```yaml
---
title: "[Title from user]"
id: E-2026-{NNN}
type: experiment
parent_initiative: I-2026-{PARENT}
status: planned

hypothesis:
  statement: "[From user]"
  confidence: low
  validation_method: [From user]

time_box: "2 weeks"
success_criteria: "[From user]"

learning:
  outcome: null
  key_insight: null
  recommendation: null
  evidence: []

created: {TODAY}
updated: {TODAY}
author: "[PM Name]"
tags:
  - [product-area]
---

# Experiment: [Title]

## Parent Initiative
- **Initiative:** [I-2026-{PARENT}](../initiatives/2026/I-2026-{PARENT}.md)

---

## HYPOTHESIS (Before)

### Problem Statement
[What problem are we solving?]

### Hypothesis Statement
**We believe that** [target user segment]
**Will** [take action / achieve outcome]
**If we** [provide capability/feature]
**Because** [underlying assumption]

### Confidence Level
- **Confidence:** low
- **Key Assumptions:**
  1. [Assumption 1]
  2. [Assumption 2]

---

## EXPERIMENT DESIGN (During)

### Objective
[What specific question are we answering?]

### Method
- **Type:** [validation_method]
- **Duration:** [time_box]
- **Sample Size:** [TBD]

### Success Criteria
| Criterion | Validates If | Invalidates If |
|-----------|--------------|----------------|
| [Metric] | [Threshold] | [Threshold] |

### Execution Log
| Date | Activity | Observation |
|------|----------|-------------|
| | | |

---

## THESIS / LEARNING (After)

*Complete this section when the experiment is done.*

### Results Analysis
[TBD]

### Outcome
**Result:** [validated | invalidated | inconclusive]

### Key Learning
[TBD]

### Recommendation
**Next Step:** [TBD]
**Rationale:** [TBD]
```

### Step 6: Update Parent Initiative
Add experiment to initiative's `related_experiments` array:
```yaml
related_experiments:
  - E-2026-{NNN}
```

### Step 7: Confirm
Report:
- File created: `experiments/2026/E-2026-{NNN}.md`
- Parent initiative updated
- Status: planned
- Next step: Run experiment, then update learning section

## Validation Rules
- Parent initiative MUST exist
- Parent initiative should be in `discovery` status
- Experiment count for initiative should be ≤ 3
