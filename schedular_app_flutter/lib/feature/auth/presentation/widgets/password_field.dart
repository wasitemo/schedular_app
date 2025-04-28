import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final String? Function(String?)? validator;
  final String label;

  const PasswordField({
    super.key,
    required this.passwordController,
    required this.validator,
    required this.label,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscureText = false;

  @override
  void initState() {
    super.initState();
    isObscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isObscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: IconButton(
          icon: Icon(
            isObscureText ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).colorScheme.outline,
          ),
          onPressed: () {
            setState(() {
              isObscureText = !isObscureText;
            });
          },
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: widget.validator,
    );
  }
}
