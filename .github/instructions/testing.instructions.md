---
applyTo: "test/**/*.dart"
description: "Testing conventions"
---

- Use flutter_test for widget tests
- Use mocktail for mocking (never mockito for null-safe code)
- Test files: test/features/[feature]/[layer]/[thing]_test.dart
- Arrange-Act-Assert pattern
- One behavior per test
- Use group() to organize related tests
- Providers tested via ProviderContainer when possible
