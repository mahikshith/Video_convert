# Sprint 03 — Presets UI

**Goal:** Compression presets (Small/Medium/High/Original), destination
presets (WhatsApp/Instagram/TikTok/YouTube/Email), and the three screens
that carry the user through them — Conversion Setup → Progress → Results —
replacing Sprint 2's "auto-convert on select" placeholder flow.

## Tasks

1. `compression` feature domain: `CompressionPreset` enum (4 tiers),
   `DestinationPreset` enum (5 targets), unified `ConversionPreset` union,
   `EncodingSettings` value object
2. `core/services/encoding_settings_resolver.dart` — resolves a preset
   selection to concrete `EncodingSettings`; for the Email destination
   preset, computes video bitrate from target file size ÷ input duration
   (with a floor so long videos don't collapse to unusable bitrates)
3. Extended `FfmpegCommandBuilder` to take optional `EncodingSettings`
   (resolution-capping scale filter, fixed bitrate or CRF, audio bitrate)
4. Added `cancel()` end-to-end: `FfmpegDataSource` tracks the active
   `FFmpegSession` and calls `FFmpegKit.cancel()`; threaded through the
   repository and controller
5. `ConversionRequest` now carries an optional `ConversionPreset`
6. `ConversionUiState` gained a `selectingPreset(VideoFile)` case so the
   flow is: idle → selectingPreset → inProgress → completed
7. Three new screens: `ConversionSetupPage` (file info + preset chips +
   Convert), `ProgressPage` (ring, %, Cancel), `ResultsPage` (before/after
   size, % saved, Save — copies to app documents `converted/` folder, Share
   — via `share_plus`)
8. `go_router`: `/setup`, `/progress`, `/results` routes; navigation driven
   by `ref.listen` on the controller state in each page
9. `HomePage` simplified back to just the Select Video entry point
10. Tests: `EncodingSettingsResolver` (preset → settings mapping, Email
    bitrate math including the floor case), extended
    `FfmpegCommandBuilder` tests (scale filter, fixed bitrate vs CRF),
    updated the Sprint 2 repository test for the new `preset` param

## New package
- `share_plus` (^10.1.4) — Results screen Share button. Logged in
  docs/DECISIONS.md. API used: `Share.shareXFiles(...)` (the stable
  static API in this version — verified against the installed package
  source directly rather than assumed).

## Definition of Done

- `flutter analyze` — zero issues ✅ (verified 2026-08-12)
- `flutter test` — all passing ✅ (13/13, verified 2026-08-12)
- Manual smoke test on a real device/emulator — **still not verified**,
  same reason as Sprint 2: no Android SDK, no macOS on this machine. The
  preset → FFmpeg args mapping is unit-tested; the actual encode (does a
  1280×720 scale filter really produce a 1280×720 output, does the Email
  bitrate math actually land under 25MB) is unverified against a real
  FFmpeg binary.
- context/ files updated
- Commit made

## Notes for next session
- Once a device/emulator is available: run each compression tier and each
  destination preset against a real video, confirm resolution/size targets
  are roughly met, confirm Cancel actually stops FFmpeg mid-encode, confirm
  Save and Share both work.
- Email preset's bitrate formula is a rough first pass (total bitrate budget
  minus fixed audio bitrate, floored at 100kbps) — expect to need real-world
  tuning once testable.
