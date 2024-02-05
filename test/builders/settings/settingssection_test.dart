import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:simplenoteapp/src/builders/settings/settingssection.builder.dart';

void main() {
  testWidgets('SettingsSection displays title and children',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: SettingsSection(
          title: 'Test Title',
          children: <Widget>[
            Text('Child 1'),
            Text('Child 2'),
          ],
        ),
      ),
    ));

    // Verify that the title is displayed.
    expect(find.text('Test Title'), findsOneWidget);

    // Verify that the children are displayed.
    expect(find.text('Child 1'), findsOneWidget);
    expect(find.text('Child 2'), findsOneWidget);
  });
}
