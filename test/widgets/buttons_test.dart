import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:simplenoteapp/src/widgets/buttons.widgets.dart';

import '../mocks.dart';

void main() {
  testWidgets('AddNewNoteButton navigates to correct route',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp.router(
      routerConfig: router,
    ));

    await tester.tap(find.byType(AddNewNoteButton));
    await tester.pumpAndSettle();

    expect(find.text('New Note'), findsOneWidget);
  });
}
