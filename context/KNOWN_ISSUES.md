# Known Issues

### 2026-08-13 — CRITICAL: ffmpeg_kit_flutter_new ships a FULL-GPL FFmpeg build
**Severity:** Critical
**Affects:** Whole product — legal/licensing, ability to ship at all
**Description:** The locked tech stack says "ffmpeg_kit_flutter_new (LGPL only,
NEVER GPL)" (.github/copilot-instructions.md), and docs/DECISIONS.md records the
2026-08-09 decision as "Chosen: ffmpeg_kit_flutter_new (LGPL) / Rejected: GPL
builds / Reason: License compatibility with closed-source distribution". That
assumption is **wrong**. The package resolves to GPL binaries on every platform:

- `pubspec.yaml` description: "FFmpeg Kit for Flutter with **Full GPL** and
  updated bindings"
- iOS `ffmpeg_kit_flutter_new.podspec`: `s.default_subspec = 'full-gpl-lts'`
  → depends on `ffmpeg-kit-ios-full-gpl`
- Android `scripts/setup_android.sh`: hardcoded download of
  `ffmpeg-kit-full-gpl-6.0.LTS.aar` (no variant override hook in build.gradle)
- macOS `scripts/setup_macos.sh`: `ffmpeg-kit-macos-full-gpl-6.0.zip`
- Package README: 4 GPL libraries included — `vid.stab`, `x264`, `x265`,
  `xvidcore`

The LGPL-3.0 LICENSE file at the package root covers the Dart wrapper only, not
the linked binaries — which is what makes this easy to miss.

Compounding it: our own `FfmpegCommandBuilder` encodes with **`libx264`**, one of
those GPL libraries, for MP4/MOV/MKV — i.e. the core conversion path is the GPL
path. Distributing this inside a closed-source, paid ("Proprietary. All rights
reserved.", $4.99 unlock) app would require releasing the app's source under
GPL, or it is a license violation. GPL-licensed binaries are also a known
conflict with the App Store's terms.

**Workaround:** None. This is not fixable by a code tweak — it needs a package/
variant decision from the user. Options sketched in docs/DECISIONS.md
(2026-08-13 entry).
**Fix planned:** BLOCKED on user decision. Must be resolved before any store
submission. Flagged 2026-08-13; not fixed autonomously because every option
trades away either a core feature (H.264/MP4 encoding) or the proprietary
licensing model, which is a product/legal call, not an engineering one.

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
