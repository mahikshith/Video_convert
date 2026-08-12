# Current State

**Sprint:** 04 — GIF & Audio (implemented, real-device smoke test still pending)
**Branch:** work
**Last Commit:** f4f43cc (Sprint 3 presets UI) — Sprint 4 work not yet committed

## Completed
### Sprint 1
- Flutter SDK reinstalled at C:\flutter (v3.44.9) after a Windows reset;
  feature-first structure, Material 3 theme, logger, go_router, strict lints.

### Sprint 2
- FFmpeg conversion engine: video_import, video_conversion (command builder,
  FFmpegKit + FFprobeKit datasource, statistics progress), sealed `Failure`
  hierarchy, Riverpod controller, HomePage wired end-to-end.
- Platform folders (`android/`, `ios/`, etc.) regenerated via `flutter create .`
  after the Windows reset wiped them (gitignored, never tracked by git).

### Sprint 3
- Compression presets (4 tiers) + destination presets (5 targets) via a
  unified `ConversionPreset` union and `EncodingSettingsResolver`.
- Conversion Setup → Progress → Results screen flow with go_router routes;
  Cancel wired end-to-end; Results screen Save (app documents) + Share
  (`share_plus`).

### Sprint 4
- `OutputFormat` gained an `OutputKind` (video/gif/audio) and `gif`/`mp3`/
  `aac`/`wav` members.
- `gif_creation` feature: `GifOptions` (start, end, fps).
- `FfmpegCommandBuilder`: `buildAudioExtractCommand` (codec per format,
  `-vn`), `buildGifCommand` (fps+scale+lanczos filter, `-loop 0`,
  conditional trim).
- `FfmpegDataSource.convert` branches on `outputFormat.kind`; GIF progress
  percentage is computed against the trimmed clip duration, not the full
  video.
- `ConversionSetupPage` gained a Video/GIF/Audio segmented selector with
  per-kind options (video format + presets / GIF trim + fps / audio format).
- `flutter analyze`: zero issues. `flutter test`: 20/20 passing.

## In Progress
- Sprint 4 commit — pending
- Real device/emulator smoke test — blocked, see Blockers (now also
  covering GIF output validity, WAV playability, and unbounded GIF
  start/end input)

## Not Started
- Sprint 5+ (history, settings, paywall, onboarding, store prep)

## Blockers
- No Android SDK installed on this machine — deferred by user decision on
  2026-08-12.
- No macOS/Xcode available for iOS build/run.
- FFmpeg execution path (all conversion kinds: video convert, compression/
  destination presets, GIF, audio extract, cancel) is implemented and
  unit-tested at the Dart level only — never run against a real video file.
  Treat as unverified until a device/emulator smoke test happens.
- GIF start/end fields in Conversion Setup are unbounded free-form number
  inputs (no known video duration client-side until FFprobe runs at
  conversion time) — no validation against actual video length yet.

## Notes
- Standard env setup:
  ```
  $env:Path = "C:\flutter\bin;" + $env:Path
  ```
- User has waived the per-sprint plan-approval gate for the remainder of
  this engagement — continuing to log package/architecture decisions in
  docs/DECISIONS.md but not pausing for approval before each sprint.
- Git remote uses token auth: origin is configured with PAT.
