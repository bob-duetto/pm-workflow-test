---
title: "{{TITLE}}"
id: {{ID}}
type: prd
status: draft
parent_initiative: {{PARENT_INITIATIVE}}
validated_experiments:
  {{EXPERIMENTS}}
epic_id: null
approvers:
  - CPO
  - CTO
created: {{TODAY}}
updated: {{TODAY}}
author: "{{AUTHOR}}"
tags:
  - {{PRODUCT_AREA}}
---

# PRD: {{TITLE}}

## Document Info
| Field | Value |
|-------|-------|
| PRD ID | {{ID}} |
| Initiative | [{{PARENT_INITIATIVE}}](../../initiatives/2026/{{PARENT_INITIATIVE}}.md) |
| Status | draft |
| Author | {{AUTHOR}} |
| Created | {{TODAY}} |

## Approvals
| Role | Name | Status | Date |
|------|------|--------|------|
| CPO | | Pending | |
| CTO | | Pending | |

---

## Executive Summary

### Problem Statement
[What user problem does this solve?]

### Solution Summary
[High-level approach - 2-3 sentences]

### Success Metrics
| Metric | Current | Target | Measurement |
|--------|---------|--------|-------------|
| | | | |

---

## Background

### Evidence from Discovery
Based on experiments from {{PARENT_INITIATIVE}}:

{{#each EXPERIMENTS}}
- **{{this}}**: [Key learning]
{{/each}}

### User Research
[Summary of user interviews, analytics, etc.]

---

## Requirements

### User Stories

#### US-001: [Story Title]
**As a** [user type]
**I want** [capability]
**So that** [benefit]

**Acceptance Criteria:**
```gherkin
Given [context]
When [action]
Then [expected result]
```

### Non-Functional Requirements
| Requirement | Target | Priority |
|-------------|--------|----------|
| Performance | | P1 |
| Security | | P1 |
| Accessibility | | P2 |

---

## Design

### User Flow
[Link to Figma or describe flow]

### API Changes
[If applicable]

### Data Model Changes
[If applicable]

---

## Implementation

### Scope
**In Scope:**
-

**Out of Scope:**
-

### Dependencies
| Dependency | Owner | Status |
|------------|-------|--------|
| | | |

### Risks
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| | | | |

---

## Launch Plan

### Rollout Strategy
- [ ] Feature flag
- [ ] Beta users
- [ ] Gradual rollout
- [ ] Full release

### Documentation
- [ ] User docs
- [ ] API docs
- [ ] Release notes

---

## Appendix

### Related Documents
- Initiative: [{{PARENT_INITIATIVE}}](../../initiatives/2026/{{PARENT_INITIATIVE}}.md)
- Experiments: {{EXPERIMENTS}}

### Revision History
| Date | Version | Author | Changes |
|------|---------|--------|---------|
| {{TODAY}} | 0.1 | {{AUTHOR}} | Initial draft |
