import 'package:mobx/mobx.dart';
import 'package:sign_in_sign_up/common/models/app_user.dart';
import 'package:sign_in_sign_up/common/repositories/auth_repository.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final AuthRepository _authRepository;
  Function(AppUser) saveUserInStorage;

  _LoginStore(this._authRepository, this.saveUserInStorage);

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  String usernameError = '';

  @observable
  String passwordError = '';

  @computed
  bool get canLogin => username.isNotEmpty && password.isNotEmpty;

  @action
  void setUsername(String value) {
    username = value;
    usernameError = value.isEmpty ? 'Username cannot be empty' : '';
  }

  @action
  void setPassword(String value) {
    password = value;
    passwordError = value.isEmpty ? 'Password cannot be empty' : '';
  }

  @action
  login() async {
    if (canLogin) {
      final result = await _authRepository.signIn(username, password);

      result.fold(
        (error) {
          usernameError = 'Invalid Username or Password';
          passwordError = 'Invalid Username or Password';
        },
        (user) {
          saveUserInStorage(user);
          print('saving in storage');
        },
      );
    } else {
      if (username.isEmpty) {
        usernameError = 'Username cannot be empty';
      }

      if (password.isEmpty) {
        passwordError = 'Password cannot be empty';
      }
    }

    return Future.value();
  }
}
