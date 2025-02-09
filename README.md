Project Documentation

This project is a Flutter application utilizing MobX for state management, SharedPreferences for persistent storage, GetIt for depencdency Injection  Mockito/Moctail for testing.

1.Project Structure 
1.1. Common folder - shared repositories, widgets, stores, models used across the app
1.2. Core - contains core configurations like theme data , constants like images, svgs, colors, navigation and some utility classes 
1.3. all features like auth screen(login, sign-up, splash), home screens
1.4. service_locator(GetIt) for dependency injection

2.State management
The project uses MobX for state management
2.1. AppStore manages global states such as the theme, and loged in user information
2.2. LoginStore and SignUpStore handle authentication logic and validation


3.Persistence
The project for storing data uses SharedPreferences, in core/utility/ folder there is utility class which handles interaction with SharedPrefs
AppStorage wrapper class of SharedPrefs which implements main function that project need for interaction with storage like saving selected theme, save LogedIn user , and saving all signed users
4.Navigation
The app defines a structured navigation system using named routes.
5.Dependency Injection
The project utilizes GetIt for dependency injection.
6.Testing
Unit tests and mock tests are performed using Mockito and Mocktail.



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
