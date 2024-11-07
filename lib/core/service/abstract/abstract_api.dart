import 'dart:convert';

import 'package:agendify/core/service/http_methods.dart';

abstract class AbstractApi<T> {
  final String urlLocalHost = "http://localhost:3000";

  String _recurso;
  HttpMethods http;

  AbstractApi(
    this._recurso,
    HttpMethods this.http,
  );

  Future<String> getAll() async {
    var response = await http.get(Uri.parse("$urlLocalHost/$_recurso"));
    final decoded = utf8.decode(response.bodyBytes);
    return decoded;
  }

  Future<String> create(dynamic data) async {
    var response =
        await http.post(Uri.parse("$urlLocalHost/$_recurso"), jsonEncode(data));
    return response.body;
  }

  Future<String> deleteS(String id) async {
    var response = await http.delete(Uri.parse("$urlLocalHost/$_recurso/$id"));
    return response.body;
  }

  Future<String> update(String id, dynamic body) async {
    var response = await http.put(
        Uri.parse("$urlLocalHost/$_recurso/$id"), jsonEncode(body));
    return response.body;
  }
}
