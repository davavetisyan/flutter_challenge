import 'package:mobx/mobx.dart';
import 'package:sign_in_sign_up/common/repositories/auth_repository.dart';

import '../models/app_user.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  final AppStorage _appStorage;
  _AppStore(this._appStorage) {
    _init();
  }

  _init() {
    final user = _appStorage.getLoggedInUser();
    if (user != null) {
      currentUser = user;
    }

    themeMode = _appStorage.getCurrentTheme();
  }

  @observable
  int themeMode = 0;

  @observable
  AppUser? currentUser;

  @action
  void setThemeMode(int value) {
    themeMode = value;
    _appStorage.saveCurrentTheme(value);
  }

  @action
  setCurrentUser(AppUser user) {
    currentUser = user;
    _appStorage.saveUserInStorage(user);
  }

  @action
  void logOut() {
    currentUser = null;
    _appStorage.removeUser();
  }
}
