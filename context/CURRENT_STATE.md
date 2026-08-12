# Current State

**Sprint:** 07 — Onboarding (implemented, real-device smoke test still pending). Sprint 6 (Paywall) skipped for now — needs real RevenueCat credentials.
**Branch:** work
**Last Commit:** f8fab97 (Sprint 5 history & settings) — Sprint 7 work not yet committed

## Completed
### Sprints 1-5
- Flutter scaffold, FFmpeg conversion engine (video/GIF/audio), compression
  and destination presets, Conversion Setup → Progress → Results flow,
  conversion history (Hive) and settings (shared_preferences). See
  tasks/SPRINT_0[1-5]*.md for detail.

### Sprint 6 — SKIPPED (user decision, 2026-08-13)
- Needs a real RevenueCat account, API keys, and configured App Store/Play
  Store products. Not scaffolded with placeholders — user explicitly chose
  to skip to a later sprint rather than have this half-built with fake
  config.

### Sprint 7
- `settings` feature gained a `hasSeenOnboarding` flag
  (shared_preferences).
- New `onboarding` feature: `SplashPage` (branded icon, ~1.2s minimum
  display run in parallel with the onboarding-flag lookup) and
  `OnboardingPage` (headline, PRD positioning tagline, three guardrail-
  derived bullets, single "Get Started" button — no carousel).
- `go_router` `initialLocation` changed to `/splash`; routes to
  `/onboarding` on first launch, straight to `/` (Home) afterward.
- `flutter analyze`: zero issues. `flutter test`: 32/32 passing.

## In Progress
- Sprint 7 commit — pending
- Real device/emulator smoke test — blocked, see Blockers (now also
  covering whether splash→home cold-start timing actually stays under 2s)

## Not Started
- Sprint 6 (Paywall/RevenueCat) — blocked on user providing credentials
- Sprint 8 (Store Prep) — likely has a similar external-dependency shape
  (store accounts, icons, screenshots); check before assuming it's
  code-only

## Blockers
- No Android SDK installed on this machine — deferred by user decision on
  2026-08-12.
- No macOS/Xcode available for iOS build/run.
- Everything built so far (FFmpeg engine, presets, history, onboarding
  flow) is implemented and unit-tested at the Dart level only — never run
  on a real device. Treat as unverified until a device/emulator smoke test
  happens.
- Sprint 6 needs RevenueCat account + API keys + App Store/Play Store
  product configuration from the user before meaningful implementation.

## Notes
- Standard env setup:
  ```
  $env:Path = "C:\flutter\bin;" + $env:Path
  ```
- User has waived the per-sprint plan-approval gate for the remainder of
  this engagement — continuing to log package/architecture decisions in
  docs/DECISIONS.md but not pausing for approval before each sprint. Still
  escalating on genuine external blockers (like Sprint 6) rather than
  guessing.
- No new packages added in Sprint 7 (shared_preferences was already
  locked-stack).
- Git remote uses token auth: origin is configured with PAT.
