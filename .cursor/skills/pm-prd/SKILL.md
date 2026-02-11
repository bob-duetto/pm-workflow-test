---
name: pm-prd
version: 1.0.0
description: Create a new PRD with guided prompts
triggers:
  - /pm-prd
  - create prd
disable-model-invocation: true
---

# Create PRD

When user types `/pm-prd`, guide them through creating a PRD from a validated initiative.

## OUTPUT LOCATION

**Directory:** `prds/active/PRD-2026-{NNN}/`
**Filename:** `PRD-2026-{NNN}.md` (auto-increment NNN)
**Example:** `prds/active/PRD-2026-002/PRD-2026-002.md`

⚠️ ALWAYS create PRD in its own subdirectory under `prds/active/`
⚠️ Never create PRDs at root or directly in `prds/active/`

## Interactive Flow

**Step 1: Parent Initiative**
> Which validated initiative is this PRD for?
> Enter initiative ID (e.g., I-2026-001)

*Validate: Initiative must exist and be in `validated` or `delivery` status.*

**Step 2: Title**
> What is the feature/product name?
> Example: "Streamlined Checkout Flow"

**Step 3: Problem Statement**
> What user problem does this solve? (1-2 sentences)
> Example: "Users abandon checkout due to too many steps"

**Step 4: Solution Summary**
> High-level approach (1-2 sentences)
> Example: "Reduce checkout to 3 steps with progress indicator"

**Step 5: Success Metrics**
> How will we measure success?
> Example: "Increase checkout completion from 45% to 60%"

## After Gathering Info

1. **Generate ID**: Find next available ID
2. **Create directory**: `prds/active/PRD-2026-{NNN}/`
3. **Create file**: `prds/active/PRD-2026-{NNN}/PRD-2026-{NNN}.md`
4. **Link experiments**: Pull from initiative's `related_experiments`
5. **Update initiative**: Set `related_prd: PRD-2026-{NNN}`
6. **Report**: "Created PRD-2026-{NNN}. Status: draft. Fill in user stories and get approvals."

## Template Values

```yaml
title: [from Step 2]
id: PRD-2026-{auto}
type: prd
status: draft
parent_initiative: [from Step 1]
validated_experiments: [from initiative]
epic_id: null
approvers: [CPO, CTO]
created: {today}
updated: {today}
```

## Validation

Before creating PRD:
- Initiative must exist
- Initiative status must be `validated` or `delivery`
- At least one experiment should have `outcome: validated`

If validation fails, explain what's needed before a PRD can be created.
