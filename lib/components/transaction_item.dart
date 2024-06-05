import 'package:expenses_app/models/format_intl.dart';
import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  final Transaction tr;
  final void Function(String id) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('R\$ ${tr.value}'),
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(formatDate(tr.date)),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () {
                  onRemove(tr.id);
                },
                icon: const Icon(Icons.delete),
                label: const Text('Apagar'),
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.error),
              )
            : IconButton(
                icon: const Icon(
                  Icons.delete,
                ),
                color: Theme.of(context).colorScheme.error,
                onPressed: () {
                  onRemove(tr.id);
                },
              ),
      ),
    );
  }
}
