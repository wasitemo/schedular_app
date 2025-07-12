import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController inputFieldController;
  final String? Function(String?)? validator;
  final String label;

  const InputField({
    super.key,
    required this.inputFieldController,
    required this.validator,
    required this.label,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.inputFieldController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(labelText: widget.label),
      validator: widget.validator,
    );
  }
}
