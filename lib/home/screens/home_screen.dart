import 'package:agendify/home/models/scheduling_model.dart';
import 'package:agendify/shared/components/drop_list_component.dart';
import 'package:agendify/shared/components/navigation_bottom_component.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Scheduling> schedules = [];

  void _newScheduling() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendamentos'),
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 201, 201, 201), // Cor da borda
            width: 1.0, // Largura da borda
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[DropList()],
        ),
      ),
      bottomNavigationBar: NavigationBottom(),
    );
  }
}
