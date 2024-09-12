import 'package:agendify/shared/models/scheduling_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatefulWidget {
  final Scheduling scheduling;

  ListItem({Key? key, required this.scheduling}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
      ),
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Color.fromARGB(255, 185, 185, 185),
          width: 1.0,
        )),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.scheduling.person.nome,
            style: const TextStyle(
              color: Color.fromARGB(255, 33, 149, 243),
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
          const SizedBox(
            height: 7.0,
          ),
          Text(
            widget.scheduling.description,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            _formatDate(widget.scheduling.date),
          ),
        ],
      ),
    );
  }
}
