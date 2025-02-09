import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.onChanged,
    required this.labelText,
    required this.errorText,
    this.obscureText = false,
  });

  final void Function(String)? onChanged;
  final String labelText;
  final String errorText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            hintText: labelText,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.surfaceDim,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(34),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 1,
              ),
            ),
          ),
          style: TextStyle(
            color: Theme.of(context).colorScheme.surfaceDim,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: AnimatedOpacity(
            opacity: errorText.isNotEmpty ? 1 : 0,
            duration: Duration(milliseconds: 300),
            child: Text(
              errorText,
              style: TextStyle(color: Colors.red),
            ),
          ),
        )
      ],
    );
  }
}
