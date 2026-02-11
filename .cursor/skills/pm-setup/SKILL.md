---
name: pm-setup
version: 1.0.0
description: First-time setup - configure git identity and verify environment
triggers:
  - /pm-setup
  - setup pm
disable-model-invocation: true
---

# PM Setup

First-time setup for new users. Run this before creating any documents.

## Usage

```
/pm-setup
```

## What It Does

1. Checks git user.name and user.email
2. Prompts to set if missing
3. Verifies directory structure
4. Confirms Front Matter CMS installed

## Process

### Step 1: Check Git Identity

```bash
git config user.name
git config user.email
```

**If missing, prompt:**

```
⚠️ Git identity not configured.

Please provide your name and email for commits:

Name (e.g., "Jane Smith"):
>

Email (e.g., "jane@duetto.com"):
>
```

**Then set:**
```bash
git config user.name "Jane Smith"
git config user.email "jane@duetto.com"
```

### Step 2: Verify Directories

```bash
for dir in initiatives/2026 experiments/2026 prds/active team-charters; do
  [ -d "$dir" ] || mkdir -p "$dir"
done
```

### Step 3: Verify Config Files

- Check `frontmatter.json` exists
- Check `.cursor/skills/` has skills

### Step 4: Report

```
✅ PM SETUP COMPLETE
====================

Git Identity:
  Name:  Jane Smith
  Email: jane@duetto.com

Directories: ✓ All present
Config:      ✓ frontmatter.json
Skills:      ✓ 11 skills installed

You're ready! Start with:
  /pm-help        Show all commands
  /pm-initiative  Create your first initiative
```

## Scope

This skill handles setup **within this repo only**.

Out of scope:
- Creating new repositories
- GitHub authentication
- Installing Cursor extensions

Those are handled by experienced users or automation.
