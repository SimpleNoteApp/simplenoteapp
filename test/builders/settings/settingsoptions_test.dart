import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simplenoteapp/src/builders/settings/settingsoption.builder.dart'; // замініть на ім'я вашого пакета

void main() {
  testWidgets('SettingsOption test', (WidgetTester tester) async {
    bool isTapped = false;

    // Створюємо віджет налаштувань
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: SettingsOption(
          title: "Test Option",
          trailing: const Icon(Icons.settings),
          onTap: () {
            isTapped = true;
          },
        ),
      ),
    ));

    // Перевіряємо, чи відображається заголовок налаштувань
    expect(find.text('Test Option'), findsOneWidget);

    // Перевіряємо, чи відображається іконка налаштувань
    expect(find.byIcon(Icons.settings), findsOneWidget);

    // Тапаємо на віджет налаштувань
    await tester.tap(find.byType(SettingsOption));
    await tester.pump();

    // Перевіряємо, чи була викликана функція onTap
    expect(isTapped, isTrue);
  });
}
