import 'package:expenses_app/components/chart_bar.dart';
import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransactions, {super.key});

  final List<Transaction> recentTransactions;

  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransactions[i].value;
        }
      }

      print(DateFormat.E().format(weekDay)[0].toUpperCase());
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay)[0].toUpperCase(),
        'value': totalSum,
      };
    });
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) => sum + tr['value']);
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;

    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactions.map(
              (tr) {
                return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                    label: tr['day'],
                    value: tr['value'],
                    percentage: tr['value'] / _weekTotalValue,
                  ),
                );
              },
            ).toList()),
      ),
    );
  }
}
