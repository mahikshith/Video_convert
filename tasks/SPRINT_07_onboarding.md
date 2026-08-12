# Sprint 07 — Onboarding

**Goal (PRD Screen List — Splash, 2s max; positioning tagline):** a real
splash screen plus a single first-launch value-prop screen, kept as
minimal as the guardrails demand (no fancy animations, no gamification,
zero distractions). Sprint 6 (Paywall) was skipped for now — it needs
real RevenueCat credentials only the user can provide.

## Tasks

1. `settings` feature extended with a `hasSeenOnboarding` flag
   (shared_preferences, same pattern as the default-preset setting)
2. `onboarding` feature: `SplashPage` (branded icon, ~1.2s minimum
   display time run in parallel with the onboarding-flag lookup, so cold
   start stays comfortably under the PRD's 2-second cap) and
   `OnboardingPage` (headline + PRD's positioning tagline + three bullets
   pulled straight from the guardrails: no uploads, no accounts, no
   watermarks/subscription traps — single "Get Started" button, no
   carousel/swiping)
3. `go_router`: `initialLocation` changed from `/` to `/splash`;
   `SplashPage` routes to `/onboarding` on first launch or straight to
   `/` (Home) on every launch after
4. Tests: onboarding flag get/set on `SettingsRepositoryImpl`

## Definition of Done

- `flutter analyze` — zero issues ✅ (verified 2026-08-13)
- `flutter test` — all passing ✅ (32/32, verified 2026-08-13)
- Manual smoke test on a real device/emulator — **still not verified**,
  same reason as every sprint so far: no Android SDK, no macOS on this
  machine. Notably unverified: does the splash-to-onboarding-to-home
  transition actually feel like ~2 seconds on a real device, or does cold
  start (Flutter engine init, plugin registration) push it past that.
- context/ files updated
- Commit made

## Notes for next session
- Sprint 6 (Paywall/RevenueCat) is still pending — needs the user to
  provide RevenueCat account + API keys + configured App Store/Play
  Store products before it can be meaningfully implemented, not just
  scaffolded with placeholders.
- Sprint 8 (Store Prep) likely has the same external-dependency shape
  (store accounts, icons, screenshots) — check before assuming it's fully
  code-only.
