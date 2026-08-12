# Current State

**Sprint:** 05 — History & Settings (implemented, real-device smoke test still pending)
**Branch:** work
**Last Commit:** 2a50ee3 (Sprint 4 GIF & audio) — Sprint 5 work not yet committed

## Completed
### Sprints 1-4
- Flutter scaffold, FFmpeg conversion engine (video/GIF/audio), compression
  and destination presets, Conversion Setup → Progress → Results flow with
  Cancel/Save/Share. See prior sprint files under tasks/ for detail.
- Platform folders regenerated after a Windows reset wiped the previous
  Flutter install (see Sprint 2 notes / KNOWN_ISSUES.md).

### Sprint 5
- `Hive.initFlutter()` wired into `main.dart` (Hive was a dependency since
  Sprint 1 but never actually initialized).
- `history` feature: `ConversionHistoryEntry` (freezed + json_serializable),
  Hive-backed repository (stores entries as plain Maps — no
  hive_generator/TypeAdapter needed), `HistoryController`.
- Conversions now auto-save to history on completion (failure to save
  doesn't fail the conversion itself).
- `HistoryPage`: list, per-item share/delete, clear-all with confirmation.
- `settings` feature: `SettingsRepository` over `shared_preferences`
  (already a locked-stack dependency), encodes the default `ConversionPreset`
  as a string key. `SettingsPage`: default-preset picker, clear history.
- `go_router`: `/history`, `/settings` (pushed, not replaced, so back
  returns to Home). `ConversionSetupPage` now pre-fills from the default
  preset setting until the user manually changes it.
- `flutter analyze`: zero issues. `flutter test`: 30/30 passing.

## In Progress
- Sprint 5 commit — pending
- Real device/emulator smoke test — blocked, see Blockers (now also
  covering Hive persistence across restarts and history file availability)

## Not Started
- Sprint 6+ (paywall/RevenueCat, onboarding, store prep)

## Blockers
- No Android SDK installed on this machine — deferred by user decision on
  2026-08-12.
- No macOS/Xcode available for iOS build/run.
- Everything FFmpeg-related (all conversion kinds, presets, cancel) plus
  now Hive persistence is implemented and unit-tested at the Dart level
  only — never run against a real device. Treat as unverified until a
  device/emulator smoke test happens.
- Upcoming Sprint 6 (Paywall/RevenueCat) and Sprint 7 (onboarding, if it
  touches Firebase Analytics) will need real RevenueCat/Firebase project
  credentials that only the user can provide — flagging now so it's not a
  surprise blocker later.

## Notes
- Standard env setup:
  ```
  $env:Path = "C:\flutter\bin;" + $env:Path
  ```
- User has waived the per-sprint plan-approval gate for the remainder of
  this engagement — continuing to log package/architecture decisions in
  docs/DECISIONS.md but not pausing for approval before each sprint.
- No new packages added in Sprint 5 (Hive and shared_preferences were
  already locked-stack, just not yet wired up).
- Git remote uses token auth: origin is configured with PAT.
