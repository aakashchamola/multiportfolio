# MultiPlatform Flutter Portfolio App

A visually captivating, multi-platform portfolio app developed using Flutter. Showcases personal profile, experience, education, skills, certifications, and projects with dynamic animations and responsive design.

---

## 📸 Preview

[![Live Preview](https://via.placeholder.com/1200x600?text=Live+Preview)](https://aakashchamola.github.io/multiportfolio/)

---

## 🚀 Features

* Dynamic multi-platform UI (Web, Desktop, Mobile, Tablet)
* Firebase Remote Config integration for data management
* Modular sliding layout for navigation
* Animated hero transitions for landing screen
* Interactive timeline for experience and education
* Skill graph network using Flutter Custom Painter
* Full-screen project showcase with floating panel

---

## 🛠️ Tech Stack

* Flutter
* Firebase Remote Config
* GetX for state management
* Dart animations
* Firebase Core

---

## 📦 Installation

1. **Clone the repository:**

```bash
$ git clone https://github.com/yourusername/multiportfolio.git
$ cd multiportfolio
```

2. **Install dependencies:**

```bash
$ flutter pub get
```

3. **Setup Firebase:**

   * Follow the instructions in the Firebase documentation to generate `firebase_options.dart`.
   * Ensure your Firebase Remote Config key is set up with the expected structure.

4. **Run the app:**

```bash
$ flutter run
```

---

## 🔥 Firebase Setup

1. **Create a Firebase project.**

2. **Add platforms:** Android, iOS, Web.

3. **Generate `firebase_options.dart`:**

   * Install the FlutterFire CLI:

     ```bash
     flutter pub add flutterfire_cli
     ```
   * Run:

     ```bash
     flutterfire configure
     ```

4. **Remote Config Setup:**

   * Create a single key `portfolio` in Remote Config.
   * Structure the JSON data to align with the portfolio model.

---

## 🗂️ Folder Structure

```
lib/
├── core/
│   ├── data/
│   └── utils/
├── features/
│   ├── controllers/
│   ├── models/
│   └── screens/
├── main.dart
├── firebase_options.dart
```

---


## 💬 Feedback

Have feedback or want to contribute? Feel free to create a pull request or open an issue.
