# Security

- Never request or expose secrets. Assume `.env`, `secrets/`, `~/.ssh`, `~/.aws`, `~/.gnupg` are sensitive.
- Prefer `WebFetch` over `curl/wget` for any browsing-like needs.
- If a command could be destructive or expensive, ask and explain impact first.
