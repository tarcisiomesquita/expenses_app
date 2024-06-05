import 'package:expenses_app/components/adaptative_button.dart';
import 'package:expenses_app/components/adaptative_date_picker.dart';
import 'package:expenses_app/components/adaptative_text_field.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm(this.onSubmit, {super.key});

  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  void _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              10, 10, 10, 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AdaptativeTextField(
                controller: _titleController,
                keyboardType: TextInputType.text,
                label: 'Título',
                textInputAction: TextInputAction.next,
              ),
              AdaptativeTextField(
                controller: _valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                label: 'Valor (R\$)',
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) => setState(
                  () {
                    _selectedDate = newDate;
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 8),
              //   child: Row(
              //     children: [
              //       _selectedDate == null
              //           ? Text('Data:  $_selectedDate')
              //           : const Text('Nenhuma data selecionada!'),
              //       const Spacer(),
              //       TextButton(
              //         onPressed: _showDatePicker,
              //         style: Theme.of(context).textButtonTheme.style,
              //         child: const Text(
              //           'Selecionar data',
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    onPressed: _submitForm,
                    label: 'Nova transação',
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
