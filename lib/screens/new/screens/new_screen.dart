import 'package:agendify/screens/new/components/date_input_component.dart';
import 'package:agendify/screens/new/components/submit_buttom_component.dart';
import 'package:agendify/screens/new/components/text_input_component.dart';
import 'package:agendify/shared/models/person_model.dart';
import 'package:agendify/shared/models/scheduling_model.dart';
import 'package:agendify/shared/services/http_methods.dart';
import 'package:agendify/shared/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewScreen extends StatefulWidget {
  final Function(int) changePage;
  StorageService service = StorageService('agenda', HttpMethods());

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

  Scheduling createScheudling(
      String name, String cpf, String description, DateTime date) {
    Person person = Person(cpf, name);
    Scheduling scheduling = Scheduling(person, description, date);
    return scheduling;
  }

  void buttonClick() async {
    _formKey.currentState?.save();

    Scheduling newItem = createScheudling(name, cpf, description, date);
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
