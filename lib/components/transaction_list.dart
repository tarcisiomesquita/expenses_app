import 'package:expenses_app/models/format_intl.dart';
import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
    this.transactions, {
    super.key,
  });
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map(
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
    );
  }
}
