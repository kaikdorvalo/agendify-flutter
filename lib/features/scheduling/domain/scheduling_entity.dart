import 'package:agendify/features/scheduling/domain/person_entity.dart';

class SchedulingEntity {
  PersonEntity person;
  String description;
  DateTime date;

  SchedulingEntity(this.person, this.description, this.date);

  Map<String, dynamic> toJson() {
    return {
      'name': person.nome,
      'cpf': person.cpf,
      'description': description,
      'date': date.toIso8601String(),
    };
  }

  factory SchedulingEntity.fromJson(Map<String, dynamic> json) {
    PersonEntity person = PersonEntity(json['cpf'], json['name']);
    SchedulingEntity scheduling = SchedulingEntity(
      person,
      json['description'],
      DateTime.parse(json['date']),
    );
    return scheduling;
  }
}
