import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:simplenoteapp/src/utils/date.util.dart';

void main() {
  tz.initializeTimeZones();

  test('formatDate returns correct date in different timezones', () {
    var date = tz.TZDateTime.parse(tz.UTC, "2021-10-10T00:00:00.000Z");

    var timezones = ['America/New_York', 'Europe/London', 'Asia/Kolkata'];

    var expectedDates = [
      '09-10-2021 08:00',
      '10-10-2021 01:00',
      '10-10-2021 05:30'
    ];

    for (var i = 0; i < timezones.length; i++) {
      tz.setLocalLocation(tz.getLocation(timezones[i]));

      var formattedDate =
          timestampToDateString(date.toString(), timeZone: timezones[i]);

      expect(formattedDate, expectedDates[i]);
    }
  });
}
