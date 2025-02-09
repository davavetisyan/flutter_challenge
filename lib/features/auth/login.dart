import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sign_in_sign_up/features/auth/stores/login_store.dart';
import 'package:sign_in_sign_up/features/auth/widgets/custom_text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key, required this.store});

  final LoginStore store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Observer(
            builder: (_) => CustomTextField(
              onChanged: store.setUsername,
              labelText: "Username",
              errorText: store.usernameError,
            ),
          ),
          Observer(
            builder: (_) => CustomTextField(
              onChanged: store.setPassword,
              labelText: "Password",
              errorText: store.passwordError,
              obscureText: true,
            ),
          ),
        ],
      ),
    );
  }
}
