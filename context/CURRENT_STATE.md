# Current State

**Sprint:** 08 — Store Prep (partial — drafted what's possible without device access or user-supplied business details)
**Branch:** work
**Last Commit:** 51e632c (Sprint 7 onboarding) — Sprint 8 work not yet committed

## Completed
### Sprints 1-5, 7
- Flutter scaffold, FFmpeg conversion engine (video/GIF/audio), compression
  and destination presets, Conversion Setup → Progress → Results flow,
  conversion history (Hive) and settings (shared_preferences), splash +
  onboarding flow. See tasks/SPRINT_0[1,2,3,4,5,7]*.md for detail.

### Sprint 6 — SKIPPED (user decision, 2026-08-13)
- Needs a real RevenueCat account, API keys, and configured App Store/Play
  Store products before meaningful implementation. Not scaffolded with
  placeholder config.

### Sprint 8 (partial)
- `docs/PRIVACY_POLICY.md`, `docs/TERMS_OF_SERVICE.md` — drafts with
  bracketed placeholders for business details ([YOUR NAME], [DATE],
  contact email, jurisdiction), not ready to publish as-is.
- `docs/STORE_LISTING.md` — app name/subtitle ideas, description draft,
  ASO keyword list (reasoned first pass, not validated against real
  search data).
- Explicitly NOT done: app icon (needs design work), screenshots (needs
  device access), legal review of the drafts, business details.

## In Progress
- Sprint 8 commit — pending

## Not Started
- Sprint 6 (Paywall/RevenueCat) — blocked on user providing credentials
- Sprint 8 remainder — app icon, screenshots, legal review, business
  details — all blocked on the user or on device access

## Blockers
- No Android SDK installed on this machine — deferred by user decision on
  2026-08-12.
- No macOS/Xcode available for iOS build/run.
- Everything built so far is implemented and unit-tested at the Dart level
  only — never run on a real device.
- Sprint 6 needs RevenueCat account + API keys + App Store/Play Store
  product configuration from the user.
- Sprint 8 remainder needs: real business details for legal docs, a human
  legal review, an app icon design, and device access for screenshots.

## Notes
- Standard env setup:
  ```
  $env:Path = "C:\flutter\bin;" + $env:Path
  ```
- User has waived the per-sprint plan-approval gate for the remainder of
  this engagement, but genuine external blockers (RevenueCat credentials,
  legal review, device access) are still surfaced rather than guessed
  around.
- Git remote uses token auth: origin is configured with PAT.
