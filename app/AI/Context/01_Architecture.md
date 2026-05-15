# 🧠 SalditoPA AI Context: Architecture Blueprint

This document defines the layer structure and file organization following the principles of **Clean Architecture** and **Domain-Driven Design (DDD)**.

---

## 🏛️ Layer Structure (lib/)

### 1. 📂 `domain/` (The Core)
The purest layer. It must not depend on Flutter or external infrastructure libraries.
* **`entities/`**: Pure business data models.
* **`repositories/`**: Interfaces that define data contracts.
* **`usecases/`**: Specific business logic (one file per use case).

### 2. 📂 `infrastructure/` (The Implementation)
Where the technology lives.
* **`datasources/`**: Direct API calls (Remote) or local persistence (Local).
* **`repositories/`**: Concrete implementations of the interfaces in `domain`.
* **`models/`**: Extensions of the entities with `fromJson` and `toJson` methods.

### 3. 📂 `features/` (Feature Modules)
Organized by functionality (e.g., `auth`, `payments`).
* **`presentation/`**: Screens, specific Widgets, and state controllers (Providers/Blocs).

### 4. 📂 `shared/` (Global Components)
* **Widgets**: Reusable widgets throughout the application (buttons, text fields, dialogs).

### 5. 📂 `config/` (Configuration)
* Routes (GoRouter), Themes (AppTheme), and environment variables.

---

## 🚦 Dependency Rules
* **IMPORTANT**: Dependencies must always point INWARD.
* The `domain` layer must never import anything from `infrastructure` or `presentation`.
* The `presentation` layer communicates with `domain` through Use Cases.