import 'package:dartz/dartz.dart';
import 'package:sign_in_sign_up/common/models/app_user.dart';
import 'package:sign_in_sign_up/core/config/constants/storage_keys.dart';
import 'package:sign_in_sign_up/core/utils/shared_prefs.dart';

import '../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, AppUser>> signIn(
    String username,
    String password,
  );
  Future<Either<Failure, AppUser>> signUp(
    String email,
    String username,
    String password,
  );
}

class AuthRepositoryImplLocalStorage implements AuthRepository {
  final AppStorage _userStorage;
  AuthRepositoryImplLocalStorage(this._userStorage);

  @override
  Future<Either<Failure, AppUser>> signIn(String username, String password) {
    try {
      final result = _userStorage.checkUser(username, password);

      if (result != null) {
        return Future.value(Right(result));
      } else {
        return Future.value(
          Left(
            Failure('Invalid Username or Password'),
          ),
        );
      }
    } catch (e) {
      return Future.value(
        Left(
          Failure('Invalid Username or Password'),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AppUser>> signUp(
      String email, String username, String password) async {
    try {
      final user = AppUser(
        email,
        username,
        password,
      );
      await _userStorage.saveUser(user);

      return Right(user);
    } catch (e) {
      return Future.value(
        Left(
          Failure('Something went wrong Email'),
        ),
      );
    }
  }
}

class AppStorage {
  final SharedPrefs _prefs;

  AppStorage(this._prefs);

  Future<void> saveUser(AppUser user) async {
    final users = _prefs.getStringList(StorageKeys.usersList);
    users.add(user.toJson());
    await _prefs.setStringList(StorageKeys.usersList, users);
  }

  AppUser? checkUser(String username, String password) {
    final users = _prefs.getStringList(StorageKeys.usersList);

    for (final user in users) {
      final appUser = AppUser.fromJson(user);
      if (appUser.username == username && appUser.password == password) {
        return appUser;
      }
    }

    return null;
  }

  AppUser? getLoggedInUser() {
    final user = _prefs.getString(StorageKeys.loggedInUse);
    print(user);
    if (user.isNotEmpty) {
      return AppUser.fromJson(user);
    } else {
      return null;
    }
  }

  removeUser() {
    _prefs.remove(StorageKeys.loggedInUse);
  }

  int getCurrentTheme() {
    return _prefs.getInt(StorageKeys.currentTheme);
  }

  saveCurrentTheme(int value) {
    _prefs.setInt(StorageKeys.currentTheme, value);
  }

  void saveUserInStorage(AppUser user) {
    _prefs.setString(StorageKeys.loggedInUse, user.toJson());
  }
}
