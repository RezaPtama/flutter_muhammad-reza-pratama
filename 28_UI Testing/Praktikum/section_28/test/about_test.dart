import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:section_15/main.dart';

void main() {
  testWidgets("Judul Halaman Harus Contacts ", (WidgetTester tester) async{

    await tester.pumpWidget(
      MaterialApp(
        home: const MyHomePage(title: "T",),
      ),
    );
    expect(find.text('T'), findsOneWidget);
  });
  // testWidgets("Tombol Harus", (WidgetTester tester) async{

  // });
}