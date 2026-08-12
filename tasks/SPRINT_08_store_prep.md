# Sprint 08 — Store Prep

**Goal (PRD "Before Release" checklist):** Privacy Policy, Terms, Store
Screenshots, ASO keywords, App Icon. This sprint is a mix of drafting
content and things genuinely blocked on the user (business/legal details,
device access, design work) — not a pure engineering sprint.

## Done this session

1. `docs/PRIVACY_POLICY.md` — draft covering on-device processing (no
   video/audio upload), Firebase Analytics usage, RevenueCat/purchase data,
   local-only history/settings storage, and an ads section left as a
   placeholder pending ad network selection. Bracketed placeholders
   ([YOUR NAME], [DATE], [YOUR CONTACT EMAIL], etc.) throughout — **not
   ready to publish as-is.**
2. `docs/TERMS_OF_SERVICE.md` — draft covering license, purchases/refunds
   (routed through Apple/Google, not handled directly), content ownership,
   acceptable use, warranty disclaimer, liability limitation, governing
   law placeholder. Same caveat — needs real business details and
   ideally a legal review before publishing.
3. `docs/STORE_LISTING.md` — app name/subtitle ideas, short/long
   description draft, keyword list for the App Store's 100-char keyword
   field, additional keyword candidates for Play Store, category
   suggestions.

## Explicitly NOT done — blocked

- **App icon** — needs real design work (Material 3 adaptive icon
  requirements), not something to generate from code alone.
- **Store screenshots** (and optional App Store preview video) — need a
  real device/emulator running the built app. Blocked on the Android
  SDK / macOS gaps already tracked in context/KNOWN_ISSUES.md.
- **Legal review** of the Privacy Policy / Terms drafts — the drafts above
  are a starting point, not something to submit to app stores as-is.
- **Business details** to fill in the bracketed placeholders (company/
  developer name, contact email, jurisdiction, actual ad network if any).
- **ASO keyword validation** — the keyword list is a reasoned first pass
  based on the PRD's feature set, not validated against real search
  volume/competition data (no ASO tooling access from here).

## Definition of Done

- Draft content committed: ✅ (this session)
- App icon: not started, needs design work
- Screenshots: not started, blocked on device access
- Legal review: not done, needs a human (ideally a lawyer) pass
- Business details filled in: not done, needs the user

## Notes for next session
- Once RevenueCat is set up (Sprint 6) and an ad network is chosen (if
  any), update the Privacy Policy's purchases/ads sections accordingly
  before finalizing.
- Once device/emulator access exists, come back for screenshots — the
  actual screens (Home, Conversion Setup, Progress, Results, History,
  Settings, Onboarding) are all built and ready to screenshot.
