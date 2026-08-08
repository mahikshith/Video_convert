---
applyTo: "**/*.dart"
description: "Flutter and Dart coding rules"
---

When writing or modifying Dart code:

- Use `final` unless mutability is required
- Use `const` constructors wherever possible
- Prefer immutable data classes via `freezed`
- Never use `dynamic`; use generics or explicit types
- Named parameters when 3+ parameters
- Use Riverpod code generation (@riverpod annotation)
- Never write hand-rolled Provider or StateNotifierProvider
- All AsyncValue consumers must handle .when(data, loading, error)
- Extract widgets when a build method exceeds 100 lines
- No business logic in widgets — move to providers/usecases

File structure:
- One primary class per file
- File name matches primary class in snake_case
- Feature files live under lib/features/[feature]/[layer]/
