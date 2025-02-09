import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sign_in_sign_up/common/models/app_user.dart';
import 'package:sign_in_sign_up/common/repositories/auth_repository.dart';
import 'package:sign_in_sign_up/core/error/failure.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockAppStorage mockAppStorage;

  late AuthRepositoryImplLocalStorage authRepositoryImplLocalStorage;

  setUp(() {
    mockAppStorage = MockAppStorage();
    authRepositoryImplLocalStorage =
        AuthRepositoryImplLocalStorage(mockAppStorage);
  });

  const usernameTest = 'username';
  const passwordTest = 'password';
  const emailTest = 'email';

  final testUser = AppUser(emailTest, usernameTest, passwordTest);

  group('getting result for login', () {
    test('getting data succesfully', () async {
      when(mockAppStorage.checkUser(usernameTest, passwordTest))
          .thenAnswer((_) => testUser);

      final result = await authRepositoryImplLocalStorage.signIn(
          usernameTest, passwordTest);

      expect(result, equals(Right(testUser)));
    });
    test('getting data unsuccesfully', () async {
      when(mockAppStorage.checkUser(usernameTest, passwordTest))
          .thenAnswer((_) => null);

      final result = await authRepositoryImplLocalStorage.signIn(
          usernameTest, passwordTest);

      expect(
          result,
          equals(
            Left(Failure('Invalid Username or Password')),
          ));
    });

    test('getting data with exception', () async {
      when(mockAppStorage.checkUser(usernameTest, passwordTest))
          .thenThrow(Exception());

      final result = await authRepositoryImplLocalStorage.signIn(
          usernameTest, passwordTest);

      expect(
          result,
          equals(
            Left(Failure('Invalid Username or Password')),
          ));
    });
  });

  group('getting result for signup', () {
    test('getting data succesfully', () async {
      when(mockAppStorage.saveUser(testUser)).thenAnswer(
        (_) => Future.value(),
      );

      final result = await authRepositoryImplLocalStorage.signUp(
        emailTest,
        usernameTest,
        passwordTest,
      );

      expect(result, equals(Right(testUser)));
    });

    test('getting data with exception', () async {
      when(mockAppStorage.saveUser(testUser)).thenThrow(Exception());

      final result = await authRepositoryImplLocalStorage.signUp(
          emailTest, usernameTest, passwordTest);

      expect(
          result,
          equals(
            Left(
              Failure('Something went wrong Email'),
            ),
          ));
    });
  });
}
