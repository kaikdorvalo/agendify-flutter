import 'package:agendify/screens/auth/ui/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Widget test: find email and password input',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SignInScreen(),
    ));

    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Senha'), findsOneWidget);
  });
}
