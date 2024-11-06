import 'dart:convert';

import 'package:agendify/shared/models/scheduling_model.dart';
import 'package:agendify/shared/services/abstract_api.dart';
import 'package:agendify/shared/validators/validate_cpf.dart';

class StorageService extends AbstractApi<Scheduling> {
  StorageService(super._recurso, super.http);

  Future<List<Scheduling>> loadAgendas() async {
    var jsonList = await getAll();
    List<dynamic> list = jsonDecode(jsonList);

    List<Scheduling> agendas =
        list.map((json) => Scheduling.fromJson(json)).toList();

    return agendas;
  }

  Future<String> saveScheduling(Scheduling scheduling) async {
    if (scheduling.person.nome.length != 0 &&
        CPFValidator.isValid(scheduling.person.cpf) &&
        scheduling.description.length != 0) {
      var res = await create(scheduling);
      print(res);
      return res;
    }
    return '';
  }
}
