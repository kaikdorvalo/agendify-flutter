import 'package:agendify/shared/models/person_model.dart';

class Scheduling {
  Person person;
  String description;
  DateTime date;

  Scheduling(this.person, this.description, this.date);

  Map<String, dynamic> toJson() {
    return {
      'name': person.nome,
      'cpf': person.cpf,
      'description': description,
      'date': date.toIso8601String(),
    };
  }

  factory Scheduling.fromJson(Map<String, dynamic> json) {
    Person person = Person(json['cpf'], json['name']);
    Scheduling scheduling = Scheduling(
      person,
      json['description'],
      DateTime.parse(json['date']),
    );
    return scheduling;
  }
}
