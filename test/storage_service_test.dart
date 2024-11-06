import 'dart:convert';

import 'package:agendify/shared/models/person_model.dart';
import 'package:agendify/shared/models/scheduling_model.dart';
import 'package:agendify/shared/services/http_methods.dart';
import 'package:agendify/shared/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

final class HttpMethodsMock extends Mock implements HttpMethods {}

void main() {
  test('Use case: Get all scheduling', () async {
    HttpMethodsMock httpMock = HttpMethodsMock();
    StorageService service = StorageService('agenda', httpMock);

    final jsonList = jsonEncode([
      {
        "id": "c05e",
        "name": "Kaik",
        "cpf": "234.123.444-55",
        "description": "Realizar extração de siso",
        "date": "2024-11-04T22:05:11.902"
      },
      {
        "id": "904c",
        "name": "Vitor",
        "cpf": "345.325.567-77",
        "description": "Realizar extração de siso",
        "date": "2024-11-04T22:05:11.902"
      },
    ]);

    final response = http.Response(jsonList, 200);

    when(() => httpMock.get(Uri.parse('http://localhost:3000/agenda')))
        .thenAnswer((_) async => response);

    var res = await service.loadAgendas();

    expect(res[0].person.nome, "Kaik");
    expect(res[1].person.nome, "Vitor");
  });

  test("Use case: Save Scheduling", () async {
    HttpMethodsMock httpMock = HttpMethodsMock();
    StorageService service = StorageService('agenda', httpMock);

    Person person = Person('876.618.400-22', 'Kaik');
    Scheduling scheduling = Scheduling(person, 'Extrair siso', DateTime.now());

    final json = jsonEncode(
      {
        "id": "904c",
        "name": "Vitor",
        "cpf": "345.325.567-77",
        "description": "Realizar extração de siso",
        "date": "2024-11-04T22:05:11.902"
      },
    );

    final response = http.Response(json, 200);

    when(() => httpMock.post(Uri.parse('http://localhost:3000/agenda'),
        jsonEncode(scheduling.toJson()))).thenAnswer((_) async => response);

    var res = await service.saveScheduling(scheduling);

    expect(res, isNotNull);
  });

  test("Use case: don't save Scheduling if person name is empty", () async {
    HttpMethodsMock httpMock = HttpMethodsMock();
    StorageService service = StorageService('agenda', httpMock);

    Person person = Person('876.618.400-22', '');
    Scheduling scheduling = Scheduling(person, 'Extrair siso', DateTime.now());

    final json = jsonEncode(
      {
        "id": "904c",
        "name": "Vitor",
        "cpf": "345.325.567-77",
        "description": "Realizar extração de siso",
        "date": "2024-11-04T22:05:11.902"
      },
    );

    final response = http.Response(json, 200);

    when(() => httpMock.post(Uri.parse('http://localhost:3000/agenda'),
        jsonEncode(scheduling.toJson()))).thenAnswer((_) async => response);

    var res = await service.saveScheduling(scheduling);

    expect(res, '');
  });

  test("Use case: don't save Scheduling if description is empty", () async {
    HttpMethodsMock httpMock = HttpMethodsMock();
    StorageService service = StorageService('agenda', httpMock);

    Person person = Person('876.618.400-22', 'Kaik');
    Scheduling scheduling = Scheduling(person, '', DateTime.now());

    final json = jsonEncode(
      {
        "id": "904c",
        "name": "Vitor",
        "cpf": "345.325.567-77",
        "description": "Realizar extração de siso",
        "date": "2024-11-04T22:05:11.902"
      },
    );

    final response = http.Response(json, 200);

    when(() => httpMock.post(Uri.parse('http://localhost:3000/agenda'),
        jsonEncode(scheduling.toJson()))).thenAnswer((_) async => response);

    var res = await service.saveScheduling(scheduling);

    expect(res, '');
  });

  test("Use case: don't save Scheduling when is not valid cpf", () async {
    HttpMethodsMock httpMock = HttpMethodsMock();
    StorageService service = StorageService('agenda', httpMock);

    Person person = Person('871.618.400-22', 'Kaik');
    Scheduling scheduling = Scheduling(person, 'Extrair siso', DateTime.now());

    final json = jsonEncode(
      {
        "id": "904c",
        "name": "Vitor",
        "cpf": "345.321.567-77",
        "description": "Realizar extração de siso",
        "date": "2024-11-04T22:05:11.902"
      },
    );

    final response = http.Response(json, 200);

    when(() => httpMock.post(Uri.parse('http://localhost:3000/agenda'),
        jsonEncode(scheduling.toJson()))).thenAnswer((_) async => response);

    var res = await service.saveScheduling(scheduling);

    expect(res, '');
  });
}
