# DesignKit

A shared Flutter UI component library for HDFC Bank's digital applications, built during the Assam Internship Programme 2025–2026 (Batch BS5).

---

## What is this?

DesignKit is a collection of reusable Flutter widgets organised by [Atomic Design](https://atomicdesign.bradfrost.com/) — Atoms, Molecules, Organisms, and Pages. Instead of every team building the same buttons, headers, and nav bars from scratch, they just import this library and use the components directly.

---

## Components

**Atoms**
- `Button` — configurable gradient/solid button with press animation
- `Text` — styled text widget with optional border and fill
- `Icon` — icon with image asset fallback
- `Image` — HDFC logo asset with optional shadow
- `Checkbox` — labelled checkbox with custom colours
- `TextButton` — underlinable text link
- `GlassContainer` — frosted glass container using BackdropFilter
- `GlassCard` — glass container variant with shadow and tint

**Molecules**
- `ActionItems` — horizontal row of tappable action tiles (Send Money, Pay Bills, etc.)
- `Scan` — QR scan tile that opens a glassmorphism popup
- `InlineActionRow` — label + icon row for list/settings screens
- `PrimaryButton` — higher-level button with glassmorphism styling

**Organisms**
- `AppHeader` — HDFC branded top bar with logo, masked customer ID, and notification icon
- `AuthSection` — login section with fingerprint/mPIN buttons
- `BottomNav` — bottom navigation bar with configurable items
- `Header` — simplified page header

**Pages**
- `HomePage` — full HDFC home screen composing AppHeader, ActionItems, AuthSection, Scan, and BottomNav

---

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  designkit:
    git:
      url: https://github.com/Assam-Internship-2025-2026-BS5/designkit.git
```

Then run:

```bash
flutter pub get
```

**For local development**, if the repo is cloned alongside your project:

```yaml
designkit:
  path: ../designkit
```

---

## Usage

```dart
import 'package:designkit/designkit.dart';
```

> **Heads up:** Some DesignKit components share names with Flutter's built-in widgets (`Text`, `Icon`, `Image`, `Checkbox`, `Button`, `TextButton`). If you get name conflicts, hide the ones you don't need:
>
> ```dart
> import 'package:designkit/designkit.dart'
>     hide Text, Icon, Image, Checkbox, Button, TextButton;
> ```

---

## Run Locally

```bash
flutter pub get
flutter run
```

---

## Project Structure

```
lib/
├── designkit.dart          ← single barrel export (import this)
└── components/
    ├── atoms/              ← Button, Text, Icon, Image, Checkbox, TextButton, GlassContainer, GlassCard
    ├── molecules/          ← ActionItems, Scan, InlineActionRow, PrimaryButton
    ├── organisms/          ← AppHeader, AuthSection, BottomNav, Header
    └── pages/              ← HomePage

assets/                     ← shared images used by components
```

---

## Built With

- [Flutter](https://flutter.dev) — stable channel
- Dart 3.x (null-safe)

---

*Assam Internship Programme 2025–2026 · Batch BS5 · HDFC Bank*