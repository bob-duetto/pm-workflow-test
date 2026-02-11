# PM Workflow Test Repository

Test repository for Duetto's APEX/PDP product development workflow with AI-assisted tooling.

## Quick Start

### 1. Install Cursor Extensions

1. **Front Matter CMS** - Visual YAML frontmatter editing
   - Open Cursor → `Cmd+Shift+X` → Search "Front Matter CMS" → Install

### 2. Use Slash Commands (Cursor Skills)

Type these in Cursor chat to create documents:

| Command | What It Does |
|---------|--------------|
| `/pm-initiative` | Create new initiative with guided prompts |
| `/pm-experiment` | Create experiment linked to initiative |
| `/pm-prd` | Create PRD from validated initiative |
| `/pm-status` | Show workflow status and alerts |

### 3. Visual Frontmatter Editing

1. Open any `.md` file
2. Click the **Front Matter icon** (📋) in the sidebar
3. Edit fields with dropdowns, date pickers, and tag selectors

---

## Workflow Overview

```
INITIATIVE → EXPERIMENTS → PRD → EPIC/STORIES → CODE → MEASURE → LEARN
    │            │           │        │           │        │         │
  The Bet    Discovery    Review   Track       Test    Verify    Iterate/
 (Metric)   (hypothesis   Approve  Progress    Ship    Impact      Kill
            + learning)
```

### Time Boxes

| Artifact | Max Duration | Alert Threshold |
|----------|--------------|-----------------|
| Initiative (discovery) | 6 weeks | Week 5 |
| Experiment | 2 weeks | Day 12 |
| PRD (review) | 2 weeks | Day 10 |

---

## Directory Structure

```
├── .cursor/
│   ├── rules/              # AI context rules
│   └── skills/             # Slash command skills
│       ├── pm-initiative/  # /pm-initiative command
│       ├── pm-experiment/  # /pm-experiment command
│       ├── pm-prd/         # /pm-prd command
│       └── pm-status/      # /pm-status command
├── .claude/
│   ├── agents/             # Claude Code agent (duetto-pm)
│   └── skills/             # Claude Code skills
├── initiatives/2026/       # Strategic bets (I-YYYY-NNN)
├── experiments/2026/       # Discovery artifacts (E-YYYY-NNN)
├── prds/active/            # Product specs (PRD-YYYY-NNN)
├── team-charters/          # Team metrics (TC-NNN)
├── templates/              # Document templates
└── frontmatter.json        # Front Matter CMS config
```

---

## Slash Command Details

### `/pm-initiative`

Creates a new initiative with guided prompts:

1. **Title** - What is this initiative about?
2. **Metric Target** - Which team metric will this move?
3. **Hypothesis** - "We believe [X] will [Y] by [Z]"
4. **Team** - Team charter ID (optional)

**Output:** `initiatives/2026/I-2026-{NNN}.md`

### `/pm-experiment`

Creates an experiment linked to an initiative:

1. **Parent Initiative** - I-2026-NNN
2. **Title** - What are we testing?
3. **Hypothesis** - "We believe [X] will [Y] because [Z]"
4. **Validation Method** - interview | analytics | prototype | a_b_test | spike
5. **Success Criteria** - What validates this?

**Output:** `experiments/2026/E-2026-{NNN}.md`

### `/pm-prd`

Creates a PRD from a validated initiative:

1. **Parent Initiative** - Must be validated
2. **Title** - Feature/product name
3. **Problem Statement** - What problem does this solve?
4. **Solution Summary** - High-level approach
5. **Success Metrics** - How will we measure success?

**Output:** `prds/active/PRD-2026-{NNN}/PRD-2026-{NNN}.md`

### `/pm-status`

Shows workflow status:

```
📊 APEX WORKFLOW STATUS
=======================

🔬 DISCOVERY (6 week max)
-------------------------
I-2026-001: Booking Conversion    Week 4/6  🟡  2 experiments

🧪 EXPERIMENTS (2 week max)
---------------------------
E-2026-003: Checkout Interviews   Day 5/14  🟢  → I-2026-001

⚠️  ALERTS
----------
• I-2026-001 approaching 6-week limit (10 days left)
```

---

## Alternative Methods

### VS Code/Cursor Snippets

In any `.md` file, type a prefix and press Tab:

| Prefix | Creates |
|--------|---------|
| `initiative` | Initiative template |
| `experiment` | Experiment template |
| `prd` | PRD template |
| `charter` | Team Charter template |

### Claude Code CLI

If using Claude Code alongside Cursor:

```bash
# Claude agent commands
claude "create an initiative for booking improvements"
```

---

## Frontmatter Standards

All documents require YAML frontmatter:

```yaml
---
title: "Document Title"
id: I-2026-001              # Unique ID
type: initiative            # initiative | experiment | prd | team-charter
status: discovery           # See status workflows
created: 2026-02-11
updated: 2026-02-11
author: "PM Name"
tags:
  - product-area
  - quarter
---
```

### Status Workflows

**Initiative:**
```
discovery → validated → delivery → shipped
         └→ killed (with learnings)
```

**Experiment:**
```
planned → running → completed
```
Outcome: `validated` | `invalidated` | `inconclusive`

**PRD:**
```
draft → review → approved → in-development → shipped → learning
```

---

## Core Principles

| Principle | Description |
|-----------|-------------|
| **Outcome-First** | Every initiative ties to a team metric |
| **Hypothesis-Driven** | Start with a testable bet |
| **Evidence-Based** | Progression requires evidence |
| **Time-Boxed** | Max 6 weeks discovery, 2 weeks per experiment |
| **Learning-Captured** | Killed initiatives are celebrated |

---

## Success Metrics

| Metric | Target |
|--------|--------|
| Initiative kill rate | 30-50% (healthy learning) |
| Discovery duration | <6 weeks |
| Traceability | 100% features linked |

---

*Status: Test Repository*
*Created: 2026-02-11*
