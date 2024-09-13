import 'package:agendify/shared/components/navigation_bottom_component.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Novo agendamento',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
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
      ),
    );
  }
}
