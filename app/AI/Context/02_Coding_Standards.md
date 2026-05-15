#  SalditoPA AI Context: Coding Standards

Critical rules to maintain clean, readable, and maintainable code.

---

## 🧼 1. Clean Code Principles
* **S.O.L.I.D**: Every class must have a single responsibility.
* **D.R.Y (Don't Repeat Yourself)**: Abstract common logic into `core` or `shared`.
* **K.I.S.S (Keep It Simple, Stupid)**: Avoid over-engineering. If something can be done simply, do it simply.

## 📝 2. Naming Conventions
* **Classes**: `PascalCase` (e.g., `LoginScreen`, `AuthRepository`).
* **Files**: `snake_case` (e.g., `login_screen.dart`).
* **Variables/Functions**: `camelCase` (e.g., `isUserAuthenticated`, `fetchUserData()`).
* **Booleans**: Must start with an interrogative prefix (`is`, `has`, `can`).

## 🧱 3. Flutter Best Practices
* **Immutability**: Use `final` for all variables that do not change.
* **Constants**: Use `const` constructors whenever possible to optimize the widget tree.
* **L10n**: Hardcoded text is forbidden. Always use `AppLocalizations.of(context)`.
* **Async**: Always use `Future` and `async/await` cleanly, handling errors with `try-catch` blocks or `Result` types.

---
*Dirty code is technical debt that SalditoPA cannot afford.*