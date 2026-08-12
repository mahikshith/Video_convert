# Decisions Log (append-only)

## 2026-08-09 — Freemium model
Chosen: One-time $4.99 unlock + free tier (5 conversions/day) + optional $9.99/year
Rejected: Monthly subscription only
Reason: Utility category has strong subscription resistance

## 2026-08-09 — FFmpeg build
Chosen: ffmpeg_kit_flutter_new (LGPL)
Rejected: GPL builds
Reason: License compatibility with closed-source distribution
**SUPERSEDED / FACTUALLY WRONG — see the 2026-08-13 entry below. The premise
that this package is LGPL does not hold.**

## 2026-08-09 — State management
Chosen: Riverpod with code generation
Rejected: Provider, Bloc, GetX
Reason: Type safety + codegen ergonomics + Flutter team endorsement

## 2026-08-09 — Branch strategy
Chosen: Single `work` branch for development
Reason: Solo developer, minimal overhead

## 2026-08-12 — Video import package
Chosen: file_picker (MIT license)
Rejected: image_picker-only (gallery/camera only, no arbitrary Files import),
  writing native platform channels by hand
Reason: PRD Feature 1 requires import from both Files and Gallery on iOS/Android.
  file_picker covers both entry points with one cross-platform API and supports
  filtering to video file types. Not in the original locked stack list, added here
  per the package-addition rule.

## 2026-08-12 — path_provider for output file location
Chosen: path_provider (was already a transitive dependency via hive_flutter/file_picker;
  now added as a direct dependency since video_conversion code imports it directly)
Reason: Need a writable device directory to place converted output files. Sprint 2
  writes to the temp directory; a persistent "converted files" location is deferred to
  Sprint 5 (history/settings).

## 2026-08-12 — share_plus for Results screen sharing
Chosen: share_plus (MIT license, Flutter-team-maintained)
Reason: PRD Feature 8 (Share Output) and the core user flow ("Save / Share" as the
  final step, target <20s video-to-share) need a native share sheet. share_plus is
  the standard cross-platform wrapper for iOS/Android share sheets. Not in the
  original locked stack; added here per the package-addition rule. User pre-approved
  package/architecture judgment calls for the remainder of this engagement
  (2026-08-12), so this is logged rather than gated on a separate approval step.

## 2026-08-12 — mocktail for testing
Chosen: mocktail (already specified in testing.instructions.md, formalizing here)
Reason: Null-safe mocking without code generation, needed to test the
  video_conversion repository against a fake FFmpeg datasource without invoking
  real FFmpeg binaries in unit tests.

## 2026-08-13 — OPEN: ffmpeg_kit_flutter_new is a full-GPL build (blocks release)
Status: **UNRESOLVED — needs a user decision.** Recorded here rather than
decided autonomously, because every option costs either a core feature or the
proprietary licensing model.

Finding: the 2026-08-09 "LGPL" premise is wrong. `ffmpeg_kit_flutter_new`
resolves to full-GPL FFmpeg binaries on all three platforms (iOS podspec
`default_subspec = 'full-gpl-lts'`; Android hardcodes
`ffmpeg-kit-full-gpl-6.0.LTS.aar`; macOS likewise), and its own pubspec
describes itself as "FFmpeg Kit for Flutter with Full GPL". The LGPL-3.0
LICENSE at the package root covers only the Dart wrapper. Our own encoder
choice, `libx264`, is itself one of the package's four GPL libraries.
Full detail in context/KNOWN_ISSUES.md.

Options, with what each actually costs:

1. **Switch to a genuinely LGPL FFmpeg build and drop libx264.** Keeps the
   app proprietary. H.264 software encoding goes away; MP4 output would have
   to come from the platform hardware encoders (`h264_videotoolbox` on iOS,
   `h264_mediacodec` on Android), which are OS-provided and not GPL. Upside:
   hardware encoding is typically *much* faster than libx264 on mobile, so
   this likely helps the PRD's <30s target rather than hurting it. Downside:
   hardware encoder availability/quality varies by device (the PRD already
   flags Android fragmentation as Risk 4), and it needs real device testing
   to trust. Requires finding (or maintaining) an LGPL-variant package — the
   upstream arthenica ffmpeg-kit project was retired in 2025, so the fork
   landscape needs checking.
2. **Keep the GPL build and open-source the app under GPL.** Contradicts
   "Proprietary. All rights reserved." and complicates the paid model; GPL
   binaries are also a well-known conflict with App Store terms.
3. **Drop to VP9/WebM-only output** (libvpx is LGPL). Legally clean and
   already implemented, but WebM is poorly supported by the exact share
   targets the PRD is built around (WhatsApp, Instagram, TikTok), so this
   guts the product's reason to exist.

Recommendation: option 1. It preserves both the licensing model and the core
feature, and plausibly improves conversion latency. It is the only option that
doesn't trade away something the PRD treats as essential.

## 2026-08-13 — RESOLVED: switched to ffmpeg_kit_flutter_new_full (LGPL)
Resolves the 2026-08-13 "OPEN" entry above, per user decision to implement option 1.

Chosen: `ffmpeg_kit_flutter_new_full` (^2.5.0, resolved 2.5.2) — a sibling package
from the same maintainer as `ffmpeg_kit_flutter_new`, but a distinct pub.dev
package covering the LGPL "full" tier (no x264/x265/xvidcore/vid.stab). Its
pubspec explicitly states "contains no GPL-licensed components." Also fixes an
unrelated but critical problem found during the switch: the old package
(`ffmpeg_kit_flutter_new` 1.6.1, via the `ffmpeg_kit_flutter_android` plugin)
downloaded its Android `.aar` from a hardcoded GitHub Releases URL that returns
404 — that release no longer exists on the maintainer's repo. Android builds
were broken today regardless of licensing. The new package is a current (13
days old at the time of this change), actively published major version line
that doesn't have this problem.

Rejected: patching/forking the old package's build scripts to point at a
different release asset — unnecessary now that a proper non-GPL package exists
upstream; forking would create an ongoing maintenance burden for no benefit.

Consequence: MP4/MOV/MKV video encoding no longer uses software libx264 (not
present in this build). It now uses the platform's hardware H.264 encoder —
`h264_mediacodec` on Android, `h264_videotoolbox` on iOS/macOS — resolved at
runtime in `FfmpegDataSource._resolveH264Encoder()`. WebM (VP9/libvpx),
GIF, and audio extraction (MP3/AAC/WAV) are unaffected — none of them used a
GPL library.

Follow-on change: hardware encoders take a target bitrate, not libx264's CRF
(quality-factor) mode, and reject the `-preset` flag outright. `CompressionPreset
.original` ("Original Quality"), previously CRF-only with no bitrate, was given
an explicit 8000kbps bitrate so it still works under hardware encoding.

**Not yet verified on a real device** — no Android SDK/macOS on this dev
machine. The specific risk: it's unconfirmed whether this LGPL build's Android
AAR was actually compiled with MediaCodec hardware-encode support enabled. If
it wasn't, MP4/MOV/MKV output has no fallback (there's no software encoder in
this build to fall back to) and would fail outright on Android. This must be
the first thing tested once device access exists. See
context/KNOWN_ISSUES.md.
