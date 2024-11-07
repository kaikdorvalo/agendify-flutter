import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  final int selectedIndex;
  final List<Widget> screensList;
  final Function(int) changeIndex;

  const NavigationBottom(
      {super.key,
      required this.selectedIndex,
      required this.screensList,
      required this.changeIndex});

  @override
  _NavigationBottomState createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  void _onItemTapped(int index) {
    if (index < widget.screensList.length && index >= 0) {
      widget.changeIndex(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 77, 85, 95),
            width: 1.0,
          ),
        ),
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Novo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: widget.selectedIndex,
        backgroundColor: Color(0xFF2B2A38),
        selectedItemColor: const Color(0xFF2194f2),
        unselectedItemColor: const Color(0xFFC2D1D0),
        onTap: _onItemTapped,
      ),
    );
  }
}
