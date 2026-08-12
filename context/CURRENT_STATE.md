# Current State

**Sprint:** 08 — Store Prep (partial). Plus an out-of-sprint code review + licensing fix pass, 2026-08-13.
**Branch:** work
**Last Commit:** 7548216 (LGPL FFmpeg switch) — everything through today is committed and pushed

## Completed
### Sprints 1-5, 7
- Flutter scaffold, FFmpeg conversion engine (video/GIF/audio), compression
  and destination presets, Conversion Setup → Progress → Results flow,
  conversion history (Hive) and settings (shared_preferences), splash +
  onboarding flow. See tasks/SPRINT_0[1,2,3,4,5,7]*.md for detail.

### Sprint 6 — SKIPPED (user decision, 2026-08-13)
- Needs a real RevenueCat account, API keys, and configured App Store/Play
  Store products before meaningful implementation.

### Sprint 8 (partial)
- `docs/PRIVACY_POLICY.md`, `docs/TERMS_OF_SERVICE.md`, `docs/STORE_LISTING.md`
  drafted. App icon, screenshots, legal review, business details still needed.

### Code review + critical licensing fix (2026-08-13, out of sprint)
- Full code review found and fixed 13 correctness bugs (cancel-during-probe,
  stream-after-close crashes, GIF progress stalling the UI forever, missed
  completions, unhandled save errors, Windows path bug, etc.) — commit
  `34a130a`.
- Latency/quality pass: hardware-appropriate encoder settings, MP4/MOV
  faststart, GIF palette generation instead of the default 256-colour
  fallback — commit `ccfc65b`.
- **Critical finding: `ffmpeg_kit_flutter_new` was shipping full-GPL FFmpeg**,
  contradicting the locked stack's "LGPL only" rule — a real license-violation
  risk for a closed-source paid app. Also found its Android artifact download
  was independently broken (404 on a dead GitHub release) regardless of
  licensing.
- **Fixed**, per user decision to implement "option 1": switched to
  `ffmpeg_kit_flutter_new_full` (genuinely LGPL, "no GPL-licensed
  components") — commit `7548216`. MP4/MOV/MKV now encode via hardware
  H.264 (`h264_mediacodec` / `h264_videotoolbox`) instead of software
  libx264, since libx264 isn't in this build. `CompressionPreset.original`
  was given an explicit bitrate (hardware encoders don't support libx264's
  CRF mode). WebM/GIF/audio extraction are unaffected.
- Full detail and the decision trail: docs/DECISIONS.md (2026-08-13 entries),
  context/KNOWN_ISSUES.md.
- `flutter analyze`: zero issues. `flutter test`: 43/43 passing.
- **Discussed but deliberately NOT built: an automatic fallback for when
  hardware encoding doesn't work.** User asked about this; recommendation
  given and accepted was *not* to build one preemptively. Full reasoning in
  the "Decision: no speculative fallback" note below — don't re-litigate
  this without re-reading that reasoning first.

## In Progress
- Nothing — this session's work is fully committed and pushed. Next actual
  work requires either device access or user-supplied external inputs (see
  Blockers).

## Not Started
- Sprint 6 (Paywall/RevenueCat) — blocked on user providing credentials
- Sprint 8 remainder — app icon, screenshots, legal review, business details
- Any fallback for hardware-encoding failure — intentionally deferred, see above

## Blockers
- No Android SDK installed on this machine, no macOS/Xcode — deferred by
  user decision on 2026-08-12.
- **Highest-priority thing to verify once device access exists: does
  MediaCodec hardware H.264 encoding actually work in this build?** There is
  no software fallback anymore — if it doesn't work, MP4/MOV/MKV output fails
  outright on Android. See context/KNOWN_ISSUES.md, "Unverified: hardware
  H.264 encoding has no software fallback."
- Everything else built so far is also implemented and unit-tested at the
  Dart level only — never run on a real device.
- Sprint 6 needs RevenueCat account + API keys + store product configuration.
- Sprint 8 remainder needs real business details, a legal review, an app icon
  design, and device access for screenshots.

## Decision: no speculative fallback for hardware-encoding failure
Asked 2026-08-13: "if hardware encoding might not work, could we add a
fallback?" Recommendation given: **no, not preemptively**, for two reasons:
1. The only fallback that would keep MP4 working is bringing back software
   libx264 — which is the GPL library we just removed. That's not a
   fallback, it's reverting the fix.
2. Falling back to WebM instead is technically possible (already
   implemented, LGPL-clean) but weak in practice: the whole point of MP4
   output is compatibility with WhatsApp/Instagram/TikTok, which barely
   support WebM. Silently handing the user a WebM file doesn't actually
   solve their problem.
Conclusion: don't build fallback infrastructure for a failure that hasn't
been confirmed to exist. Test hardware encoding on a real device first (see
Blockers above). If it turns out to genuinely fail on some devices, the
honest next step is a **clear error message** telling the user MP4 isn't
supported on their device — not a silent format swap. A real fallback
design (if ever needed) should wait until we know the actual failure shape
(all devices? just old/low-end ones? specific manufacturers?).

## Notes
- Standard env setup:
  ```
  $env:Path = "C:\flutter\bin;" + $env:Path
  ```
- User has waived the per-sprint plan-approval gate for the remainder of
  this engagement, but genuine external blockers (RevenueCat credentials,
  legal review, device access, and product-affecting licensing/dependency
  risk) are still surfaced rather than guessed around.
- FFmpeg package is now `ffmpeg_kit_flutter_new_full` (^2.5.0), not
  `ffmpeg_kit_flutter_new`. Import paths changed accordingly in
  lib/features/video_conversion/data/datasources/ffmpeg_datasource.dart.
- Git remote uses token auth: origin is configured with PAT.
