# Sprint 05 — History & Settings

**Goal (ARCHITECTURE.md storage section):** persist conversion history
(Hive) and a default-preset preference (shared_preferences), with History
and Settings screens reachable from Home.

## Tasks

1. `Hive.initFlutter()` added to `main.dart` (was declared as a dependency
   since Sprint 1 but never actually initialized)
2. `history` feature: `ConversionHistoryEntry` entity (freezed +
   json_serializable — DateTime serializes to ISO8601 automatically),
   `HistoryRepository` interface, `HiveHistoryDataSource` (stores entries
   as `Map<String, dynamic>` in a Hive box — no `hive_generator`/TypeAdapter
   needed, since Hive natively supports primitive Map/List values),
   `HistoryController` (`@riverpod`, exposes `AsyncValue<List<...>>`)
3. `VideoConversionController.startConversion` now auto-saves a history
   entry on successful completion. Wrapped in its own try/catch so a
   history-write failure can't turn a successful conversion into an error
   state for the user.
4. `HistoryPage`: list of past conversions (filename, before/after size,
   date), per-item Share (via `share_plus`, with a friendly fallback if the
   temp output file has since been cleaned up by the OS) and Delete, plus
   a Clear All action with a confirmation dialog
5. `settings` feature: `SettingsRepository` interface,
   `SettingsPreferencesDataSource` (wraps `shared_preferences`, already a
   locked-stack dependency — no new package needed),
   `SettingsRepositoryImpl` encodes/decodes a `ConversionPreset` as a
   `"compression:medium"` / `"destination:whatsapp"` string,
   `DefaultPresetController` (`@riverpod`)
6. `SettingsPage`: default-preset chips (compression + destination) and a
   Clear History action (shared with HistoryPage's)
7. `go_router`: `/history`, `/settings` routes, both pushed (not replaced)
   from Home's AppBar so the back button returns to Home
8. `ConversionSetupPage` now pre-fills its preset selection from the
   default-preset setting on first render, but stops syncing once the user
   manually picks a different preset in that session
9. Tests: `HistoryRepositoryImpl` (sort order, add/delete/clear
   delegation) and `SettingsRepositoryImpl` (encode/decode round-trip,
   fallback on missing/garbage stored value)

## Definition of Done

- `flutter analyze` — zero issues ✅ (verified 2026-08-13)
- `flutter test` — all passing ✅ (30/30, verified 2026-08-13)
- Manual smoke test on a real device/emulator — **still not verified**,
  same reason as Sprints 2–4: no Android SDK, no macOS on this machine.
  Notably unverified: does Hive actually persist across app restarts on a
  real device, does sharing a history item whose temp file was cleaned up
  by the OS actually show the fallback message gracefully.
- context/ files updated
- Commit made

## Notes for next session
- History items point at files in the OS temp directory (same as Results
  screen's Save button destination logic) — temp files aren't guaranteed
  to survive OS cleanup, so old history entries may point at files that no
  longer exist. Worth revisiting once Save-to-permanent-location is the
  primary flow rather than an opt-in button.
- No packages were added this sprint — Hive and shared_preferences were
  already locked-stack dependencies from Sprint 1, just not yet wired up.
