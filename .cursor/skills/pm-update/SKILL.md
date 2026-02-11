---
name: pm-update
version: 1.0.0
description: Update status of an APEX document
triggers:
  - /pm-update
disable-model-invocation: true
---

# PM Update

Update the status of an initiative, experiment, or PRD.

## Usage

```
/pm-update I-2026-001 validated
/pm-update E-2026-003 completed
/pm-update PRD-2026-001 approved
```

## Valid Status Transitions

### Initiative

```
discovery → validated    (experiments successful)
discovery → killed       (experiments failed)
validated → delivery     (PRD approved)
delivery → shipped       (feature released)
```

### Experiment

```
planned → running        (started)
running → completed      (finished)
```

After `completed`, also update:
- `learning.outcome`: validated | invalidated | inconclusive
- `learning.key_insight`: What we learned
- `learning.recommendation`: Next step

### PRD

```
draft → review           (ready for approval)
review → approved        (CPO/CTO signed off)
approved → in-development (Epic created)
in-development → shipped (Released)
shipped → learning       (Measuring outcomes)
```

## Process

**Step 1: Parse command**
```
/pm-update {id} {new_status}
```

**Step 2: Validate transition**
Check current status allows transition to new status.

**Step 3: Update file**
- Change `status:` field
- Update `updated:` date
- If experiment completed, prompt for learnings

**Step 4: Report**
```
✅ Updated I-2026-001: discovery → validated
   Updated: 2026-02-11
   Next: Create PRD with /pm-prd I-2026-001
```

## Example: Complete Experiment

```
/pm-update E-2026-003 completed

📝 Experiment completed. Add learnings:

Outcome? [validated/invalidated/inconclusive]
> validated

Key insight?
> 72% of users cited too many steps as friction

Recommendation?
> Proceed with checkout simplification

✅ Updated E-2026-003: running → completed
   Outcome: validated
   Parent: I-2026-001 (has 2/3 experiments complete)
```
