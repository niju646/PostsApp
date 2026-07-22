# Flutter Posts App

A simple Flutter application demonstrating **CRUD operations (Get, Create, Delete)** using the **BLoC** state management pattern and **Dio** for API communication.

The project is built as a learning example to understand how to manage API calls, application state, and UI updates using the `flutter_bloc` package.

---

## ✨ Features

- 📥 Fetch Posts
- ➕ Create a New Post
- 🗑️ Delete a Post
- ⚡ State Management using BLoC
- 🌐 REST API Integration using Dio
- 🔄 Loading and Error States
- 🎯 Clean and Modular Project Structure

---

## 🛠️ Tech Stack

- Flutter
- Dart
- flutter_bloc
- Dio
- REST API

---

## 📂 Project Structure

```
lib/
│
├── features/
│   └── posts/
│       ├── data/
│       │   ├── models/
│       │   │     └── post_model.dart
│       │   └── services/
│       │         └── post_service.dart
│       │
│       ├── presentation/
│       │   ├── bloc/
│       │   │   ├── posts_bloc.dart
│       │   │   ├── posts_event.dart
│       │   │   └── posts_state.dart
│       │   │
│       │   ├── screens/
│       │   │     ├── post_screen.dart
│       │   │     └── create_post_screen.dart
│       │   │
│       │   └── widgets/
│       │     └── custom_card.dart
│       └──
│
├── services/
│      └── api_services.dart
│
└── main.dart
```

---

## 📦 Packages Used

```yaml
dependencies:
  flutter_bloc: ^9.x.x
  dio: ^5.x.x
```


## 📌 Events

- FetchPosts
- CreatePosts
- DeletePosts


## ▶️ Running the Project

1.Clone the repository
2.Install dependencies
3.flutter pub get
4.flutter run

## 📚 What I Learned

- BLoC Architecture
- Event Driven Programming
- State Management using flutter_bloc
- REST API Integration with Dio
- Error Handling
- Asynchronous Programming
- Clean Flutter Project Structure
- CRUD Operations using REST APIs

---

## ⚠️ Note

This project uses **JSONPlaceholder**, which is a fake REST API.

- ✅ GET returns real sample data.
- ✅ POST returns a fake successful response.
- ✅ DELETE returns a fake successful response.
- ❌ Data is **not permanently created or deleted** on the server.

This project is intended for learning BLoC and API integration concepts.

---

## 👨‍💻 Author

Developed using Flutter, flutter_bloc, and Dio as a practice project for learning state management and REST API integration.

---

## ⭐ Support
If you found this project useful, consider giving it a ⭐ on GitHub.