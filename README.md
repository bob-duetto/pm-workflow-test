# APEX PM Workflow

**AI-assisted Product Execution framework for Duetto Product Managers**

## What Is This?

This repository provides **Cursor IDE skills** and **visual editing tools** for Duetto's APEX (AI Product Execution) workflow. It enables Product Managers to:

- Create and track **Initiatives** (strategic bets tied to team metrics)
- Run **Experiments** (hypothesis testing with 2-week time boxes)
- Write **PRDs** (specs linked to validated experiments)
- Monitor **Pipeline Status** (with time-box alerts)

All documents use YAML frontmatter for structured data, enabling AI-assisted automation and traceability from hypothesis to shipped feature.

## Why APEX?

| Traditional PDP | APEX Approach |
|-----------------|---------------|
| Feature-first thinking | Outcome-first (tied to metrics) |
| Build then validate | Validate then build |
| PRD → Engineering | Initiative → Experiments → PRD |
| Success = shipped | Success = metric moved |
| Killed features = failure | Killed initiatives = learning |

**Core principle:** No PRD without validated experiments. No experiment without a measurable hypothesis.

---

## Quick Start

### 1. Clone and Open

```bash
git clone https://github.com/bob-duetto/pm-workflow-test.git
cd pm-workflow-test
cursor .
```

### 2. Install Extension

**Front Matter CMS** for visual YAML editing:
- `Cmd+Shift+X` → Search "Front Matter CMS" → Install

### 3. Use Slash Commands

In Cursor chat, type:

| Command | Creates |
|---------|---------|
| `/pm-initiative` | New strategic bet with metric target |
| `/pm-experiment` | Hypothesis test linked to initiative |
| `/pm-prd` | PRD from validated initiative |
| `/pm-status` | Pipeline overview with alerts |
| `/pm-doctor` | Verify config and check document health |

---

## The APEX Workflow

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  INITIATIVE │────▶│ EXPERIMENTS │────▶│     PRD     │────▶│   SHIPPED   │
│   (6 wks)   │     │  (2 wks ea) │     │  (Review)   │     │  (Measure)  │
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
     │                    │                   │                    │
   The Bet            Discovery            Build It           Learn From It
  "We believe..."   Test hypothesis     Full spec + Epic     Did metric move?
```

### Time Boxes (Enforced)

| Stage | Max Duration | Outcome |
|-------|--------------|---------|
| Initiative Discovery | 6 weeks | Validate or Kill |
| Single Experiment | 2 weeks | validated / invalidated / inconclusive |
| Max Experiments | 3 per initiative | Must decide after 3 |

### Status Alerts

```
⚠️  ALERTS
----------
• I-2026-001 approaching 6-week limit (10 days left)
• E-2026-004 over 2-week time box by 1 day
```

---

## Document Types

### Initiative (I-YYYY-NNN)

The strategic bet. Ties to a team metric.

```yaml
id: I-2026-001
type: initiative
status: discovery
metric_target: "booking_conversion_rate"
hypothesis: "We believe simplifying checkout will increase conversion by 15%"
```

### Experiment (E-YYYY-NNN)

Tests a hypothesis. Links to parent initiative.

```yaml
id: E-2026-003
type: experiment
parent_initiative: I-2026-001
hypothesis:
  statement: "Users abandon checkout because of too many steps"
  validation_method: interview
success_criteria: ">60% cite step count as friction"
```

### PRD (PRD-YYYY-NNN)

Full spec for validated initiatives. Links to experiments.

```yaml
id: PRD-2026-001
type: prd
parent_initiative: I-2026-001
validated_experiments: [E-2026-001, E-2026-003]
status: draft
```

---

## Directory Structure

```
├── .cursor/skills/         # Cursor slash commands
│   ├── pm-initiative/      # /pm-initiative
│   ├── pm-experiment/      # /pm-experiment
│   ├── pm-prd/             # /pm-prd
│   ├── pm-status/          # /pm-status
│   └── pm-doctor/          # /pm-doctor
├── initiatives/2026/       # Strategic bets
├── experiments/2026/       # Discovery artifacts
├── prds/active/            # Active specifications
├── team-charters/          # Team metrics (TC-NNN)
├── templates/              # Document templates
└── frontmatter.json        # Front Matter CMS config
```

---

## Visual Editing

**Front Matter CMS** provides form-based YAML editing:

1. Open any `.md` file
2. Click 📋 in the sidebar
3. Edit with dropdowns, date pickers, tag selectors

No manual YAML editing required.

---

## Integration with Claude Code

This repo also includes `.claude/agents/duetto-pm.md` for use with Claude Code CLI:

```bash
# Natural language commands
claude "create an initiative for improving time-to-value"
claude "what's the status of I-2026-001?"
```

---

## Success Metrics

| Metric | Healthy Target |
|--------|----------------|
| Initiative kill rate | 30-50% |
| Discovery duration | <6 weeks |
| Features with traceability | 100% |
| Experiments per validated initiative | 1-3 |

A healthy kill rate means you're taking appropriate risks and learning from invalidated hypotheses.

---

## Links

- [APEX Process Overview](https://notion.so/duetto/apex)
- [Team Charters](team-charters/)
- [PRD Templates](templates/)

---

*Duetto Research - AI Product Execution Framework*
*Created: 2026-02-11*
