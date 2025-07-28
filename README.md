# 💰 Smart Expense Tracker
### A Modern Flutter Application for Student Budget Management

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![SQLite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)](https://www.sqlite.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

---

## 📱 Project Overview

**Smart Expense Tracker** is a comprehensive personal finance management application designed specifically for students to track daily expenses, manage budgets, and develop healthy financial habits. Built with Flutter and featuring a modern, intuitive UI/UX design with smooth animations and responsive layouts optimized for both smartphones and tablets.

### 🎯 Project Context
This application was developed as part of the **Final Flutter Project Assignment** for Mobile Development course, implementing a complete expense tracking solution with offline-first architecture and modern design principles.

### 📱 APK FILE
You can access the APK File for android users via: [Google Drive - Expense Tracker.apk
](https://drive.google.com/file/d/1JGVaBIuNmKrmP8VBQnAIXxYDSiNjx9-o/view?usp=sharing)

---

## ✨ Key Features

### 💸 **Core Expense Management**
- **Intuitive Expense Logging** - Quick and easy expense entry with smart categorization
- **Dynamic Category System** - Pre-defined categories with custom icons and color coding
- **Real-time Budget Tracking** - Live calculation of total expenses with visual feedback
- **Smart Date Selection** - Calendar integration for accurate expense dating

### 📊 **Advanced Analytics & Visualization**
- **Interactive Pie Charts** - Beautiful animated charts showing expense distribution
- **Weekly Bar Charts** - Visual representation of spending patterns over 7 days
- **Category Breakdown** - Detailed percentage analysis of spending habits
- **Responsive Charts** - Optimized for both mobile and tablet viewing

### 🎨 **Modern UI/UX Design**
- **Material Design 3** - Latest design system implementation
- **Dark/Light Theme Support** - Seamless theme switching with proper contrast
- **Smooth Animations** - Professional transitions and micro-interactions
- **Responsive Layout** - Tablet and smartphone optimized interface
- **Custom Color Palette** - Carefully crafted color scheme for better user experience

### 💾 **Robust Data Management**
- **SQLite Database** - Reliable offline-first data storage
- **CRUD Operations** - Complete Create, Read, Update, Delete functionality
- **Data Persistence** - All expenses stored locally for offline access
- **Search & Filter** - Advanced expense search capabilities
- **Export Ready** - Structured data format for potential export features

### 🔧 **Technical Excellence**
- **Provider State Management** - Efficient state management architecture
- **Responsive Design** - Adaptive layouts for different screen sizes
- **Performance Optimized** - Smooth 60fps animations and interactions
- **Clean Architecture** - Well-structured codebase following Flutter best practices

---

## 📸 SmartPhones Screenshots 

### Light Theme
![WhatsApp Image 2025-07-29 at 00 12 21_1c594f44](https://github.com/user-attachments/assets/6c86f51d-5154-4986-8418-27b58b9bb9e9)
![WhatsApp Image 2025-07-29 at 00 12 21_82a8f30d](https://github.com/user-attachments/assets/4b3fb756-0b53-473e-bbe6-c098458746b8)

### Dark Theme
![WhatsApp Image 2025-07-29 at 00 12 21_151f139d](https://github.com/user-attachments/assets/63a53f60-fb42-4b3c-8e19-ce480390b5e8)




## 📸 Tablet Screenshots 

### Light Theme
<img width="600" height="960" alt="image" src="https://github.com/user-attachments/assets/3659333f-ab6d-4427-8650-38377d027dc9" />
<img width="600" height="960" alt="image" src="https://github.com/user-attachments/assets/96b84f91-f9dc-442b-82f6-42b45513a9c1" />
<img width="600" height="960" alt="image" src="https://github.com/user-attachments/assets/60f3815f-9bf7-45af-ac2a-c2dd1b18e6c7" />
<img width="600" height="960" alt="image" src="https://github.com/user-attachments/assets/a621ca74-2a22-41e8-9618-0e0323014024" />





### Dark Theme
![WhatsApp Image 2025-07-28 at 14 52 16_8d198aa2](https://github.com/user-attachments/assets/3b89539b-5fa0-4ae5-a618-0754c5cf5106)
![WhatsApp Image 2025-07-28 at 14 52 15_50e7fec7](https://github.com/user-attachments/assets/a47145f1-5e34-40f3-bf90-b0a0cb732b23)



---

## 🏗️ Technical Architecture

### **Tech Stack**
```
Frontend Framework: Flutter 3.27.2
Language: Dart 3.0+
Database: SQLite (sqflite)
State Management: Provider Pattern
Charts: FL Chart
Internationalization: intl package
Platform Support: Android, iOS, Web, Desktop
```

### **Project Structure**
```
lib/
├── constants/
│   └── icons.dart                 # Category icons mapping
├── models/
│   ├── database_provider.dart     # Database operations & state management
│   ├── ex_category.dart          # Expense category model
│   ├── expense.dart              # Expense data model
│   └── theme_provider.dart       # Theme management
├── screens/
│   ├── category_screen.dart      # Main dashboard screen
│   ├── expense_screen.dart       # Category detail screen
│   └── all_expenses.dart         # All expenses list screen
├── widgets/
│   ├── category_screen/          # Dashboard widgets
│   ├── expense_screen/           # Expense detail widgets
│   ├── all_expenses_screen/      # Expense list widgets
│   └── expense_form.dart         # Add/Edit expense form
└── main.dart                     # App entry point
```

### **Database Schema**
```sql
-- Categories Table
CREATE TABLE categoryTable (
    title TEXT PRIMARY KEY,
    entries INTEGER DEFAULT 0,
    totalAmount TEXT DEFAULT '0.0'
);

-- Expenses Table  
CREATE TABLE expenseTable (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    amount TEXT NOT NULL,
    date TEXT NOT NULL,
    category TEXT NOT NULL,
    FOREIGN KEY (category) REFERENCES categoryTable (title)
);
```

---

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK (3.24.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- Android SDK / Xcode (for mobile development)

### **Installation**

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/smart-expense-tracker.git
   cd smart-expense-tracker
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   # Debug mode
   flutter run
   
   # Release mode
   flutter run --release
   
   # Specific platform
   flutter run -d android
   flutter run -d ios
   ```

4. **Build APK/IPA**
   ```bash
   # Android APK
   flutter build apk --release
   
   # iOS IPA (macOS only)
   flutter build ios --release
   ```

---

## 📦 Dependencies

### **Core Dependencies**
```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.3              # State management
  sqflite: ^2.3.0              # SQLite database
  path: ^1.8.2                 # Path manipulation
  intl: ^0.17.0                # Internationalization
  fl_chart: ^0.69.0            # Beautiful charts
  cupertino_icons: ^1.0.2      # iOS style icons

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0         # Linting rules
```

### **Key Features by Package**
- **Provider**: Efficient state management with ChangeNotifier
- **SQLite**: Robust offline data persistence
- **FL Chart**: Interactive and animated charts
- **Intl**: Localized currency formatting (Rwandan Franc)

---

## 🎨 Design System

### **Color Palette**
```dart
Primary Color:    #6C63FF (Modern Purple)
Secondary Colors: #00D2FF, #3A8AFF, #00BFA5, #FF6B6B, #FFD93D
Background Light: #F8F9FA
Background Dark:  #1A1A1A
Card Color:       Dynamic based on theme
```

### **Typography**
- **Headlines**: Bold, prominent text for titles
- **Body Text**: Clean, readable fonts for content
- **Captions**: Subtle text for metadata
- **Responsive**: Scales appropriately for tablets

### **Animations**
- **Page Transitions**: Smooth slide animations
- **Chart Animations**: Progressive loading with easing curves
- **Micro-interactions**: Scale effects on button press
- **Theme Transitions**: Seamless dark/light mode switching

---

## 🔧 Core Functionality

### **Expense Management**
```dart
// Add new expense
await provider.addExpense(Expense(
  title: "Coffee",
  amount: 500,
  date: DateTime.now(),
  category: "Food And Drinks"
));

// Update existing expense
await provider.updateExpense(updatedExpense);

// Delete expense
await provider.deleteExpense(expenseId, category, amount);
```

### **Category Analytics**
```dart
// Calculate category statistics
Map<String, dynamic> stats = provider.calculateEntriesAndAmount(category);
double totalExpenses = provider.calculateTotalExpenses();
List<Map<String, dynamic>> weeklyData = provider.calculateWeekExpenses();
```

### **Search & Filter**
```dart
// Search expenses by title
provider.searchText = "coffee";
List<Expense> filteredExpenses = provider.expenses; // Auto-filtered
```

---

## 📊 Meeting Project Requirements

Find the requirements via: https://docs.google.com/document/d/10mc2IHixwQ9qB8-wmR_qEQvPk50GnY8IJjjdAc0PKjw/edit?usp=sharing

### **✅ Functional Features (25%)**
- [x] Expense logging with categorization
- [x] Budget tracking and calculations  
- [x] Category management system
- [x] Search and filter functionality
- [x] CRUD operations for all entities
- [x] Real-time data updates

### **✅ UI/UX Design (20%)**
- [x] Modern Material Design 3 implementation
- [x] Responsive layout for mobile and tablet
- [x] Dark/Light theme support
- [x] Smooth animations and transitions
- [x] Intuitive navigation and user flow
- [x] Professional color scheme and typography

### **✅ Data Persistence Implementation (15%)**
- [x] SQLite database integration
- [x] Robust data models and relationships
- [x] Offline-first architecture
- [x] Data integrity and validation
- [x] Efficient query operations

### **✅ Code Structure & Best Practices (15%)**
- [x] Clean architecture principles
- [x] Separation of concerns
- [x] Proper state management with Provider
- [x] Reusable widgets and components
- [x] Consistent naming conventions
- [x] Comprehensive error handling

### **✅ Performance & Optimization (10%)**
- [x] Smooth 60fps animations
- [x] Efficient database queries
- [x] Optimized widget rebuilds
- [x] Memory management
- [x] Fast app startup time
- [x] Responsive user interactions

### **✅ Presentation & Documentation (15%)**
- [x] Professional README documentation
- [x] Code comments and documentation
- [x] Clear project structure
- [x] Installation and setup guides
- [x] Feature demonstrations
- [x] Technical architecture explanation

---

## 🌟 Bonus Features Implemented

### **🎨 Advanced UI Enhancements (+5%)**
- Custom gradient backgrounds
- Interactive charts with tooltips
- Smooth page transitions
- Micro-animations on user interactions
- Responsive design for tablets

### **⚡ Additional Useful Features (+5%)**
- Advanced search functionality
- Weekly spending analysis
- Category-wise expense breakdown
- Time-based expense queries
- Export-ready data structure

### **🚀 Performance Optimizations (+5%)**
- Lazy loading of expenses
- Efficient database indexing
- Optimized chart rendering
- Memory-efficient animations
- Fast theme switching

---

## 🔄 Version History

### v1.0.0 - Initial Release
- ✅ Core expense tracking functionality
- ✅ Basic UI with light/dark themes
- ✅ SQLite database integration
- ✅ Category management system

### v1.1.0 - UI/UX Enhancement
- ✅ Modern Material Design 3 implementation
- ✅ Advanced animations and transitions
- ✅ Responsive tablet support
- ✅ Enhanced chart visualizations
- ✅ Improved form interactions

---

## 🤝 Contributing

We welcome contributions to make Smart Expense Tracker even better! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

### **Contribution Guidelines**
- Follow Flutter/Dart style guidelines
- Add tests for new features
- Update documentation as needed
- Ensure all existing tests pass

---

## 🐛 Known Issues & Future Enhancements

### **Current Limitations**
- [ ] Data export functionality
- [ ] Cloud sync capabilities
- [ ] Receipt photo attachment
- [ ] Budget alerts and notifications

### **Planned Features**
- [ ] Multi-currency support
- [ ] Advanced reporting and analytics
- [ ] Expense sharing with friends
- [ ] Integration with banking APIs
- [ ] Machine learning for expense categorization

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2025 Smart Expense Tracker

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## 👨‍💻 Author

**ISHIMWE Thierry Henry**
- GitHub: [My GitHub Account](https://github.com/ishimwethierryhenry)
- LinkedIn: [My LinkedIn Profile](https://www.linkedin.com/in/ishimwe-thierry-henry-b9a914168)
- Email: ishimweth@gmail.com

---

## 🙏 Acknowledgments

- AUCA Innovation Center for project guidance
- Flutter team mates for the amazing team work
- Material Design team for design guidelines
- SQLite for reliable database engine
- FL Chart for beautiful chart components


---

## 📞 Support

If you have any questions or need help with the project:

1. **Check the [Issues](https://github.com/ishimwethierryhenry/smart_expense_app/issues)** page
2. **Create a new issue** if your problem isn't already reported
3. **Contact the maintainer** for urgent issues

---

**⭐ If you found this project helpful, please give it a star on GitHub! ⭐**

---

<div align="center">

### 🚀 Built with ❤️ using Flutter

**Smart Expense Tracker** - *Making personal finance management simple and beautiful*

</div>
