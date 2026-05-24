# Kira

A modern Flutter nutrition tracking application with AI-powered food scanning and discovery features.

![Flutter](https://img.shields.io/badge/Flutter-3.24+-blue)
![Dart](https://img.shields.io/badge/Dart-3.5+-blue)
![License](https://img.shields.io/badge/license-MIT-green)

## ✨ Features

- **Dashboard Screen**: Track daily nutrition with an intuitive calorie gauge and meal cards
- **Onboarding**: Seamless onboarding experience with food scanning introduction
- **Discovery**: Browse trending recipes with category filtering
- **Custom Navigation**: Unique bottom navigation design with overlapping screen content
- **Pixel-Perfect UI**: Faithful implementation of Figma designs
- **Immersive Experience**: Full-screen mode without status bar

## 📱 Screens

### Dashboard
- Circular calorie gauge with progress tracking
- Daily calorie goals and macro breakdown
- Meal cards with time, calories, and nutritional information
- Quick-add functionality for logging meals

### Onboarding
- Interactive introduction to AI food scanning
- Calorie tagging visualization
- Smooth transition to main app

### Discovery
- Search functionality with notification badges
- Category cards (All, Vegan, Protein, Snacks)
- Trending recipes with difficulty indicators
- Recipe cards with preparation time and calorie information

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.24 or higher
- Dart SDK 3.5 or higher
- Android Studio / Xcode (for mobile development)
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/olaanii/kira.git
cd kira
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
# For Android
flutter run

# For iOS
flutter run -d ios

# For Web
flutter run -d chrome
```

## 📁 Project Structure

```
lib/
├── app/
│   └── kira_app.dart          # Main app entry point
├── screens/
│   ├── dashboard_screen.dart  # Dashboard screen with calorie tracking
│   ├── discovery_screen.dart  # Recipe discovery screen
│   └── onboarding_screen.dart # Onboarding flow
├── theme/
│   └── kira_theme.dart        # App theme and color definitions
└── widgets/
    ├── kira_bottom_nav.dart   # Custom bottom navigation
    └── kira_common.dart       # Common reusable widgets
```

## 🎨 Design System

The app uses a custom design system with:
- **Colors**: Warm, earthy tones with accent colors
- **Typography**: Modern, readable font hierarchy
- **Components**: Custom cards, buttons, and navigation elements
- **Shadows**: Subtle elevation for depth

## 🛠️ Technologies Used

- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language
- **Material Design**: UI component library

## 📝 Development

### Running Tests

```bash
flutter test
```

### Building for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👏 Acknowledgments

- Design implementation based on Figma designs
- Built with Flutter and Dart
