import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sign_in_sign_up/features/auth/stores/sign_up_store.dart';

import 'widgets/custom_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({
    super.key,
    required this.store,
  });

  final SignUpStore store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Observer(
            builder: (_) => CustomTextField(
              onChanged: store.setEmail,
              labelText: 'Email',
              errorText: store.emailError,
            ),
          ),
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
