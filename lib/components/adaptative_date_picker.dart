import 'dart:io';

import 'package:expenses_app/models/format_intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onDateChanged;

  const AdaptativeDatePicker({
    required this.selectedDate,
    required this.onDateChanged,
    super.key,
  });

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        onDateChanged(pickedDate);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
            height: 100,
            child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                minimumDate: DateTime(2024),
                maximumDate: DateTime.now(),
                onDateTimeChanged: onDateChanged),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                selectedDate == null
                    ? const Text('Nenhuma data selecionada!')
                    : Text('Data: ${formatDate(selectedDate)}'),
                const Spacer(),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  style: Theme.of(context).textButtonTheme.style,
                  child: const Text(
                    'Selecionar data',
                  ),
                )
              ],
            ),
          );
  }
}
