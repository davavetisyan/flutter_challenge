import 'package:mobx/mobx.dart';
import 'package:sign_in_sign_up/common/models/app_user.dart';

import '../../../common/repositories/auth_repository.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  final AuthRepository _authRepository;
  Function(AppUser) _afterSuccesfulSignUp;

  _SignUpStore(
    this._authRepository,
    this._afterSuccesfulSignUp,
  );

  @observable
  String email = '';

  @observable
  String username = '';

  @observable
  String password = '';

  @observable
  String emailError = '';

  @observable
  String usernameError = '';

  @observable
  String passwordError = '';

  @computed
  bool get canSignIn =>
      email.isNotEmpty && username.isNotEmpty && password.isNotEmpty;

  @action
  void setEmail(String value) {
    email = value;
    emailError = value.isEmpty ? 'Email cannot be empty' : '';
  }

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
  signUp() async {
    if (canSignIn) {
      final result = await _authRepository.signUp(email, username, password);

      result.fold(
        (error) {
          emailError = 'Invalid Email';
          usernameError = 'Invalid Username';
          passwordError = 'Invalid Password';
        },
        (user) {
          _afterSuccesfulSignUp(user);
        },
      );
    } else {
      if (email.isEmpty) {
        emailError = 'Email cannot be empty';
      }

      if (username.isEmpty) {
        usernameError = 'Username cannot be empty';
      }

      if (password.isEmpty) {
        passwordError = 'Password cannot be empty';
      }
    }
  }
}
