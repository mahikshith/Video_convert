# Engineering Rules

- Feature-first clean architecture
- Riverpod codegen only
- Repository pattern with interface in domain/
- All state via AsyncValue or Notifier
- Errors via sealed Failure hierarchy
- Logger service, never print()
- flutter analyze must be zero warnings before commit
- Unit tests for all usecases and repositories
- Widget tests for all screens
