// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStore, Store {
  late final _$themeModeAtom =
      Atom(name: '_AppStore.themeMode', context: context);

  @override
  int get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(int value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: '_AppStore.currentUser', context: context);

  @override
  AppUser? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(AppUser? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$_AppStoreActionController =
      ActionController(name: '_AppStore', context: context);

  @override
  void setThemeMode(int value) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.setThemeMode');
    try {
      return super.setThemeMode(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentUser(AppUser user) {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.setCurrentUser');
    try {
      return super.setCurrentUser(user);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logOut() {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.logOut');
    try {
      return super.logOut();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeMode: ${themeMode},
currentUser: ${currentUser}
    ''';
  }
}
