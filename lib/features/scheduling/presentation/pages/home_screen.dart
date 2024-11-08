import 'package:agendify/core/components/app_bar_component.dart';
import 'package:agendify/features/scheduling/domain/person_entity.dart';
import 'package:agendify/features/scheduling/presentation/components/list_item_component.dart';
import 'package:agendify/features/scheduling/domain/scheduling_entity.dart';
import 'package:agendify/core/service/http_methods.dart';
import 'package:agendify/features/scheduling/data/scheduling_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final SchedulingService service = SchedulingService('agenda', HttpMethods());
  final Function(SchedulingEntity) editScheduling;
  final Function(int) changePage;

  HomeScreen(
      {super.key, required this.editScheduling, required this.changePage});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SchedulingEntity> schedules = [];

  List<Widget> listWidget = [];

  DateTime _selectedDate = DateTime.now();
  String _formattedDate = '';

  void setList() async {
    List<dynamic> list = await widget.service.loadAgendas();
    List<SchedulingEntity> filteredList = [];

    SizedBox size = const SizedBox(
      height: 20.0,
    );

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
      widgets.add(ListItem(
        scheduling: item,
        deleteScheduling: _deleteScheduling,
        editScheduling: _editScheduling,
      ));
      widgets.add(size);
      print(item.id);
    });

    setState(() {
      listWidget = widgets;
    });
  }

  @override
  void initState() {
    super.initState();
    _formattedDate = _formatDate(_selectedDate);
    setList();
    // widget.editScheduling(
    //     SchedulingEntity(PersonEntity('', ''), '', DateTime.now()));
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

  void _deleteScheduling(String? id) async {
    if (id != null) {
      var res = await widget.service.deleteScheduling(id);
      if (res.statusCode == 200) {
        setList();
      }
    }
  }

  void _editScheduling(SchedulingEntity scheduling) {
    widget.editScheduling(scheduling);
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: 'Agendamentos'),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1D1D29),
        ),
        padding: const EdgeInsets.only(
            top: 20.0, bottom: 0, left: 30.0, right: 30.0),
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
                      color: Color(0xFF212830),
                      border: Border.all(color: Color(0xFF3d444d), width: 1.0),
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
                                color: Color(0xFF9198a1),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.calendar_month,
                          color: Color(0xFF9198a1),
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
