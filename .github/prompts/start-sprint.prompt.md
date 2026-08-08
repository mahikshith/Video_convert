---
mode: agent
description: "Start a new sprint session"
---

# Start Sprint Session

## Phase 1: Load Context

Read ONLY:
1. .github/copilot-instructions.md
2. context/CURRENT_STATE.md
3. context/NEXT_STEPS.md
4. context/KNOWN_ISSUES.md
5. tasks/${input:sprintFile:sprint file path}

## Phase 2: Present Understanding

Respond with:
- Where the project stands (from CURRENT_STATE.md)
- What this sprint aims to accomplish
- Which single task you propose to tackle in this session
- Any blockers from KNOWN_ISSUES.md that affect this task
- Estimated time

## Phase 3: Present Task Plan

- Files to create/modify (list each)
- Packages to add (with license note)
- Commands to run
- Verification steps
- Risks

## Phase 4: STOP

Wait for "go".

## Phase 5: Execute (After Approval)

- Small commits
- Run flutter analyze after each meaningful change
- Stop and ask if any command fails
- Do not expand scope

## Phase 6: Session Close

1. Update context/CURRENT_STATE.md
2. Update context/NEXT_STEPS.md
3. Append to docs/DECISIONS.md if any decision was made
4. Append to context/KNOWN_ISSUES.md if a bug was found
5. Commit all changes
6. Print 5-bullet session summary
