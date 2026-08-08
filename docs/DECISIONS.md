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
