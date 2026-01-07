---
description: Create tasks in Google Tasks with Reclaim AI formatting. Use when user wants to create a todo, task, or reminder that should be scheduled on their calendar via Reclaim.
---

# Reclaim AI Task Creation

## Overview
Tasks are created in Google Tasks and synced to Reclaim AI, which schedules them as calendar events.

## Task List
Add all tasks to the `Reclaim` Google Tasks list.

## Title Format
All tokens go inside a single parenthesis block, space-separated:
```
Task description (type:work duration:30m priority:P2 due:Friday)
```

## Required Tokens

| Token | Format | Examples |
|-------|--------|----------|
| `duration` | `duration:<value>` | `duration:30m`, `duration:1h`, `duration:2h` |
| `priority` | `priority:<value>` | `priority:critical`, `priority:P1`, `priority:P2`, `priority:P3`, `priority:P4` |
| `type` | `type:<value>` | `type:work`, `type:personal` |

## Optional Tokens

| Token | Format | Examples |
|-------|--------|----------|
| `due` | `due:<date>` | `due:Friday`, `due:tomorrow`, `due:3/31/2025 11am` |
| `not-before` | `not-before:<date>` | `not-before:Monday` |
| `nosplit` | `nosplit` | Include when task must be one block |
| `upnext` | `upnext` | Send to Up Next queue |

## Defaults
- **Due**: If not specified, set `due:<today+3d>`
- **Nosplit**: Omit unless single block is required

## Duration Estimation
Infer duration from task content:
- Review/read: 30-45m
- Write/draft: 45-90m
- Refactor/organize: 1-2h
- If unclear, ask or use conservative shorter duration

## Examples

**Work task (split allowed):**
```
Follow up with vendor (type:work duration:30m due:Friday priority:P2)
```

**Personal task (one block):**
```
Organize garage (type:personal duration:2h priority:P3 nosplit due:Saturday)
```

**Urgent task:**
```
Draft blog outline (type:work duration:45m priority:critical upnext due:today)
```

## Notes Field
Put details, links, and context in the Google Tasks notes field. This appears in the Reclaim-scheduled calendar event description.
