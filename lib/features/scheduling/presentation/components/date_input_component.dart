import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatefulWidget {
  DateTime date;
  String label;
  final Function(DateTime) changeDate;

  DateInput(
      {Key? key,
      required this.date,
      required this.changeDate,
      required this.label})
      : super(key: key);

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  String formattedDate = '';
  DateTime _selectedDate = DateTime.now();

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

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
        formattedDate = _formatDate(_selectedDate);
        widget.changeDate(_selectedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    formattedDate = _formatDate(widget.date);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 17.0,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        GestureDetector(
          onTap: () {
            _selectDate(context);
          },
          child: Container(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
                left: 15.0,
                right: 15.0,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF323141),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.calendar_month,
                    color: Color.fromARGB(255, 33, 149, 243),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              )),
        )
      ],
    );
  }
}
