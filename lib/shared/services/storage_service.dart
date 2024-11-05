import 'package:agendify/shared/models/scheduling_model.dart';
import 'package:agendify/shared/services/abstract_api.dart';

class StorageService extends AbstractApi<Scheduling> {
  StorageService(super._recurso);
}

// final LocalStorage storage = LocalStorage('app_agenda');

// Future<void> saveAgenda(List<dynamic> items) async {
//   await storage.ready;
//   storage.setItem('agendas', items);
// }

// Future<List<dynamic>> getAgendas() async {
//   await storage.ready;
//   return storage.getItem('agendas') ?? [];
// }

// Future<void> clearStorage() async {
//   await storage.ready;

//   return storage.clear();
// }
