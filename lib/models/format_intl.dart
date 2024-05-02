import 'package:intl/intl.dart';

String formatCurrency(double value) => NumberFormat.currency(
      symbol: 'R\$',
      decimalDigits: 2,
    ).format(value);

String formatDate(DateTime date) => DateFormat.yMMMd().format(date);
