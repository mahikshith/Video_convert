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
**Fix planned:** yes, before formally closing Sprint 1. As of Sprint 3, this also
blocks verifying: compression/destination preset output (resolution, bitrate, file
size actually hit their targets), Cancel actually stopping FFmpeg mid-encode, and
the Email preset's target-size bitrate math.

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
