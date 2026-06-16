# 🎓 Student Profile Card App

A simple Flutter application that displays a student profile card with shimmer loading effect, responsive design, custom dialog, and snackbar.

---

## 📱 Screenshots

Shimmer Loading + Profile Card
<img width="497" height="340" alt="Student Profile UI Img 1" src="https://github.com/user-attachments/assets/ef7d725e-fc27-4263-b136-83f0fb49a27f" /> 
View Details Dialog + Mark Present  
<img width="468" height="321" alt="Student Profile UI Img 2" src="https://github.com/user-attachments/assets/8327d3a3-b8fa-4823-b548-0339a8cc66b7" />

---

## ✨ Features

- **Shimmer Loading** — displays a animated placeholder for 3 seconds on app start
- **Student Profile Card** — shows avatar, name, student ID, and department
- **"New" Badge** — badge overlay on the profile avatar using Flutter's built-in `Badge` widget
- **View Details Dialog** — custom `AlertDialog` showing full student info with icons
- **Mark Present SnackBar** — success message shown at the bottom on button tap
- **Responsive UI** — all sizing done via `flutter_screenutil` for consistent layout across devices

---

## 🧰 Packages Used

| Package | Version | Purpose |
|---|---|---|
| [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil) | ^5.9.0 | Responsive sizing (`.w`, `.h`, `.sp`, `.r`) |
| [`shimmer`](https://pub.dev/packages/shimmer) | ^3.0.0 | Shimmer loading animation |

---

## 🏗️ Project Structure

```
lib/
└── main.dart        # entire app in one file (single screen)
```

---

## 🧠 Key Concepts Demonstrated

| Concept | Implementation |
|---|---|
| `flutter_screenutil` | All padding, font sizes, radii use `.w`, `.h`, `.sp`, `.r` |
| `shimmer` | `Shimmer.fromColors()` shown while `_isLoading` is `true` |
| `Card` | Elevated card with rounded corners as the profile container |
| `CircleAvatar` | Student avatar with custom background and icon |
| `Badge` | Built-in Flutter `Badge` widget overlaid on `CircleAvatar` |
| `AlertDialog` | Custom dialog with `ListTile` rows for student details |
| `SnackBar` | `ScaffoldMessenger.showSnackBar()` on mark present action |

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `>=3.7.0`
- Dart SDK `>=3.0.0`

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/wasifibnharun/student-profile-card-app.git
   cd assignment_flutter_m14
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

---

## 📦 pubspec.yaml Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_screenutil: ^5.9.0
  shimmer: ^3.0.0
```

---

## 📋 App Flow

```
App Launch
    │
    ▼
Shimmer Loading (3 seconds)
    │
    ▼
Student Profile Card
    ├── [View Details] ──► AlertDialog with student info
    │                           └── [Close] ──► dismiss dialog
    │
    └── [Mark Present] ──► SnackBar: "Mike Rack marked as Present ✅"
```

---

## 👨‍💻 Author

**Wasif**
BSc in Mechanical Engineering, Islamic University of Technology (IUT)
Flutter Developer
