---
mode: agent
description: "Architectural drift review"
---

Review lib/ for:

1. Deviations from claude/ENGINEERING_RULES.md
2. Deviations from claude/UI_RULES.md
3. Widgets containing business logic (file + line)
4. Files exceeding 300 lines
5. Duplicated logic across features
6. Test coverage gaps
7. Any dynamic types, print() calls, TODOs
8. Packages not in the locked tech stack

Do NOT fix anything. Produce a report.
Categorize: Critical / Major / Minor.

Save to context/CODE_REVIEW_${input:date:YYYY-MM-DD}.md and commit.
