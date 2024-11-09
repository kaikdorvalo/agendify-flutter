import 'package:agendify/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:agendify/features/scheduling/domain/person_entity.dart';
import 'package:agendify/features/scheduling/domain/scheduling_entity.dart';
import 'package:agendify/features/scheduling/presentation/pages/home_screen.dart';
import 'package:agendify/features/scheduling/presentation/pages/new_screen.dart';
import 'package:agendify/features/profile/presentation/pages/profile_screen.dart';
import 'package:agendify/features/main/presentation/components/navigation_bottom_component.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

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
      DashboardScreen(),
      HomeScreen(
        changePage: changeIndex,
      ),
      NewScreen(
        changePage: changeIndex,
      ),
      ProfileScreen()
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
