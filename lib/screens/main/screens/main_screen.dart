import 'package:agendify/screens/home/screens/home_screen.dart';
import 'package:agendify/screens/new/screens/new_screen.dart';
import 'package:agendify/shared/components/navigation_bottom_component.dart';
import 'package:agendify/shared/services/storage_service.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int selectedIndex = 0;

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(StorageService('agenda')),
      NewScreen(
        changePage: changeIndex,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(selectedIndex),
      bottomNavigationBar: NavigationBottom(
        selectedIndex: selectedIndex,
        screensList: _screens,
        changeIndex: changeIndex,
      ),
    );
  }
}
