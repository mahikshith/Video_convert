# Sprint 02 — FFmpeg Engine

**Goal:** Stand up the core conversion pipeline (Import → FFmpeg command
builder → FFmpegKit execution → Progress parser → Output file) as testable
engine code, with minimal UI wiring to prove it end-to-end. Compression
presets, destination presets, and full preset UI are Sprint 3.

## Tasks

1. Add `ffmpeg_kit_flutter_new` (locked stack) and `file_picker` (new — see
   docs/DECISIONS.md) for video import from Files/Gallery
2. Add `core/error/failure.dart` — sealed `Failure` hierarchy
3. `video_import` feature: `VideoFile` entity, `VideoImportRepository`
   interface + impl, `VideoPickerDataSource` wrapping `file_picker`
4. `video_conversion` feature: `OutputFormat`, `ConversionRequest`,
   `ConversionProgress`, `ConversionResult` entities
5. `core/services/ffmpeg_command_builder.dart` — pure function building
   FFmpeg argument lists (basic H.264/AAC transcode, no compression tuning
   yet)
6. `FfmpegDataSource` — FFmpegKit execution + FFprobeKit duration lookup +
   statistics-callback progress parsing
7. `VideoConversionRepository` interface + impl
8. `VideoConversionController` (`@riverpod` notifier) exposing a
   `ConversionUiState` union (idle / inProgress / completed)
9. Wire `HomePage`'s "Select Video" button to pick a file and run one
   conversion end-to-end, showing progress and before/after size
10. Unit tests: `FfmpegCommandBuilder` (pure), both repositories (mocktail)
11. Verify `flutter analyze` (zero issues) and `flutter test` (all passing)

## Definition of Done

- `flutter analyze` — zero issues ✅ (verified 2026-08-12)
- `flutter test` — all passing ✅ (6/6, verified 2026-08-12)
- Manual smoke test on a real device/emulator — **not verified**. No
  Android SDK and no macOS are available on the current dev machine (see
  context/KNOWN_ISSUES.md). The FFmpeg execution path (native binary
  invocation, statistics parsing) is therefore unverified against a real
  video file; only the Dart-level wiring around it is tested.
- context/ files updated
- Commit made (not yet pushed)

## Notes for next session
- `android/` and `ios/` platform folders don't exist yet on this machine
  (git-ignored, wiped by a Windows reset). Run `flutter create .` before
  attempting any real build/run.
- Once a device/emulator is available, do a real smoke test: pick a short
  video, confirm it converts, confirm the progress bar moves, confirm
  output file size is reported.
