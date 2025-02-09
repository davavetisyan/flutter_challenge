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


Design - https://www.figma.com/design/5F7C64tRnrAYO0flGfuFDs/Flutter-task?node-id=0-1&p=f&t=35r9HfGRQpDEjqce-0
Prototype - https://www.figma.com/proto/5F7C64tRnrAYO0flGfuFDs/Flutter-task?node-id=71-52&scaling=scale-down&page-id=0%3A1&starting-point-node-id=1%3A2


