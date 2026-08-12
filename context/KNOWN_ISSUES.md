# Known Issues

### 2026-08-13 — ffmpeg_kit_flutter_new shipped a FULL-GPL FFmpeg build (RESOLVED)
**Severity:** Critical
**Affects:** Whole product — legal/licensing, ability to ship at all
**Description:** The locked tech stack says "ffmpeg_kit_flutter_new (LGPL only,
NEVER GPL)" (.github/copilot-instructions.md), but the package actually resolved
to full-GPL FFmpeg binaries on every platform (podspec defaulted to
`full-gpl-lts`, Android hardcoded a `full-gpl` .aar download, package README
listed `x264`/`x265`/`xvidcore`/`vid.stab` as included). Our own encoder choice,
`libx264`, was itself one of those GPL libraries. Distributing this inside a
closed-source, paid app would have been a license violation.

**Fix (2026-08-13):** Switched to `ffmpeg_kit_flutter_new_full` (a distinct,
genuinely-LGPL sibling package — "contains no GPL-licensed components"), per
user decision (option 1 in docs/DECISIONS.md). This also incidentally fixed a
second, unrelated problem discovered during the switch: the old package's
Android `.aar` download URL was a 404 (dead GitHub release) — Android builds
were broken today independent of licensing.

Consequence: MP4/MOV/MKV now use hardware H.264 encoding (`h264_mediacodec` /
`h264_videotoolbox`) instead of software `libx264`, since this LGPL build
doesn't include it. See the entry below for what's unverified about that.

**Fix planned:** done, pending device verification (see below).

### 2026-08-13 — Unverified: hardware H.264 encoding has no software fallback
**Severity:** Critical (if it fails), currently unverified
**Affects:** All MP4/MOV/MKV output (the app's primary conversion path)
**Description:** After switching to the LGPL FFmpeg build (see entry above),
MP4/MOV/MKV encoding uses `h264_mediacodec` (Android) or `h264_videotoolbox`
(iOS/macOS) instead of software `libx264` — because libx264 isn't present in
this build at all. This should work: MediaCodec/VideoToolbox are OS-level APIs
FFmpeg wraps, not external libraries, so they're normally available regardless
of which optional codec libraries a build includes. But the specific claim —
that *this* package's *this* Android `.aar` was actually compiled with
MediaCodec hardware-encode support turned on — is unconfirmed. The package's
own docs only vaguely say "MediaCodec system library is supported," without
naming the encoder or confirming it's enabled.

If it isn't enabled, MP4/MOV/MKV conversion fails outright on Android with no
fallback path, since there's no software encoder left in this build to fall
back to. The PRD itself flags Android device fragmentation as a risk (Risk 4),
so even if MediaCodec works on some devices, it may not work uniformly across
the low-end/older devices this app is likely to see in practice.
**Workaround:** None available without device testing.
**Fix planned:** This is the **first thing to test** once Android SDK/device
access exists — before trusting any other unverified behavior in this app.
If MediaCodec hardware encoding turns out not to work, the fallback options are
the same three from the original GPL decision (docs/DECISIONS.md 2026-08-13):
re-accept GPL, or drop MP4/MOV/MKV output in favor of WebM-only.

### 2026-08-12 — No Android SDK / no macOS on dev machine
**Severity:** Major
**Affects:** Sprint 1 Definition of Done (platform build verification)
**Description:** `flutter analyze` passes clean, but neither `flutter build apk --debug`
nor `flutter build ios --debug --no-codesign` can be run from this machine. Android SDK
is not installed; there is no macOS/Xcode for the iOS build. `flutter doctor` also flags
missing Chrome and Visual Studio, but those aren't required for this project (Android/iOS
targets only).
**Workaround:** Deferred by user decision — Android SDK install postponed to a later
session. iOS build will likely need a Mac or a macOS CI runner (Codemagic/GitHub Actions).
**Fix planned:** yes, before formally closing Sprint 1. As of Sprint 3, this also
blocks verifying: compression/destination preset output (resolution, bitrate, file
size actually hit their targets), Cancel actually stopping FFmpeg mid-encode, and
the Email preset's target-size bitrate math. As of Sprint 4, also blocks verifying
GIF output validity, WAV playability, and audio codec correctness.

### 2026-08-12 — GIF trim start/end fields are unbounded
**Severity:** Minor
**Affects:** Conversion Setup screen, GIF kind
**Description:** The Start/End (seconds) fields for GIF trimming are free-form
number inputs with no upper bound, because the video's actual duration isn't known
client-side until FFprobe runs inside FfmpegDataSource at conversion time (not
eagerly when the video is picked). A user entering an end time past the video's
real length will pass an out-of-range `-t` to FFmpeg; untested what FFmpeg does
in that case (likely just clips to actual end, but unverified).
**Workaround:** None yet — acceptable for now since real-device testing is blocked
anyway (see the Android SDK issue above).
**Fix planned:** yes — probably by probing duration eagerly on video pick and
passing it down to the Setup screen, once device testing is possible.

### 2026-08-12 — android/ and ios/ platform folders missing from the repo (RESOLVED)
**Severity:** Major
**Affects:** Any real build/run, Sprint 2's FFmpeg engine verification
**Description:** `.gitignore` excludes `/android/`, `/ios/`, `/web/`, etc. as
"platform generated" (standard Flutter template gitignore). These folders existed
locally in a previous session but were never committed, so the Windows reset that
wiped the Flutter SDK also wiped them with no git history to recover from.
**Workaround/Fix:** Ran `flutter create .` at the repo root (2026-08-12) to regenerate
all platform folders. Had to delete the default `test/widget_test.dart` it dropped in
(referenced a nonexistent `MyApp` class). `flutter analyze`/`flutter test` re-verified
clean afterward. Note this remains a recurrence risk — if the machine resets again,
these folders vanish again since they're gitignored by design.
**Fix planned:** done — but the Android SDK gap below still blocks an actual build/run.

## Format
### YYYY-MM-DD — Short Title
**Severity:** Critical / Major / Minor
**Affects:** feature/area
**Description:** what happens
**Workaround:** how to work around
**Fix planned:** yes/no + sprint
