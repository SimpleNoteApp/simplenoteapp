import 'package:intl/intl.dart';

String timestampToDateString(String timestamp) {
  final DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm');

  return formatter.format(DateTime.parse(timestamp).toLocal());
}
