import 'package:agendify/core/components/app_bar_component.dart';
import 'package:agendify/core/service/utils/formatters/date_formatter.dart';
import 'package:agendify/features/scheduling/presentation/components/date_input_component.dart';
import 'package:agendify/features/scheduling/presentation/components/list_item_component.dart';
import 'package:agendify/features/scheduling/presentation/components/submit_buttom_component.dart';
import 'package:agendify/features/scheduling/presentation/components/text_input_component.dart';
import 'package:agendify/features/scheduling/domain/person_entity.dart';
import 'package:agendify/features/scheduling/domain/scheduling_entity.dart';
import 'package:agendify/core/service/http_methods.dart';
import 'package:agendify/features/scheduling/data/scheduling_service.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewScreen extends StatefulWidget {
  final Function(int) changePage;
  SchedulingEntity? scheduling;
  SchedulingService service = SchedulingService('agenda', HttpMethods());

  NewScreen({Key? key, required this.changePage, this.scheduling})
      : super(key: key);

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateFormatter dateFormatter = DateFormatter();

  String name = '';
  String cpf = '';
  String description = '';
  DateTime date = DateTime.now();

  void changeDate(DateTime value) {
    setState(() {
      date = value;
      widget.scheduling!.date = date;
    });
  }

  void changeName(String value) {
    setState(() {
      name = value;
      widget.scheduling!.person.nome = name;
    });
  }

  void changeCpf(String value) {
    setState(() {
      cpf = value;
      widget.scheduling!.person.cpf = cpf;
    });
  }

  void changeDescription(String value) {
    setState(() {
      description = value;
      widget.scheduling!.description = description;
    });
  }

  SchedulingEntity createScheudling(
      String name, String cpf, String description, DateTime date) {
    PersonEntity person = PersonEntity(cpf, name);
    SchedulingEntity scheduling = SchedulingEntity(person, description, date);
    return scheduling;
  }

  void buttonClick() async {
    _formKey.currentState?.save();

    SchedulingEntity newItem = createScheudling(name, cpf, description, date);
    var saved = await widget.service.saveScheduling(newItem);
    widget.changePage(0);
    clearScheduling(widget.scheduling!);
  }

  void clearScheduling(SchedulingEntity scheduling) {
    scheduling.person.nome = '';
    scheduling.person.cpf = '';
    scheduling.description = '';
    scheduling.date = DateTime.now();
  }

  void initState() {
    if (widget.scheduling == null) {
      PersonEntity person = PersonEntity('', '');
      widget.scheduling = SchedulingEntity(person, '', date);
    }

    if (widget.scheduling!.id == null) {
      clearScheduling(widget.scheduling!);
    }
  }

  MaskTextInputFormatter cpfMask = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: 'Novo Agendamento'),
      body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1D1D29),
          ),
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              ListItem(scheduling: widget.scheduling!),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      TextInput(
                        label: 'Nome',
                        icon: Icons.person,
                        changeValue: changeName,
                        labelText: 'Nome',
                        hint: 'Seu Nome',
                      ),
                      TextInput(
                        label: 'CPF',
                        icon: Icons.person_search,
                        changeValue: changeCpf,
                        labelText: 'CPF',
                        hint: '000.000.00-00',
                        masks: [cpfMask],
                      ),
                      TextInput(
                        label: 'Descrição',
                        icon: Icons.description,
                        changeValue: changeDescription,
                        labelText: 'Descrição',
                        hint: 'Realizar extração de siso...',
                      ),
                      DateInput(
                        date: date,
                        changeDate: changeDate,
                        label: 'Data da consulta',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SubmitButton(
                        click: buttonClick,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
