import 'package:agendify/screens/home/components/list_item_component.dart';
import 'package:agendify/shared/models/person_model.dart';
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

  Scheduling _newScheduling() {
    Person person = Person('12345-6', 'Kaik Dorvalo');
    Scheduling scheduling =
        Scheduling(person, 'Realizar extração de siso', DateTime.now());
    return scheduling;
  }

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
        title: const Text(
          'Agendamentos',
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
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 155, 155, 155),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(5.0)),
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Center(
                            child: Text(
                              _formattedDate,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 54, 54, 54),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.calendar_month,
                          color: Color.fromARGB(255, 112, 112, 112),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListItem(scheduling: _newScheduling()),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationBottom(),
    );
  }
}
