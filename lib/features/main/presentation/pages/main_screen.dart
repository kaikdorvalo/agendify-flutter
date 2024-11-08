import 'package:agendify/features/scheduling/domain/person_entity.dart';
import 'package:agendify/features/scheduling/domain/scheduling_entity.dart';
import 'package:agendify/features/scheduling/presentation/pages/home_screen.dart';
import 'package:agendify/features/scheduling/presentation/pages/new_screen.dart';
import 'package:agendify/features/profile/presentation/pages/profile_screen.dart';
import 'package:agendify/features/main/presentation/components/navigation_bottom_component.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  SchedulingEntity editScheduling =
      SchedulingEntity(PersonEntity('', ''), '', DateTime.now(), id: '');

  MainScreen({super.key});

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int selectedIndex = 0;

  void setEditScheduling(SchedulingEntity scheduling) async {
    setState(() {
      widget.editScheduling = scheduling;
      if (widget.editScheduling != null && widget.editScheduling.id != '') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewScreen(
              changePage: changeIndex,
              scheduling: widget.editScheduling,
            ),
          ),
        );
      }
    });
  }

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
      HomeScreen(
        changePage: changeIndex,
        editScheduling: setEditScheduling,
      ),
      NewScreen(
        changePage: changeIndex,
        scheduling: widget.editScheduling,
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
