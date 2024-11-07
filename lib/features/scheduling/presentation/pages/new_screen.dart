import 'package:agendify/core/components/app_bar_component.dart';
import 'package:agendify/features/scheduling/presentation/components/date_input_component.dart';
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
  SchedulingService service = SchedulingService('agenda', HttpMethods());

  NewScreen({Key? key, required this.changePage}) : super(key: key);

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  String cpf = '';
  String description = '';
  DateTime date = DateTime.now();

  void changeDate(DateTime value) {
    setState(() {
      date = value;
    });
  }

  void changeName(String value) {
    setState(() {
      name = value;
    });
  }

  void changeCpf(String value) {
    setState(() {
      cpf = value;
    });
  }

  void changeDescription(String value) {
    setState(() {
      description = value;
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
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20.0),
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
                const SizedBox(
                  height: 15.0,
                ),
                TextInput(
                  label: 'CPF',
                  icon: Icons.person_search,
                  changeValue: changeCpf,
                  labelText: 'CPF',
                  hint: '000.000.00-00',
                  masks: [cpfMask],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextInput(
                  label: 'Descrição',
                  icon: Icons.description,
                  changeValue: changeDescription,
                  labelText: 'Descrição',
                  hint: 'Realizar extração de siso...',
                ),
                const SizedBox(
                  height: 15.0,
                ),
                DateInput(
                  date: date,
                  changeDate: changeDate,
                  label: 'Data da consulta',
                ),
                const SizedBox(
                  height: 35.0,
                ),
                SubmitButton(
                  click: buttonClick,
                ),
              ],
            )),
      ),
    );
  }
}
