# Next Steps

Everything below assumes you're picking this up fresh (this session may have
ended). Read context/CURRENT_STATE.md first for the full picture — this file
is just the action list.

## 1. First real-device task: verify hardware H.264 encoding works
This is the top priority, before anything else gets built. Context: on
2026-08-13 the app switched from a GPL FFmpeg build to an LGPL one
(`ffmpeg_kit_flutter_new_full`) to fix a real license-violation risk. That
build has no software H.264 encoder — MP4/MOV/MKV output now depends
entirely on the phone's hardware encoder (`h264_mediacodec` on Android,
`h264_videotoolbox` on iOS). This has never been tested on a real device.

Steps:
1. Install Android SDK (deferred earlier by user choice — do this first)
2. `flutter run` on a real device or emulator
3. Pick a video, convert it to MP4 with any compression preset
4. **Does it actually produce a valid, playable MP4?** This is the
   make-or-break test.

If it works: great, move to step 2 below.
If it fails: **do not silently add a fallback.** Re-read the "Decision: no
speculative fallback" section in context/CURRENT_STATE.md first — there's
reasoning there about why a fallback isn't the right first move, and what
the honest options are (clear error message vs. one of the three original
licensing tradeoffs in docs/DECISIONS.md).

## 2. Once hardware encoding is confirmed working, smoke-test everything else
- Every compression preset (Small/Medium/High/Original) and destination
  preset (WhatsApp/Instagram Reel/TikTok/YouTube/Email)
- GIF: does it loop, is FPS respected, does the palette actually look good
- Audio extraction: MP3/AAC/WAV all play correctly
- Cancel mid-conversion actually stops FFmpeg
- Save (copies to app documents) and Share (native share sheet) both work
- Hive history persists across an app restart
- Splash → onboarding → home timing feels like ~2 seconds, not longer

## 3. Sprint 6 — Paywall (blocked on you)
Needs a real RevenueCat account, API keys, and configured App Store/Play
Store products before it can be meaningfully implemented — not just
scaffolded with placeholder credentials. Tell Claude when you have these and
it can pick the sprint back up.

## 4. Sprint 8 remainder — Store Prep (blocked on you)
- App icon — needs real design work
- Store screenshots — needs the app actually running on a device (blocked
  by item 1 above)
- Legal review of docs/PRIVACY_POLICY.md and docs/TERMS_OF_SERVICE.md —
  needs a qualified human, not just Claude
- Business details to fill the bracketed placeholders in those two docs
  (company/developer name, contact email, jurisdiction)

## Where things are, if you want to jump straight to code
- FFmpeg command building: `lib/core/services/ffmpeg_command_builder.dart`
- FFmpeg execution + hardware encoder resolution:
  `lib/features/video_conversion/data/datasources/ffmpeg_datasource.dart`
- Full decision history: `docs/DECISIONS.md` (append-only, read bottom-up
  for the most recent reasoning)
- Everything currently open/unverified: `context/KNOWN_ISSUES.md`
