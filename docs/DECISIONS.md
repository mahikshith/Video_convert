# Decisions Log (append-only)

## 2026-08-09 — Freemium model
Chosen: One-time $4.99 unlock + free tier (5 conversions/day) + optional $9.99/year
Rejected: Monthly subscription only
Reason: Utility category has strong subscription resistance

## 2026-08-09 — FFmpeg build
Chosen: ffmpeg_kit_flutter_new (LGPL)
Rejected: GPL builds
Reason: License compatibility with closed-source distribution

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
