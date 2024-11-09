import 'package:agendify/features/auth/presentation/pages/signin_screen.dart';
import 'package:agendify/features/main/presentation/pages/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 250, 250, 250),
        ),
        useMaterial3: true,
      ),
      home: SignInScreen(),
    );
  }
}
