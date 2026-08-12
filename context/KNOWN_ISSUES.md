# Known Issues

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
**Fix planned:** yes, before formally closing Sprint 1

### 2026-08-12 — android/ and ios/ platform folders missing from the repo
**Severity:** Major
**Affects:** Any real build/run, Sprint 2's FFmpeg engine verification
**Description:** `.gitignore` excludes `/android/`, `/ios/`, `/web/`, etc. as
"platform generated" (standard Flutter template gitignore). These folders existed
locally in a previous session but were never committed, so the Windows reset that
wiped the Flutter SDK also wiped them with no git history to recover from. As a
result, Sprint 2's FFmpeg conversion pipeline (native FFmpegKit calls, statistics
parsing, FFprobeKit duration lookup) has only been verified at the Dart/unit-test
level — never actually run.
**Workaround:** Run `flutter create .` at the repo root to regenerate them before
attempting any build/run.
**Fix planned:** yes — next session, alongside the Android SDK install

## Format
### YYYY-MM-DD — Short Title
**Severity:** Critical / Major / Minor
**Affects:** feature/area
**Description:** what happens
**Workaround:** how to work around
**Fix planned:** yes/no + sprint
