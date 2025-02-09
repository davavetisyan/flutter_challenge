import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_sign_up/common/models/app_user.dart';

import '../../helpers/json_reader.dart';

void main() {
  final testUser = AppUser('user@mail.ru', 'username', 'password');

  test(
    'should return valid model from json',
    () async {
      //arange

      Map<String, dynamic> json =
          jsonDecode(readJson('helpers/dummy_data/dummy_user_data.json'));
      //act
      final result = AppUser.fromMap(json);

      //assert
      expect(result, equals(testUser));
    },
  );

  test(
    'should return valid json from toJson ',
    () async {
      //arange

      //act
      final result = testUser.toMap();

      Map<String, dynamic> expectedJson =
          jsonDecode(readJson('helpers/dummy_data/dummy_user_data.json'));

      //assert
      expect(result, expectedJson);
    },
  );
}
