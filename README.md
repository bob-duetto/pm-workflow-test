# PM Workflow Test Repository

Test repository for Duetto's APEX/PDP product development workflow with AI-assisted tooling.

## Quick Start

### Using VS Code/Cursor Snippets

In any `.md` file, type one of these prefixes and press Tab:

| Prefix | Creates |
|--------|---------|
| `initiative` or `INIT` | New Initiative (The Bet) |
| `experiment` or `EXP` | New Experiment (Hypothesis + Learning) |
| `prd` or `spec` | New PRD (Product Requirements Document) |
| `charter` or `TC-` | New Team Charter |
| `fm` | Quick frontmatter block |

### Directory Structure

```
├── initiatives/          # Strategic bets (I-YYYY-NNN)
│   ├── 2026/            # Active initiatives
│   └── archive/         # Completed/killed initiatives
├── experiments/         # Discovery artifacts (E-YYYY-NNN)
│   ├── 2026/
│   └── archive/
├── team-charters/       # Team metrics (TC-NNN)
├── prds/                # Product specs (PRD-YYYY-NNN)
│   ├── active/
│   ├── shipped/
│   └── archive/
├── retrospectives/      # Learning capture
├── templates/           # Document templates
├── ds-work/             # Data Science work
│   ├── analysis/        # Ad-hoc analysis
│   ├── models/          # Model artifacts
│   └── notebooks/       # Jupyter notebooks
└── schemas/             # Frontmatter validation
```

## Workflow Overview

```
INITIATIVE → EXPERIMENTS → PRD → EPIC/STORIES → CODE → MEASURE → LEARN
    │            │           │        │           │        │         │
  The Bet    Discovery    Review   Track       Test    Verify    Iterate/
 (Metric)   (hypothesis   Approve  Progress    Ship    Impact      Kill
            + learning)
```

### Core Principles

| Principle | Description |
|-----------|-------------|
| **Outcome-First** | Every initiative ties to a team metric |
| **Hypothesis-Driven** | Start with a testable bet |
| **Evidence-Based** | Progression requires evidence |
| **Time-Boxed** | Max 6 weeks discovery, 2 weeks per experiment |
| **Learning-Captured** | Killed initiatives are celebrated |

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

## Status Workflows

### Initiative
```
discovery → validated → delivery → shipped
         └→ killed (with learnings)
```

### Experiment
```
planned → running → completed
```
Outcome: `validated` | `invalidated` | `inconclusive`

### PRD
```
draft → review → approved → in-development → shipped → learning
```

## Cursor AI Integration

This repo includes `.cursor/rules/` for AI-assisted workflow:

1. **Context-aware suggestions** when editing PM documents
2. **Frontmatter validation** guidance
3. **Linking assistance** for related documents
4. **Status transition** recommendations

## Creating New Documents

### New Initiative

```bash
# Option 1: Use snippet (in Cursor/VS Code)
# Type "initiative" in a new .md file and press Tab

# Option 2: Copy template
cp templates/initiative-template.md initiatives/2026/I-2026-XXX.md
```

### New Experiment

```bash
# Must link to parent initiative
cp templates/experiment-template.md experiments/2026/E-2026-XXX.md
```

### New PRD

```bash
# Must link to validated initiative and experiments
cp templates/prd-template.md prds/active/PRD-2026-XXX/PRD-2026-XXX.md
```

## JIRA Integration

| Spec Document | JIRA |
|---------------|------|
| Initiative | Theme (Portfolio) |
| Experiment | Story (if tracking) |
| PRD | Epic |
| User Story | Story |

## Git Workflow

```bash
# Create branch for new spec
git checkout -b initiative/I-2026-XXX

# Commit with conventional format
git commit -m "feat(initiative): Add I-2026-XXX - Brief Description"

# Create PR
gh pr create --title "Initiative: Brief Description"
```

## Time Constraints

- **Initiative discovery**: Max 6 weeks
- **Single experiment**: Max 2 weeks
- **Max experiments per initiative**: 3

## Success Metrics

| Metric | Target |
|--------|--------|
| Initiative kill rate | 30-50% (healthy learning) |
| Discovery duration | <6 weeks |
| Traceability | 100% features linked |

---

*Status: Test Repository*
*Created: 2026-02-11*
