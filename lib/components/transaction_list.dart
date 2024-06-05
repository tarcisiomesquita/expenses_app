import 'package:expenses_app/components/transaction_item.dart';
import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
    this.transactions,
    this.onRemove, {
    super.key,
  });

  final void Function(String id) onRemove;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.05),
                  SizedBox(
                    height: constraints.maxHeight * 0.1,
                    child: Text(
                      'Nenhuma transação cadastrada!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            })
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 5,
                  ),
                  child: TransactionItem(tr: tr, onRemove: onRemove),
                );
              },
            ),
    );
  }
}
