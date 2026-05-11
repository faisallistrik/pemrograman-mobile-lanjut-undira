# UTS Curriculum Vitae

A Flutter application for displaying a Curriculum Vitae, created for UTS (Ujian Tengah Semester) assignment.

## Project Description

This Flutter project demonstrates the implementation of a complete CV/Resume application with a full Flutter project structure, including support for multiple platforms (Android, iOS, Web, Windows, macOS, and Linux).

## Project Structure

```
uts-curriculum-vitae/
├── lib/                      # Main application code
│   └── main.dart            # Entry point of the application
├── test/                    # Unit and widget tests
│   └── widget_test.dart     # Example widget test
├── android/                 # Android platform-specific code
├── ios/                     # iOS platform-specific code
├── web/                     # Web platform-specific code
├── windows/                 # Windows platform-specific code
├── macos/                   # macOS platform-specific code
├── linux/                   # Linux platform-specific code
├── pubspec.yaml             # Project dependencies and metadata
├── analysis_options.yaml    # Dart analysis configuration
├── .gitignore              # Git ignore rules
└── README.md               # This file
```

## Getting Started

### Prerequisites

- Flutter SDK installed (version 3.0.0 or higher)
- Dart SDK (included with Flutter)
- An IDE like VS Code or Android Studio

### Installation

1. Clone or download this project
2. Navigate to the project directory:
   ```bash
   cd uts-curriculum-vitae
   ```

3. Get Flutter dependencies:
   ```bash
   flutter pub get
   ```

### Running the Application

**For Android:**
```bash
flutter run -d android
```

**For iOS:**
```bash
flutter run -d ios
```

**For Web:**
```bash
flutter run -d web
```

**For Windows:**
```bash
flutter run -d windows
```

**For macOS:**
```bash
flutter run -d macos
```

**For Linux:**
```bash
flutter run -d linux
```

### Running Tests

To run all tests:
```bash
flutter test
```

To run specific test file:
```bash
flutter test test/widget_test.dart
```

## Project Features

- Material 3 design support
- Cross-platform compatibility
- Responsive UI
- Custom fonts support (assets ready)
- Image assets support (assets ready)

## Directory Details

### `/lib`
Contains the main Dart code for your application. The `main.dart` file is the entry point.

### `/test`
Contains unit tests and widget tests to ensure code quality.

### `/android`, `/ios`, `/web`, `/windows`, `/macos`, `/linux`
Platform-specific code and configurations for each target platform.

### Assets
The project supports:
- **Images**: Place image files in `assets/images/`
- **Icons**: Place icon files in `assets/icons/`
- **Fonts**: Place font files in `assets/fonts/`

## Dependencies

- **Flutter**: The Flutter framework
- **Cupertino Icons**: iOS-style icons
- **Flutter Lints**: Lint rules for Flutter projects

## Development

### Code Quality

This project uses Flutter lints for code quality analysis. Run the analyzer with:
```bash
flutter analyze
```

### Formatting

Format your code with:
```bash
dart format lib/ test/
```

## License

This project is created for educational purposes.

## Author

UTS Curriculum Vitae Project

---

Happy coding! 🚀
