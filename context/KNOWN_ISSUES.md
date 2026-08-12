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

## Format
### YYYY-MM-DD — Short Title
**Severity:** Critical / Major / Minor
**Affects:** feature/area
**Description:** what happens
**Workaround:** how to work around
**Fix planned:** yes/no + sprint
