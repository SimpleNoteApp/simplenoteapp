import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simplenoteapp/src/builders/button.builder.dart'; // замініть на ім'я вашого пакета

void main() {
  testWidgets('ButtonBuilder test', (WidgetTester tester) async {
    // Створюємо кнопку з іконкою та міткою
    await tester.pumpWidget(MaterialApp(
      home: ButtonBuilder(
        icon: Icons.add,
        onPressed: () {},
        label: 'Test',
        width: 100,
        height: 50,
        tooltip: 'Test Tooltip',
        color: Colors.red,
      ),
    ));

    // Перевіряємо, чи відображається іконка
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Перевіряємо, чи відображається мітка
    expect(find.text('Test'), findsOneWidget);

    // Створюємо кнопку тільки з іконкою
    await tester.pumpWidget(MaterialApp(
      home: ButtonBuilder(
        icon: Icons.add,
        onPressed: () {},
        width: 100,
        height: 50,
        tooltip: 'Test Tooltip',
        color: Colors.red,
      ),
    ));

    // Перевіряємо, чи відображається іконка
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Перевіряємо, що мітка не відображається
    expect(find.text('Test'), findsNothing);
  });
}
