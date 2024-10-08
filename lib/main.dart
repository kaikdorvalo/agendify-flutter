import 'package:agendify/screens/auth/ui/screens/signin_screen.dart';
import 'package:agendify/screens/home/screens/home_screen.dart';
import 'package:agendify/screens/main/screens/main_screen.dart';
import 'package:agendify/screens/new/screens/new_screen.dart';
import 'package:agendify/shared/services/storage_service.dart';
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
