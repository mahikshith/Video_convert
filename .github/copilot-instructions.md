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
