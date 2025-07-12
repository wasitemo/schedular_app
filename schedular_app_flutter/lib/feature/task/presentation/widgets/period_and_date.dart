import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PeriodAndDate extends StatefulWidget {
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
  State<PeriodAndDate> createState() => _PeriodAndDateState();
}

class _PeriodAndDateState extends State<PeriodAndDate> {
  DateTime? _selectedDate;

  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(now.year, now.month + 1, 0);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    setState(() {
      if (pickedDate != null) {
        _selectedDate = pickedDate;
        widget.dateController.text = DateFormat.yMd().format(pickedDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 13),
        TextFormField(
          controller: widget.periodController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.periodValidator,
          decoration: InputDecoration(labelText: widget.periodLabel),
        ),
        const SizedBox(height: 29),
        TextFormField(
          controller: widget.dateController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.dateValidator,
          decoration: InputDecoration(
            labelText: widget.dateLabel,
          ),
          readOnly: true,
          onTap: _datePicker,
        ),
        const SizedBox(height: 13),
      ],
    );
  }
}
