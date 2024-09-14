import 'package:agendify/screens/home/components/list_item_component.dart';
import 'package:agendify/shared/models/person_model.dart';
import 'package:agendify/shared/models/scheduling_model.dart';
import 'package:agendify/shared/components/drop_list_component.dart';
import 'package:agendify/shared/components/navigation_bottom_component.dart';
import 'package:agendify/shared/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Scheduling> schedules = [];
  StorageService storage = StorageService();
  List<Widget> listWidget = [];

  Scheduling _newScheduling() {
    Person person = Person('12345-6', 'Kaik Dorvalo');
    Scheduling scheduling =
        Scheduling(person, 'Realizar extração de siso', DateTime.now());
    return scheduling;
  }

  DateTime _selectedDate = DateTime.now();
  String _formattedDate = '';

  Future<List<Scheduling>> loadAgendas() async {
    List<dynamic> jsonList = await storage.getAgendas();
    List<Scheduling> agendas =
        jsonList.map((json) => Scheduling.fromJson(json)).toList();

    return agendas;
  }

  void setList() async {
    List<Scheduling> list = await loadAgendas();
    List<Scheduling> filteredList = [];
    list.forEach((item) {
      int day1 = item.date.day;
      int month1 = item.date.month;
      int year1 = item.date.year;

      int day2 = _selectedDate.day;
      int month2 = _selectedDate.month;
      int year2 = _selectedDate.year;
      if (day1 == day2 && month1 == month2 && year1 == year2) {
        filteredList.add(item);
      }
    });

    List<Widget> widgets = [];

    filteredList.forEach((item) {
      widgets.add(ListItem(scheduling: item));
    });

    setState(() {
      listWidget = widgets;
    });

    print(listWidget);
  }

  @override
  void initState() {
    super.initState();
    _formattedDate = _formatDate(_selectedDate);
    setList();
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

      setList();
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
              child: ListView(children: listWidget),
            )
          ],
        ),
      ),
    );
  }
}
