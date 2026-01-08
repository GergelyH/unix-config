# Google Workspace Defaults

## Default Account
- **Google email**: `gergely.halacsy@gmail.com`
- When using Google Workspace MCP tools (Calendar, Tasks, Gmail, Drive), use this email unless explicitly specified.
- **Calendars**: prefer `primary` unless a different `calendar_id` is given.

## Task/Todo Disambiguation
- If user mentions "task" or "todo" without specifying a system, **assume Google Tasks**.
- Use Google Workspace MCP to list, create, update, and complete tasks.
- If user explicitly references Jira, GitHub Issues, Asana, or Notion, use that system instead.
- Confirm before permanently deleting tasks when context is ambiguous.
