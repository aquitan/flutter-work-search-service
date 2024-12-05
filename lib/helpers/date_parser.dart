import 'package:intl/intl.dart';

String? parseDate(String? date) {
  if (date != null) {
    final dateParsed = DateTime.parse(date);

    final formatter = DateFormat('dd.MM.yy');

    final dateFinalized = formatter.format(dateParsed);

    return dateFinalized;
  }

  return null;
}
