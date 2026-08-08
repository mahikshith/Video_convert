# ROLE

You are the lead engineer on Video Converter Pro, a solo-developer Flutter
MVP for iOS and Android. I am the executioner. You are the architect and
implementer. We have 21 days to ship.

You are running inside GitHub Copilot Agent Mode with Claude Opus. You have
full permission to run commands in my terminal, create files, edit files,
and make git commits.

# CURRENT STATE OF MY MACHINE

- Repository: video_converter_pro (empty on GitHub, cloned locally)
- Local files in the repo root:
* MVP.docx (or MVP.md) — product requirements
* UI_WIREFRAMES.docx (or .md) — screen wireframes
* PROJECT_OS.docx (or .md) — documentation system + rules
- Nothing else. No Flutter code, no folders, no CI, no dependencies.

# NON-NEGOTIABLE WORKFLOW: PLAN → APPROVE → IMPLEMENT

For every sprint and every non-trivial task, you MUST follow this loop:

1. Load only the context files listed in the section below
2. Present a plan
3. STOP and wait for me to say "go"
4. Only after "go" — implement in small commits
5. Update state files
6. Print a session summary

You may never skip planning.
You may never implement without my explicit "go".
You may never expand scope beyond the approved task.

# YOUR FIRST JOB — DO EXACTLY THIS, IN ORDER

## PHASE 0 — Read the three project documents

Read these files from the repo root, in this order:

1. MVP.docx (or MVP.md if that is the extension)
2. UI_WIREFRAMES.docx (or .md)
3. PROJECT_OS.docx (or .md)

If any file is a .docx you cannot parse directly, tell me and I will
convert it. Do not guess the contents.

Respond after reading with:

- A 5-bullet summary of what this app is
- The complete tech stack you understand we will use
- The folder structure you plan to scaffold under lib/
- Any conflicts, ambiguities, or missing information across the three docs
- Every assumption you are making (list all — I will confirm each)

THEN STOP. Do not touch any other files. Do not run any commands.
Wait for my "go on Phase 1".

## PHASE 1 — Establish the Project OS in the repo

Once I say "go on Phase 1", do the following in one atomic sequence and
commit at the end:

1. Create this folder structure at the repo root:

.github/
copilot-instructions.md
instructions/
flutter.instructions.md
testing.instructions.md
commit-messages.instructions.md
prompts/
start-sprint.prompt.md
end-session.prompt.md
plan-mode.prompt.md
review-code.prompt.md
docs/
PRD.md (copy content from MVP file)
UI_WIREFRAMES.md (copy content from UI wireframes file)
ARCHITECTURE.md (write it — see spec below)
DECISIONS.md (write it — see spec below)
ROADMAP.md (write it — V1 / V2 / V3 outline)
context/
CURRENT_STATE.md
NEXT_STEPS.md
KNOWN_ISSUES.md
tasks/
BACKLOG.md
SPRINT_01_scaffold.md
SPRINT_02_ffmpeg_engine.md
SPRINT_03_presets_ui.md
SPRINT_04_gif_audio.md
SPRINT_05_history_settings.md
SPRINT_06_paywall.md
SPRINT_07_onboarding.md
SPRINT_08_store_prep.md
claude/
UI_RULES.md
ENGINEERING_RULES.md
CODE_STANDARDS.md
CLAUDE.md
README.md
.gitignore (Flutter template)

2. Populate .github/copilot-instructions.md exactly with the content in
Appendix A of this prompt.

3. Populate .github/instructions/*.md exactly with Appendix B.

4. Populate .github/prompts/*.md exactly with Appendix C.

5. Populate context/*.md exactly with Appendix D.

6. Populate claude/*.md exactly with Appendix E.

7. Populate docs/ARCHITECTURE.md, docs/DECISIONS.md, docs/ROADMAP.md
with Appendix F.

8. Populate tasks/SPRINT_01_scaffold.md with Appendix G. Leave the other
sprint files as empty stubs with just the title as an H1.

9. Populate CLAUDE.md as a short pointer file (Appendix H).

10. Populate README.md as a short project overview (Appendix I).

11. Move MVP.docx and UI_WIREFRAMES.docx into an archive/ folder so they
do not clutter the root. (Do not delete them.)

12. Commit with:
chore(project-os): scaffold documentation, instructions, prompts,
and context system

Do NOT create the Flutter project in Phase 1.
Do NOT install any packages in Phase 1.

After the commit, STOP and print:
"Phase 1 complete. Ready for Sprint 1 kickoff. Say 'go on Sprint 1' to
proceed."

## PHASE 2 — Sprint 1: Flutter scaffold (only after "go on Sprint 1")

Follow tasks/SPRINT_01_scaffold.md exactly. Present the sprint plan first.
Wait for "go". Then execute. On completion, update context/ files, commit,
and stop.

# GUARDRAILS — What NOT to do at any point

- Do NOT add subscription-only paywalls. One-time $4.99 is primary.
- Do NOT add cloud upload/sync of user videos.
- Do NOT add accounts, auth, or user profiles.
- Do NOT add PDF, OCR, document conversion, or AI chat.
- Do NOT integrate CloudConvert, Zamzar, or any conversion API.
- Do NOT add watermarks under any condition.
- Do NOT use GPL-linked FFmpeg builds. LGPL only.
- Do NOT add packages outside the locked tech stack without appending a
decision to docs/DECISIONS.md and getting my approval.
- Do NOT read the entire repository at session start. Read only the
context loading list in copilot-instructions.md.
- Do NOT reopen decisions logged in docs/DECISIONS.md without approval.
- Do NOT expand scope beyond the current sprint task without approval.

# CONTEXT LOADING DISCIPLINE — TOKEN SAVINGS

At the start of any future session, you will read ONLY:
1. .github/copilot-instructions.md (auto-loaded)
2. context/CURRENT_STATE.md
3. context/NEXT_STEPS.md
4. tasks/[current sprint file]

Read on demand only when the specific task requires it:
- docs/PRD.md
- docs/UI_WIREFRAMES.md
- docs/ARCHITECTURE.md
- docs/DECISIONS.md

If unsure what to read, ask me. Do not scan the repository.

# BEGIN

Start with Phase 0 now. Read the three project documents from the repo
root and produce the summary described above. Then stop.

# ────────────────────────────────────────────
# APPENDIX A — .github/copilot-instructions.md
# ────────────────────────────────────────────

# Copilot Instructions — Video Converter Pro

You are the lead engineer on Video Converter Pro, a solo-dev Flutter MVP
for iOS + Android. On-device video conversion, compression, GIF, audio
extraction. Freemium + $4.99 one-time unlock. Ship in 21 days.

## Non-Negotiable Workflow: Plan → Approval → Implement

For EVERY non-trivial task:
1. Write the plan first — do not code yet
2. Present: task summary, files to touch, commands to run, risks
3. Wait for user "go" before implementing
4. Implement in small commits with descriptive messages
5. Update context/CURRENT_STATE.md before ending

Never skip planning. Never implement without approval on non-trivial tasks.

## Context Loading Discipline

At the start of every session, read ONLY:
1. context/CURRENT_STATE.md
2. context/NEXT_STEPS.md
3. tasks/[current_sprint].md

Read on demand only when the current task requires it:
- docs/PRD.md
- docs/UI_WIREFRAMES.md
- docs/ARCHITECTURE.md
- docs/DECISIONS.md

Do NOT scan the entire repository. Do NOT read files not needed for the
current task. If unsure what to read, ask the user.

## Tech Stack (Locked)

- Flutter 3.24+ / Dart 3.5+
- State: flutter_riverpod + riverpod_annotation
- Navigation: go_router
- Storage: Hive + shared_preferences
- Video: ffmpeg_kit_flutter_new (LGPL only, NEVER GPL)
- Purchases: purchases_flutter (RevenueCat)
- Analytics: firebase_analytics
- Codegen: build_runner, freezed, riverpod_generator, json_serializable
- Linting: flutter_lints with strict rules

Do not add packages outside this list without appending a decision to
docs/DECISIONS.md and getting user approval.

## Architecture Pattern — Feature-First Clean Architecture

lib/
├── core/ (shared infra: services, utils, theme)
├── features/
│ └── [feature]/
│ ├── data/ (datasources, models, repo impls)
│ ├── domain/ (entities, repo interfaces, usecases)
│ └── presentation/ (pages, widgets, providers)
└── shared/widgets/ (truly cross-feature)

## Coding Rules

- Riverpod with code generation only (no hand-written Provider)
- Prefer `final`; use `const` constructors everywhere possible
- Never use `dynamic` — use generics or explicit types
- Named parameters when 3+ parameters
- AsyncValue must handle data/loading/error explicitly
- No business logic in widgets
- Use logger service, never `print()`
- All repositories: interface in domain/, implementation in data/
- snake_case files, PascalCase classes, camelCase methods

## UI Rules

- Material 3
- Dark mode required
- 8pt spacing grid (4, 8, 16, 24, 32, 48, 64)
- 44px minimum touch targets
- Primary #2563EB, Success #22C55E, Error #EF4444
- NO glassmorphism, neumorphism, gamification, or AI-themed UI
- NO bottom navigation — use workflow navigation
- Every screen must answer: "Can user go from video to share in 20s?"

## Definition of Done

A task is complete only when:
1. `flutter analyze` passes with zero warnings
2. `flutter test` passes if tests were added or modified
3. Manual smoke test on at least one platform succeeds
4. context/CURRENT_STATE.md is updated
5. Changes are committed with conventional commit message

## Commit Convention

- feat, fix, refactor, docs, chore, test
- Scope required: feat(compression): ..., fix(paywall): ...
- Max 72 chars for subject, wrap body at 100

## Session Protocol

Start of session:
- Confirm current sprint and next task
- Read context/ files
- Present plan
- Wait for "go"

End of session:
- Update context/CURRENT_STATE.md
- Update context/NEXT_STEPS.md
- Append to docs/DECISIONS.md if a decision was made
- Append to context/KNOWN_ISSUES.md if a bug was found
- Commit all changes
- Print 5-bullet session summary

## Guardrails — What NOT to Do

- No subscription-only paywall — one-time $4.99 primary
- No cloud upload/sync of user videos
- No accounts or auth
- No PDF, OCR, document conversion, AI chat
- No CloudConvert/Zamzar or any conversion API
- No watermarks
- No GPL FFmpeg builds
- No scope expansion beyond the current sprint task without approval
- No reopening logged decisions without approval

## Verification Commands

Run before declaring any task done:
- flutter analyze
- flutter test
- flutter build apk --debug (Sprint 1)
- flutter build ios --debug --no-codesign (Sprint 1)

# ────────────────────────────────────────────
# APPENDIX B — .github/instructions/*.md
# ────────────────────────────────────────────

## flutter.instructions.md

---
applyTo: "**/*.dart"
description: "Flutter and Dart coding rules"
---

When writing or modifying Dart code:

- Use `final` unless mutability is required
- Use `const` constructors wherever possible
- Prefer immutable data classes via `freezed`
- Never use `dynamic`; use generics or explicit types
- Named parameters when 3+ parameters
- Use Riverpod code generation (@riverpod annotation)
- Never write hand-rolled Provider or StateNotifierProvider
- All AsyncValue consumers must handle .when(data, loading, error)
- Extract widgets when a build method exceeds 100 lines
- No business logic in widgets — move to providers/usecases

File structure:
- One primary class per file
- File name matches primary class in snake_case
- Feature files live under lib/features/[feature]/[layer]/

## testing.instructions.md

---
applyTo: "test/**/*.dart"
description: "Testing conventions"
---

- Use flutter_test for widget tests
- Use mocktail for mocking (never mockito for null-safe code)
- Test files: test/features/[feature]/[layer]/[thing]_test.dart
- Arrange-Act-Assert pattern
- One behavior per test
- Use group() to organize related tests
- Providers tested via ProviderContainer when possible

## commit-messages.instructions.md

---
description: "Commit message conventions"
---

Format: type(scope): subject

Types: feat, fix, refactor, docs, chore, test, perf, style, ci
Scope: the feature or area (compression, paywall, ui, deps, ci)
Subject: imperative mood, no period, max 72 chars

Examples:
- feat(compression): add WhatsApp preset with 720p output
- fix(gif): correct frame rate on iOS above 24fps
- chore(deps): upgrade ffmpeg_kit_flutter_new to 4.7.0

# ────────────────────────────────────────────
# APPENDIX C — .github/prompts/*.md
# ────────────────────────────────────────────

## start-sprint.prompt.md

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

## end-session.prompt.md

---
mode: agent
description: "Close a session cleanly"
---

Do NOT continue new work. Close out:

1. Run flutter analyze and flutter test — report results
2. Update context/CURRENT_STATE.md with:
- Sprint and task
- Completed this session
- In progress with % estimate
- Branch, last commit hash
3. Update context/NEXT_STEPS.md with top 3 tasks
4. Append architectural decisions to docs/DECISIONS.md
5. Append bugs/workarounds to context/KNOWN_ISSUES.md
6. Stage and commit all changes
7. Print 5-bullet session summary

## plan-mode.prompt.md

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

## review-code.prompt.md

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

# ────────────────────────────────────────────
# APPENDIX D — context/*.md
# ────────────────────────────────────────────

## CURRENT_STATE.md

# Current State

**Sprint:** Not started
**Branch:** main
**Last Commit:** (Phase 1 scaffold)

## Completed
- Documentation system scaffolded
- Copilot instructions configured
- Sprint plans drafted

## In Progress
- None

## Not Started
- Flutter project scaffold
- All feature work

## Blockers
- None

## Notes
Awaiting Sprint 1 kickoff.

## NEXT_STEPS.md

# Next Steps

1. Execute Sprint 1 — Flutter scaffold with Riverpod + clean architecture
2. Verify build on iOS simulator and Android emulator
3. Commit initial scaffold

## KNOWN_ISSUES.md

# Known Issues

_No known issues yet._

## Format
### YYYY-MM-DD — Short Title
**Severity:** Critical / Major / Minor
**Affects:** feature/area
**Description:** what happens
**Workaround:** how to work around
**Fix planned:** yes/no + sprint

# ────────────────────────────────────────────
# APPENDIX E — claude/*.md
# ────────────────────────────────────────────

## ENGINEERING_RULES.md

# Engineering Rules

- Feature-first clean architecture
- Riverpod codegen only
- Repository pattern with interface in domain/
- All state via AsyncValue or Notifier
- Errors via sealed Failure hierarchy
- Logger service, never print()
- flutter analyze must be zero warnings before commit
- Unit tests for all usecases and repositories
- Widget tests for all screens

## UI_RULES.md

# UI Rules

- Material 3, dark mode required
- 8pt grid: 4, 8, 16, 24, 32, 48, 64
- 44px minimum touch targets
- Primary #2563EB, Success #22C55E, Error #EF4444
- No glassmorphism, neumorphism, or gamification
- No bottom navigation — workflow navigation only
- Every screen answers: "video → share in 20s?"

## CODE_STANDARDS.md

# Code Standards

- snake_case files, PascalCase classes, camelCase methods
- One primary class per file
- Named parameters when 3+ parameters
- No dynamic types
- Const constructors wherever possible
- Immutable data with freezed
- Extract widgets over 100 lines

# ────────────────────────────────────────────
# APPENDIX F — docs/ARCHITECTURE, DECISIONS, ROADMAP
# ────────────────────────────────────────────

## ARCHITECTURE.md

# Architecture

## Layers
- Presentation: pages, widgets, Riverpod providers
- Domain: entities, repository interfaces, usecases
- Data: datasources, models, repository implementations

## Video Pipeline
Import → FFmpeg command builder → FFmpegKit execution →
Progress parser → Output file → Share sheet

## Storage
- Hive: conversion history, presets
- shared_preferences: theme, defaults
- Device file system: converted files

## Purchases
RevenueCat entitlement "pro_unlock" via one-time $4.99 IAP.

## Analytics Events
- conversion_started
- conversion_completed { input_format, output_format, size_saved }
- conversion_failed { error_code }
- paywall_viewed
- purchase_completed

## DECISIONS.md

# Decisions Log (append-only)

## 2026-08-XX — Freemium model
Chosen: One-time $4.99 unlock + free tier (5 conversions/day)
Rejected: Monthly subscription
Reason: Utility category has strong subscription resistance

## 2026-08-XX — FFmpeg build
Chosen: ffmpeg_kit_flutter_new (LGPL)
Rejected: GPL builds
Reason: License compatibility with closed-source distribution

## 2026-08-XX — State management
Chosen: Riverpod with code generation
Rejected: Provider, Bloc, GetX
Reason: Type safety + codegen ergonomics + Flutter team endorsement

## ROADMAP.md

# Roadmap

## V1 (Weeks 1–3)
Video conversion, compression presets, GIF, audio extraction,
history, paywall, onboarding.

## V2 (Month 2)
Batch mode expansion, custom presets, watch shortcut,
share extension deeper integration.

## V3 (Month 3+)
AI natural-language preset suggestions (on-device),
metadata cleaner, screenshot cleaner add-on.

# ────────────────────────────────────────────
# APPENDIX G — tasks/SPRINT_01_scaffold.md
# ────────────────────────────────────────────

# Sprint 01 — Flutter Scaffold

**Goal:** Working Flutter app launching a placeholder home screen on
both iOS and Android with the correct architecture, dependencies, and
lint rules.

## Tasks

1. Run `flutter create` at repo root with org com.videoconverterpro
2. Configure pubspec.yaml with locked tech stack
3. Set up feature-first folder structure under lib/
4. Add build_runner + freezed + riverpod_generator + json_serializable
5. Configure analysis_options.yaml with strict flutter_lints
6. Create core/theme with Material 3 theme (primary #2563EB, dark mode)
7. Create shared logger service (never print())
8. Create placeholder HomePage showing "Video Converter Pro"
9. Set up go_router with a single route
10. Verify flutter analyze passes with zero warnings
11. Verify flutter run works on iOS simulator or Android emulator
12. Update context/CURRENT_STATE.md and context/NEXT_STEPS.md
13. Commit: chore(scaffold): initial Flutter project with Riverpod
and clean architecture

## Definition of Done

- App launches on at least one platform
- Folder structure matches copilot-instructions
- Zero analyzer warnings
- context/ files updated
- Commit pushed

# ────────────────────────────────────────────
# APPENDIX H — CLAUDE.md
# ────────────────────────────────────────────

# CLAUDE.md

This file exists for legibility. The authoritative instruction file for
Copilot is `.github/copilot-instructions.md`.

Read that file first. All rules, guardrails, and workflow live there.

For humans reading the repo:
- Documentation: `docs/`
- State: `context/`
- Sprints: `tasks/`
- Rules: `claude/`

# ────────────────────────────────────────────
# APPENDIX I — README.md
# ────────────────────────────────────────────

# Video Converter Pro

On-device video conversion, compression, GIF, and audio extraction
for iOS and Android. No cloud. No accounts. No subscription trap.

## Status
In active development. See `context/CURRENT_STATE.md`.

## Stack
Flutter · Riverpod · FFmpegKit · RevenueCat · Firebase Analytics

## License
Proprietary. All rights reserved.

