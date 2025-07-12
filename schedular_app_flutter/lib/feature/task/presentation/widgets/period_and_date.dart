import 'package:flutter/material.dart';

class PeriodAndDate extends StatelessWidget {
  final TextEditingController periodController;
  final String? Function(String?)? periodValidator;
  final String periodLabel;
  final TextEditingController dateController;
  final String? Function(String?)? dateValidator;
  final String dateLabel;

  const PeriodAndDate({
    super.key,
    required this.periodController,
    required this.dateValidator,
    required this.periodLabel,
    required this.dateController,
    required this.periodValidator,
    required this.dateLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 13),
        TextFormField(
          controller: periodController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: periodValidator,
          decoration: InputDecoration(labelText: periodLabel),
        ),
        const SizedBox(height: 29),
        TextFormField(
          controller: dateController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: dateValidator,
          decoration: InputDecoration(
            labelText: dateLabel,
          ),
        ),
        const SizedBox(height: 13),
      ],
    );
  }
}
