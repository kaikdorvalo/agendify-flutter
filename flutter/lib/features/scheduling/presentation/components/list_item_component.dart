import 'package:agendify/features/scheduling/domain/scheduling_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListItem extends StatefulWidget {
  final SchedulingEntity scheduling;
  final Function(String?)? deleteScheduling;
  final Function(SchedulingEntity)? editScheduling;

  ListItem({
    Key? key,
    required this.scheduling,
    this.deleteScheduling,
    this.editScheduling,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  bool showButtons() {
    if (widget.scheduling.id != null &&
        widget.scheduling.id != '' &&
        widget.editScheduling != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF2B2A38),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
                top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.scheduling.person.nome,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Visibility(
                      visible: showButtons(),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xFFF63536),
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: const Icon(
                                    Icons.delete,
                                    color: Color(0xFFC2D1D0),
                                    size: 15.0,
                                  ),
                                  onTap: () {
                                    if (widget.deleteScheduling != null) {
                                      widget.deleteScheduling!(
                                          widget.scheduling.id);
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xFF2194F2),
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: const Icon(
                                    Icons.edit,
                                    color: Color(0xFFC2D1D0),
                                    size: 15.0,
                                  ),
                                  onTap: () {
                                    if (widget.editScheduling != null) {
                                      widget.editScheduling!(widget.scheduling);
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: const Color(0xFF343340),
                        child: Text(
                          widget.scheduling.description,
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFF0060AE),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _formatDate(widget.scheduling.date),
                        style: const TextStyle(color: Colors.white),
                      ),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
