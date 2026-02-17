# Flutter Project

A Flutter project with a clean, organized architecture.

## Project Structure

```
lib/
├── core/
│   ├── constants/      # App-wide constants
│   ├── extensions/     # Dart extensions
│   ├── mixins/         # Reusable mixins
│   ├── resources/      # Resource files (fonts, images, svgs)
│   ├── theme/          # App theming
│   └── utils/          # Utility functions
├── dao/                # Data Access Objects
├── features/           # Feature modules
├── l10n/               # Localization files
├── root/               # Root level screens (splash, etc.)
├── services/           # Global services
└── shared/             # Shared components and controllers
    ├── components/
    └── controllers/
```

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- Make (for using Makefile commands)

### Setup

1. Clone the repository
2. Run initial setup:
   ```bash
   make setup
   ```

## Available Make Commands

- `make help` - Show all available commands
- `make clean` - Clean project and get dependencies
- `make run` - Run the app
- `make feature name=<name>` - Generate new feature structure
- `make apk` - Build release APK
- `make apk_debug` - Build debug APK
- `make test` - Run tests
- `make analyze` - Analyze code
- `make format` - Format code

### Creating a New Feature

To create a new feature with the complete folder structure:

```bash
make feature name=auth
```

This will create:
```
lib/features/auth/
├── controllers/
├── services/
├── models/
├── screens/
└── widgets/
```

## Development

Run the app in development mode:
```bash
make run
```

Run tests:
```bash
make test
```

Format code:
```bash
make format
```

## Building

### Debug APK
```bash
make apk_debug
```

### Release APK
```bash
make apk
```

## Contributing

1. Create a feature branch
2. Make your changes
3. Run `make format` and `make analyze`
4. Submit a pull request

## License

Add your license here
