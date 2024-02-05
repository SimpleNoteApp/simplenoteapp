import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

String timestampToDateString(String timestamp, {String? timeZone}) {
  final DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm');

  var date = DateTime.parse(timestamp);
  if (timeZone != null) {
    date = tz.TZDateTime.from(date, tz.getLocation(timeZone));
  }

  return formatter.format(date.toLocal());
}
