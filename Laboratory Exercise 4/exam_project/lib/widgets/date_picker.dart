import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  final Function(DateTime) onDateSelected;

  DatePicker({required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.calendar_today),
      onPressed: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2101),
        );
        if (selectedDate != null) {
          onDateSelected(selectedDate);
        }
      },
    );
  }
}
