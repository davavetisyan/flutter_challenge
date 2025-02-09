Project Documentation

This project is a Flutter application utilizing MobX for state management, SharedPreferences for persistent storage, GetIt for depencdency Injection  Mockito/Moctail for testing.
In project there is 2 theme, dark, light

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


6.Application Flow
6.1. First Screen is splash screen where via AppStore app check if there is already loged in user or not.If there is app navigates to Home screen. If there is not app noavigates to Auth screen.
6.2. In Auth screen user can via tab bar select Login or SignUp options, after filling text filed user have to click again in tab bar for action.If all field are validated application navigates to home page.If some fields are not validated application shows error messages.
6.3. In home screen application welcome user by username and user have ability to log out.
6.4. from any screen User can change app theme.


7.Testing
Unit tests and mock tests are performed using Mockito and Mocktail.


Design - https://www.figma.com/design/5F7C64tRnrAYO0flGfuFDs/Flutter-task?node-id=0-1&p=f&t=35r9HfGRQpDEjqce-0

Prototype - https://www.figma.com/proto/5F7C64tRnrAYO0flGfuFDs/Flutter-task?node-id=71-52&scaling=scale-down&page-id=0%3A1&starting-point-node-id=1%3A2


