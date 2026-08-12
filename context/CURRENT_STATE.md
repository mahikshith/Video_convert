# Current State

**Sprint:** 02 — FFmpeg Engine (implemented, real-device smoke test pending)
**Branch:** work
**Last Commit:** 91c08a7 (Sprint 1 analyzer fixes) — this session's Sprint 2 work not yet committed

## Completed
### Sprint 1
- Documentation system scaffolded (Phase 1)
- Flutter SDK reinstalled at C:\flutter (v3.44.9, Dart 3.12.2) after a Windows reset wiped
  the prior install
- Feature-first folder structure, Material 3 dark theme, logger service, go_router,
  strict lint config
- `flutter analyze` passes with zero issues

### Sprint 2
- `core/error/failure.dart` — sealed `Failure` hierarchy
- `video_import` feature: `VideoFile` entity, repository + `file_picker`-backed
  datasource
- `video_conversion` feature: `OutputFormat`, `ConversionRequest`,
  `ConversionProgress`, `ConversionResult` entities; `FfmpegCommandBuilder`
  (pure, testable); `FfmpegDataSource` (FFmpegKit execution + FFprobeKit duration +
  statistics-callback progress); repository; `VideoConversionController`
  (`@riverpod` notifier, `ConversionUiState` union: idle/inProgress/completed)
- `HomePage` wired end-to-end: Select Video → pick file → convert → show
  progress → show before/after size
- Unit tests: command builder + both repositories (mocktail) — 6/6 passing
- `flutter analyze`: zero issues. `flutter test`: all passing.

## In Progress
- Sprint 2 commit — pending
- Real device/emulator smoke test of the FFmpeg conversion path — blocked,
  see Blockers

## Not Started
- Sprint 3+ (compression presets, destination presets, full preset UI, GIF,
  audio extraction, history, paywall, onboarding, store prep)

## Blockers
- No Android SDK installed on this machine — deferred by user decision on
  2026-08-12.
- No macOS/Xcode available for iOS build/run.
- `android/` and `ios/` platform folders don't currently exist in the repo at
  all (git-ignored as "platform generated"; wiped by the Windows reset, never
  tracked by git). Need `flutter create .` before any real build/run.
- Because of the above, the FFmpeg execution path (native binary invocation,
  statistics-callback progress parsing, FFprobeKit duration lookup) is
  implemented and unit-tested at the Dart level only — never run against a
  real video file or a real FFmpeg binary yet. Treat as unverified until a
  device/emulator smoke test happens.

## Notes
- Standard env setup:
  ```
  $env:Path = "C:\flutter\bin;" + $env:Path
  ```
  No mirror env vars needed — direct pub.dev/storage.googleapis.com access
  confirmed working.
- New packages added this session (see docs/DECISIONS.md for full reasoning):
  `file_picker` (video import), `path_provider` (output file location,
  promoted from transitive to direct dependency), `mocktail` (test doubles).
  `freezed_annotation`/`json_annotation` moved from dev_dependencies to
  dependencies (they're referenced by runtime code, not just codegen).
- Git remote uses token auth: origin is configured with PAT.
