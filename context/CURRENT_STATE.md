# Current State

**Sprint:** 03 — Presets UI (implemented, real-device smoke test still pending)
**Branch:** work
**Last Commit:** ca9c4fb (platform folder regen) — Sprint 3 work not yet committed

## Completed
### Sprint 1
- Flutter SDK reinstalled at C:\flutter (v3.44.9, Dart 3.12.2) after a Windows reset
- Feature-first folder structure, Material 3 dark theme, logger service, go_router,
  strict lint config, `flutter analyze` zero issues

### Sprint 2
- FFmpeg conversion engine: video_import (file_picker), video_conversion
  (FfmpegCommandBuilder, FfmpegDataSource with FFmpegKit + FFprobeKit + statistics
  progress), sealed `Failure` hierarchy, Riverpod controller, HomePage wired
  end-to-end. `flutter analyze`/`flutter test` clean.
- `android/`, `ios/`, `web/`, `linux/`, `macos/`, `windows/` regenerated via
  `flutter create .` (were missing entirely after the Windows reset — gitignored,
  never tracked by git)

### Sprint 3
- `compression` feature: `CompressionPreset` (4 tiers), `DestinationPreset`
  (5 targets), unified `ConversionPreset` union, `EncodingSettings`
- `EncodingSettingsResolver` — preset → concrete FFmpeg settings, including
  target-file-size bitrate math for the Email preset
- `FfmpegCommandBuilder` extended: resolution-capping scale filter, fixed
  bitrate or CRF, audio bitrate
- Cancel wired end-to-end (FfmpegDataSource tracks the active FFmpegSession)
- Three new screens: Conversion Setup (preset picker), Progress (ring +
  cancel), Results (before/after size, Save to app documents, Share via
  `share_plus`)
- `go_router`: `/setup`, `/progress`, `/results`; HomePage simplified back
  to just the entry point
- `flutter analyze`: zero issues. `flutter test`: 13/13 passing.

## In Progress
- Sprint 3 commit — pending
- Real device/emulator smoke test — blocked, see Blockers (same as Sprint 2,
  now also covering preset resolution/bitrate math and Cancel)

## Not Started
- Sprint 4+ (GIF, audio extraction, history, settings, paywall, onboarding,
  store prep)

## Blockers
- No Android SDK installed on this machine — deferred by user decision on
  2026-08-12.
- No macOS/Xcode available for iOS build/run.
- FFmpeg execution path (native binary invocation, statistics parsing,
  scale-filter/bitrate/CRF behavior, cancel, Email preset's bitrate math) is
  implemented and unit-tested at the Dart level only — never run against a
  real video file. Treat as unverified until a device/emulator smoke test
  happens.

## Notes
- Standard env setup:
  ```
  $env:Path = "C:\flutter\bin;" + $env:Path
  ```
- User has waived the per-sprint plan-approval gate for the remainder of
  this engagement ("keep working, don't need my permission between
  sprints") — continuing to log package/architecture decisions in
  docs/DECISIONS.md but not pausing for approval before each sprint.
- New package this sprint: `share_plus` (^10.1.4) for the Results screen's
  Share button — logged in docs/DECISIONS.md. Its actual API was verified
  by reading the installed package source directly (the first guess,
  `SharePlus.instance.share(ShareParams(...))`, was wrong for this version;
  correct is the static `Share.shareXFiles(...)`).
- Git remote uses token auth: origin is configured with PAT.
