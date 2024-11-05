import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  int selectedIndex;
  List<Widget> screensList;
  final Function(int) changeIndex;

  NavigationBottom(
      {Key? key,
      required this.selectedIndex,
      required this.screensList,
      required this.changeIndex})
      : super(key: key);

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
    return BottomNavigationBar(
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
      selectedItemColor: const Color.fromARGB(255, 0, 55, 133),
      onTap: _onItemTapped,
    );
  }
}
