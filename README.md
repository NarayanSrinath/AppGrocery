# 🛒 GroceryApp

A modern grocery shopping app built with **Flutter** and **BLoC** for state management.

---

## 🚀 Features
✅ **Beautiful UI** with Google Fonts & Theming  
✅ **BLoC State Management** for scalable logic  
✅ **API Integration Ready** with repositories  
✅ **Modular Architecture** for easy maintainability  
✅ **Navigation with Named Routes**  
✅ **Dark & Light Theme Support**  

---

## 📂 Folder Structure



lib/
│── main.dart                   # App entry point
│── app.dart                     # Initializes MaterialApp with theme and routes
│
├── core/                        # Core functionalities (constants, themes, utilities)
│   ├── config/                  
│   │   ├── app_theme.dart       # Defines themes
│   │   ├── app_routes.dart      # Centralized route management
│   ├── utils/                   
│   │   ├── app_colors.dart      # Centralized colors
│   │   ├── app_fonts.dart       # Common fonts
│   │       
│
├── data/                        # Data layer (Repositories, APIs, Local Storage)
│   ├── models/                  # Data models
│   ├── repositories/            # Handles business logic and API calls
│   ├── providers/               # Handles local state management
│   ├── services/                # API or Firebase Services
│
├── logic/                       # Business Logic (BLoC, Cubit, Provider)
│   ├── blocs/                   # BLoC State Management
│   │   ├── auth_bloc.dart       # Authentication BLoC
│   │   ├── cart_bloc.dart       # Shopping cart BLoC
│   │   ├── grocery_bloc.dart    # Grocery BLoC
│   ├── cubits/                  # If using Cubits instead of BLoC
│
├── presentation/                # UI Layer (Screens, Widgets)
│   ├── screens/                 # Screens/UI Pages
│   │   ├── splash/              # Splash screen
│   │   │   ├── splash_screen.dart
│   │   │   ├── splash_bloc.dart  # BLoC for Splash Screen
│   │   ├── home/                # Home screen
│   │   │   ├── home_screen.dart
│   │   │   ├── home_bloc.dart    # BLoC for Home
│   ├── widgets/                 # Reusable UI Components
│   │   ├── custom_button.dart    # Example button widget
│   │   ├── three_dot_loader.dart # Loading animation
│
├── routes/                      # Application Navigation
│   ├── app_router.dart          # Manages named routes
│
├── dependencies.dart             # Provides Dependency Injection (e.g., MultiBlocProvider)
└── pubspec.yaml


---

## 📦 **Installation & Setup**
### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/yourusername/groceryapp.git
cd groceryapp
Install Dependencies
flutter pub get
3️⃣ Run the App
flutter run
 
 
 Contributing
We welcome contributions! To contribute:

Fork the repository
Create a new branch: git checkout -b feature-branch
Commit changes: git commit -m "Add new feature"
Push changes: git push origin feature-branch
Open a pull request
🛠 Troubleshooting
❓ Common Issues
🔹 Dependencies not found? → Run flutter pub get
🔹 App crashes on startup? → Run flutter clean
🔹 Hot reload not working? → Restart flutter run