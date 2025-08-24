Screen - 1
1. Steps to Run the Project
Prerequisites: Ensure you have Flutter SDK installed on your machine
Clone the repository (if applicable)
Navigate to project directory: cd task_webing
Install dependencies: Run flutter pub get
Run the app: Use flutter run to launch on connected device/emulator

2. Dependencies Used
google_fonts:  - For custom typography
provider: - For state management
flutter_svg: - For rendering SVG icons
http:  - For API calls
intl:  - For date formatting

3. Approach and Thought Process
Design Implementation:
Created a clean, modern UI matching the provided design
Implemented custom widgets for calendar, cards, and navigation
Used Stack widgets for decorative elements and overlapping content
State Management:
Utilized Provider pattern to manage plan data and selected date
Implemented efficient API calls with loading and error states
Pre-fetched nearby dates for calendar dot indicators
Performance Considerations:
Implemented image caching with loading states
Used const constructors where possible for better performance
Optimized rebuilds with selective Consumer patterns

API Integration:
Created a service layer for API calls
Implemented proper error handling for network requests
Designed fallback UI states for loading and error scenarios

4. Approximate Hours Taken
Total Development Time: Approximately 3-5 hours

The app features a responsive design, smooth animations, and a complete user interface with calendar functionality, plan cards, social integration, and a bottom navigation bar.


Screen - 2
# 🏝 Travel App (Flutter)
1) Steps to Run the Project:
Ensure Flutter SDK is installed (version 3.0 or above).
Run flutter pub get to install dependencies.
Execute flutter run to launch on a connected device/emulator.

2) Dependencies Used:
flutter: UI framework.
provider: State management.
google_fonts: Custom fonts.

3) Approach & Thought Process:
Used MVVM with Provider for state management.
Created reusable components (HeroHeader, GlassBottomBar, etc.) for modularity.
Implemented responsive design for various screen sizes.
Optimized images with fade-in effects and error handling.
Ensured clean UI with gradients, shadows, and glassmorphism effects.

4) Hours Taken:

Approximately 2-3 hours (including design implementation, responsiveness, and testing).


Screen - 3

# Cinema Seat Booking App
A Flutter application for booking cinema seats with a clean and modern UI.

## Features
- View available, reserved, and selected seats
- Select multiple seats for booking
- See real-time pricing information
- Responsive design that works on multiple screen sizes
- Clean MVVM architecture for maintainability

## Architecture
This app follows the MVVM (Model-View-ViewModel) pattern:

- *Models*: Data structures for seats and ticket information
- *ViewModels*: Business logic and state management
- *Views*: UI components and screens
- *Services*: Data access and API integration

## Getting Starte
1. Clone the repository
2. Run flutter pub get to install dependencies
3. Run flutter run to start the application

## Dependencies
- flutter: UI framework
- provider: State management
- google_fonts: Custom fonts

 Hours Taken:

Approximately 2-3 hours (including design implementation, responsiveness, and testing).


