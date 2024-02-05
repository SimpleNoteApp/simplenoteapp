import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simplenoteapp/src/builders/hyperlink.builder.dart'; // замініть на ім'я вашого пакета

void main() {
  testWidgets('LinkBuilder test', (WidgetTester tester) async {
    // Створюємо посилання
    await tester.pumpWidget(const MaterialApp(
      home: Material(
        child: LinkBuilder(
          url: "https://www.example.com",
          text: "Example",
        ),
      ),
    ));

    // Перевіряємо, чи відображається текст посилання
    expect(find.text('Example'), findsOneWidget);
  });
}
