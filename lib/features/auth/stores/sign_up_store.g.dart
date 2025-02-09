// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpStore on _SignUpStore, Store {
  Computed<bool>? _$canSignInComputed;

  @override
  bool get canSignIn => (_$canSignInComputed ??=
          Computed<bool>(() => super.canSignIn, name: '_SignUpStore.canSignIn'))
      .value;

  late final _$emailAtom = Atom(name: '_SignUpStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$usernameAtom =
      Atom(name: '_SignUpStore.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SignUpStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$emailErrorAtom =
      Atom(name: '_SignUpStore.emailError', context: context);

  @override
  String get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(String value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  late final _$usernameErrorAtom =
      Atom(name: '_SignUpStore.usernameError', context: context);

  @override
  String get usernameError {
    _$usernameErrorAtom.reportRead();
    return super.usernameError;
  }

  @override
  set usernameError(String value) {
    _$usernameErrorAtom.reportWrite(value, super.usernameError, () {
      super.usernameError = value;
    });
  }

  late final _$passwordErrorAtom =
      Atom(name: '_SignUpStore.passwordError', context: context);

  @override
  String get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(String value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('_SignUpStore.signUp', context: context);

  @override
  Future signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  late final _$_SignUpStoreActionController =
      ActionController(name: '_SignUpStore', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
username: ${username},
password: ${password},
emailError: ${emailError},
usernameError: ${usernameError},
passwordError: ${passwordError},
canSignIn: ${canSignIn}
    ''';
  }
}
