import 'dart:convert';

import 'package:agendify/shared/models/scheduling_model.dart';
import 'package:agendify/shared/services/abstract_api.dart';

class StorageService extends AbstractApi<Scheduling> {
  StorageService(super._recurso);

  Future<List<Scheduling>> loadAgendas() async {
    var jsonList = await getAll();
    List<dynamic> list = jsonDecode(jsonList);

    List<Scheduling> agendas =
        list.map((json) => Scheduling.fromJson(json)).toList();

    return agendas;
  }

  //fazer o create validante cpf, nome null ,desc etc
}
