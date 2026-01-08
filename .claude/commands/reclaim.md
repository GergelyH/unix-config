---
description: Manage Reclaim.ai tasks
argument-hint: [action] [details]
---

Interact with Reclaim.ai using the reclaim-sdk Python library.

## Setup
```bash
pip install reclaim-sdk
```

The API key is in `$RECLAIM_TOKEN` environment variable.

## Authentication
```python
from reclaim_sdk.client import ReclaimClient
import os

ReclaimClient.configure(token=os.environ["RECLAIM_TOKEN"])
```

## Task Operations

### View current task
```python
from reclaim_sdk.resources.task import Task
tasks = Task.list()
current = [t for t in tasks if t.status == "IN_PROGRESS"]
if current:
    t = current[0]
    print(f"Current: {t.title} | priority: {t.priority} | due: {t.due}")
else:
    print("No task currently in progress")
```

### List tasks
```python
from reclaim_sdk.resources.task import Task
tasks = Task.list()
for t in tasks:
    print(f"{t.title} | {t.status} | due: {t.due}")
```

### Create task
```python
task = Task(
    title="Task name",
    notes="Optional description",
    duration=2.0,  # hours
    due=datetime(2025, 1, 15),
    priority="P2",  # P1-P4
    event_category="WORK",  # or PERSONAL
)
task.save()
```

### Update task
```python
task = Task.get(task_id)
task.title = "New title"
task.duration = 3.0
task.save()
```

### Complete/start/stop
```python
task.mark_complete()
task.mark_incomplete()
task.start()
task.stop()
task.add_time(0.5)  # add 30 min
```

### Delete
```python
task.delete()
```

## Task Properties
- `title`, `notes`: strings
- `status`: NEW, SCHEDULED, IN_PROGRESS, COMPLETE, CANCELLED, ARCHIVED
- `priority`: P1, P2, P3, P4
- `duration`: hours (converts to 15-min chunks)
- `due`: datetime
- `event_category`: WORK, PERSONAL
- `on_deck` / `up_next`: bool (prioritized)
- `at_risk`: bool (completion at risk)

## User request
$ARGUMENTS
