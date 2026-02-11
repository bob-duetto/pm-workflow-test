---
title: "{{TITLE}}"
id: {{ID}}
type: experiment
parent_initiative: {{PARENT_INITIATIVE}}
status: planned

hypothesis:
  statement: "{{HYPOTHESIS}}"
  confidence: low
  validation_method: {{VALIDATION_METHOD}}

time_box: "2 weeks"
success_criteria: "{{SUCCESS_CRITERIA}}"

learning:
  outcome: null
  key_insight: null
  recommendation: null
  evidence: []

created: {{TODAY}}
updated: {{TODAY}}
author: "{{AUTHOR}}"
tags:
  - {{PRODUCT_AREA}}
---

# Experiment: {{TITLE}}

## Parent Initiative
- **Initiative:** [{{PARENT_INITIATIVE}}](../../initiatives/2026/{{PARENT_INITIATIVE}}.md)

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
- **Type:** {{VALIDATION_METHOD}}
- **Duration:** 2 weeks
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
