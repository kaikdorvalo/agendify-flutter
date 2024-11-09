import 'dart:convert';

import 'package:agendify/features/scheduling/domain/scheduling_entity.dart';
import 'package:agendify/core/service/abstract/abstract_api.dart';
import 'package:agendify/core/service/utils/validators/validate_cpf.dart';
import 'package:http/http.dart';

class SchedulingService extends AbstractApi<SchedulingEntity> {
  SchedulingService(super._recurso, super.http);

  Future<List<SchedulingEntity>> loadAgendas() async {
    var jsonList = await getAll();
    List<dynamic> list = jsonDecode(jsonList);

    List<SchedulingEntity> agendas =
        list.map((json) => SchedulingEntity.fromJson(json)).toList();

    return agendas;
  }

  Future<String> saveScheduling(SchedulingEntity scheduling) async {
    if (scheduling.person.nome.isNotEmpty &&
        CPFValidator.isValid(scheduling.person.cpf) &&
        scheduling.description.isNotEmpty) {
      var res = await create(scheduling);
      return res;
    }
    return '';
  }

  Future<Response> updateScheduling(SchedulingEntity scheduling) async {
    if (_validateScheduling(scheduling)) {
      if (scheduling.id != null && scheduling.id != '') {
        var res = await update(scheduling.id!, scheduling);
        return res;
      }
    }
    return Response('', 404);
  }

  Future<Response> deleteScheduling(String id) async {
    var res = await remove(id);
    return res;
  }

  bool _validateScheduling(SchedulingEntity scheduling) {
    return ((scheduling.person.nome.isNotEmpty &&
        CPFValidator.isValid(scheduling.person.cpf) &&
        scheduling.description.isNotEmpty));
  }
}
