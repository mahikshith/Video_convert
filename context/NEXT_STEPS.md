# Next Steps

1. Commit and push this session's fixes (code review + GPL→LGPL package switch)
2. When Android SDK/device access exists: **test hardware H.264 encoding
   FIRST** (MP4/MOV/MKV conversion) — there's no software fallback anymore,
   so this is the single highest-risk unverified thing in the app
3. Then smoke-test everything else: all compression/destination presets,
   GIF (loop, fps, trim, palette quality), audio (MP3/AAC/WAV), Cancel,
   Save, Share, Hive persistence across restarts, splash/onboarding timing
4. Sprint 6 (Paywall) resumes once RevenueCat account + API keys + store
   product configuration are available
5. Sprint 8 remainder (app icon, screenshots, legal review, business
   details) needs the user
