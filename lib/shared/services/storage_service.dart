import 'package:localstorage/localstorage.dart';

class StorageService {
  final LocalStorage storage = LocalStorage('app_agenda');

  Future<void> saveAgenda(List<dynamic> items) async {
    await storage.ready;
    storage.setItem('agendas', items);
  }

  Future<List<dynamic>> getAgendas() async {
    await storage.ready;
    return storage.getItem('agendas') ?? [];
  }

  Future<void> clearStorage() async {
    await storage.ready;

    return storage.clear();
  }
}
