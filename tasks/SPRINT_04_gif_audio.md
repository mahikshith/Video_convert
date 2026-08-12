# Sprint 04 — GIF & Audio

**Goal (PRD Features 5–6):** Audio extraction (MP3/AAC/WAV) and GIF
generation (start/end trim, FPS) as additional output kinds in the
existing Conversion Setup → Progress → Results flow, rather than as
separate screens — PRD's Screen List doesn't call for dedicated GIF/Audio
screens, so this reuses Sprint 3's flow.

## Tasks

1. `OutputFormat` gained an `OutputKind` (video/gif/audio) and three new
   members: `gif`, `mp3`, `aac`, `wav`
2. `gif_creation` feature: `GifOptions` entity (start, end, fps)
3. `FfmpegCommandBuilder`:
   - `buildAudioExtractCommand` — `-vn` + codec per format (libmp3lame/
     aac/pcm_s16le for wav, which is lossless so gets no bitrate flag)
   - `buildGifCommand` — `fps`+`scale`+`lanczos` video filter, `-loop 0`,
     optional `-ss`/`-t` trim (omitted entirely when start is zero, to
     avoid a no-op flag)
4. `FfmpegDataSource.convert` now branches on `outputFormat.kind` to pick
   the right command builder, and computes progress percentage against
   the *trimmed* clip duration for GIFs (not the full video duration)
5. `ConversionRequest` carries an optional `GifOptions` alongside the
   existing `preset`
6. `ConversionSetupPage` gained a Video/GIF/Audio `SegmentedButton`:
   - Video: output format chips (MP4/MOV/MKV/WEBM) + Sprint 3's
     compression/destination preset chips
   - GIF: start/end (seconds, free-form number fields — no video
     duration is known until FFprobe runs at conversion time, so this
     can't be bounded client-side yet) + FPS chips
   - Audio: format chips (MP3/AAC/WAV)
7. Tests: `buildAudioExtractCommand` (codec selection, non-audio format
   rejection), `buildGifCommand` (fps filter, conditional `-ss`/`-t`)

## Definition of Done

- `flutter analyze` — zero issues ✅ (verified 2026-08-12)
- `flutter test` — all passing ✅ (20/20, verified 2026-08-12)
- Manual smoke test on a real device/emulator — **still not verified**,
  same reason as Sprints 2–3: no Android SDK, no macOS on this machine.
  Notably unverified: whether the GIF filter chain actually produces a
  valid looping GIF, whether WAV output is actually playable, whether the
  free-form start/end seconds fields produce sensible clips when a user
  enters an end time past the video's actual length.
- context/ files updated
- Commit made

## Notes for next session
- GIF start/end are unbounded free-form inputs right now — worth adding
  client-side validation against the probed duration once there's a way
  to preview/verify video duration in the Setup screen (currently FFprobe
  only runs inside FfmpegDataSource at conversion time, not eagerly when
  the video is picked).
- Once a device/emulator is available, smoke test all three kinds:
  GIF (does it loop, is FPS respected), Audio (do MP3/AAC/WAV all play,
  is WAV actually lossless/uncompressed size), and confirm Cancel still
  works for the new command types.
