import 'dart:convert';

import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String email;
  final String username;
  final String password;

  AppUser(this.email, this.username, this.password);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'username': username,
      'password': password,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      map['email'] as String,
      map['username'] as String,
      map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [email, username, password];
}
