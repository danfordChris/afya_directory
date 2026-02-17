# Makefile for Flutter Project
# Usage: make <command>
# Examples: make clean, make install, make create_apk, make ipf_gen, make feature name=auth

.PHONY: help clean install apk apk_debug ipf_gen feature run build_runner watch get upgrade outdated analyze format test coverage doctor

# Default target - show help
help:
	@echo "Available commands:"
	@echo "  make clean          - Clean project and get dependencies"
	@echo "  make install        - Install app on connected device"
	@echo "  make apk            - Build release APK and open folder"
	@echo "  make apk_debug      - Build debug APK and open folder"
	@echo "  make ipf_gen        - Run IPF generator"
	@echo "  make feature name=<feature_name> - Generate new feature structure"
	@echo "  make run            - Run the app"
	@echo "  make build_runner   - Run build_runner once"
	@echo "  make watch          - Run build_runner in watch mode"
	@echo "  make get            - Get dependencies"
	@echo "  make upgrade        - Upgrade dependencies"
	@echo "  make outdated       - Check outdated packages"
	@echo "  make analyze        - Analyze code"
	@echo "  make format         - Format code"
	@echo "  make test           - Run tests"
	@echo "  make coverage       - Run tests with coverage"
	@echo "  make doctor         - Run flutter doctor"
	@echo "  make setup          - Initial project setup"

# Clean the project and get dependencies
clean:
	flutter clean
	flutter pub get

# Get dependencies
get:
	flutter pub get

# Upgrade dependencies
upgrade:
	flutter pub upgrade

# Check outdated packages
outdated:
	flutter pub outdated

# Install the app on a connected device or emulator
install:
	flutter clean
	flutter pub get
	flutter build apk
	flutter install apk

# Create a release APK and open the folder containing the APK
apk:
	flutter clean
	flutter pub get
	flutter build apk --release
	@echo "APK created successfully!"
	open build/app/outputs/flutter-apk/ || xdg-open build/app/outputs/flutter-apk/ || start build/app/outputs/flutter-apk/

# Create a debug APK with custom name and open folder
apk_debug:
	flutter clean
	flutter pub get
	flutter build apk --debug
	mv build/app/outputs/flutter-apk/app-debug.apk build/app/outputs/flutter-apk/app_debug_mode.apk
	@echo "Debug APK created successfully!"
	open build/app/outputs/flutter-apk/ || xdg-open build/app/outputs/flutter-apk/ || start build/app/outputs/flutter-apk/

# Run IPF generator file to generate models, services, repositories, etc.
ipf_gen:
	flutter test ipf_generator.dart

# Run build_runner once
build_runner:
	flutter pub run build_runner build --delete-conflicting-outputs

# Run build_runner in watch mode
watch:
	flutter pub run build_runner watch --delete-conflicting-outputs

# Generate new feature with complete folder structure
# Usage: make feature name=auth
feature:
ifndef name
	@echo "Error: Please provide a feature name. Usage: make feature name=<feature_name>"
	@exit 1
endif
	@echo "Creating feature: $(name)"
	@mkdir -p lib/features/$(name)/controllers
	@mkdir -p lib/features/$(name)/services
	@mkdir -p lib/features/$(name)/models
	@mkdir -p lib/features/$(name)/screens
	@mkdir -p lib/features/$(name)/widgets
	@echo "// Controllers for $(name) feature" > lib/features/$(name)/controllers/.gitkeep
	@echo "// Services for $(name) feature" > lib/features/$(name)/services/.gitkeep
	@echo "// Models for $(name) feature" > lib/features/$(name)/models/.gitkeep
	@echo "// Screens for $(name) feature" > lib/features/$(name)/screens/.gitkeep
	@echo "// Widgets for $(name) feature" > lib/features/$(name)/widgets/.gitkeep
	@echo "Feature '$(name)' created successfully at lib/features/$(name)/"
	@echo "Structure:"
	@echo "  lib/features/$(name)/"
	@echo "    ├── controllers/"
	@echo "    ├── services/"
	@echo "    ├── models/"
	@echo "    ├── screens/"
	@echo "    └── widgets/"

# Run the app
run:
	flutter run

# Analyze code
analyze:
	flutter analyze

# Format code
format:
	dart format lib/ test/

# Run tests
test:
	flutter test

# Run tests with coverage
coverage:
	flutter test --coverage
	@echo "Coverage report generated at coverage/lcov.info"

# Run flutter doctor
doctor:
	flutter doctor -v

# Initial project setup
setup:
	flutter clean
	flutter pub get
	flutter pub run build_runner build --delete-conflicting-outputs
	@echo "Project setup complete!"
