import 'package:expenses_app/components/transaction_list.dart';
import 'package:expenses_app/components/transaction_form.dart';
import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(
          _transactions,
        ),
        TransactionForm(),
      ],
    );
  }
}
