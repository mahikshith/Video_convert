---
mode: agent
description: "Plan-only mode for a specific task"
---

Task: ${input:task:describe the task}

Produce a plan only. Do not code, run commands, or edit files.

Deliver:
1. Understanding in your own words
2. Files to create/modify with reason
3. Public API changes if any
4. Data flow in text
5. Failure modes and mitigations
6. Tests to add/modify
7. Verification commands
8. Estimated time
9. Confidence (High/Medium/Low) + justification

Wait for approval before implementing.
