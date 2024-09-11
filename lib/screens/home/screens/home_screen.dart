import 'package:agendify/shared/models/scheduling_model.dart';
import 'package:agendify/shared/components/drop_list_component.dart';
import 'package:agendify/shared/components/navigation_bottom_component.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Scheduling> schedules = [];

  void _newScheduling() {}
  DateTime _selectedDate = DateTime.now();
  String _formattedDate = '';

  @override
  void initState() {
    super.initState();
    _formattedDate = _formatDate(_selectedDate);
  }
  //

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _formattedDate = _formatDate(_selectedDate);
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

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
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate == null
                      ? 'No date selected!'
                      : 'Data: $_formattedDate',
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Selecionar data'),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBottom(),
    );
  }
}
