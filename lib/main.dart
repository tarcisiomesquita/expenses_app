import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    const ExpensesApp(),
  );
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting('pt_BR', null);
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final _transactions = [
    Transaction(
      id: 't1',
      title: "Óleo para cabelo L'Oréal",
      value: 35.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Internet',
      value: 99.99,
      date: DateTime.now(),
    ),
  ];

  String formatCurrency(double value) => NumberFormat.currency(
        symbol: 'R\$',
        decimalDigits: 2,
      ).format(value);
  String formatDate(DateTime date) => DateFormat.yMMMd().format(date);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: _transactions.map(
              (tr) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          formatCurrency(tr.value),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            formatDate(tr.date),
                            style: TextStyle(
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ).toList(),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Título'),
                  ),
                  TextField(
                    controller: valueController,
                    decoration: const InputDecoration(labelText: 'Valor (R\$)'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.purple,
                        ),
                        child: const Text(
                          'Nova transação',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
