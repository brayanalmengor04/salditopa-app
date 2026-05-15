# 🎨 SalditoPA AI Context: UI/UX Guidelines

SalditoPA must feel like a **Premium** and **Modern** application from the very first second.

---

## 💄 1. Visual Aesthetics
* **Colors**: Use exclusively those defined in `AppTheme`.
    * Primary: Vibrant Orange (`#E86B32`).
    * Secondary: Dark Charcoal (`#2D3436`).
* **Edges**: Containers must have a `borderRadius` between `16.0` and `30.0` for a modern and smooth look.
* **Shadows**: Use subtle elevations with low-opacity `BoxShadow`.

## ✨ 2. Micro-interactions
* **Feedback**: Every user action must have visual feedback (color change, subtle animation).
* **Lottie**: Integrate `.json` animations for loading, success, and empty states.
* **Transitions**: Screens must enter and exit using fluid `GoRouter` transitions.

## 🧩 3. Reusable Components
* **Buttons**: Use `PrimaryButton`.
* **Inputs**: Use `CustomTextField`.
* **Spacing**: Use constants of 8, 16, 24, and 32 for consistent margins and paddings.

---
*We design to delight the user, not just to make the app work.*