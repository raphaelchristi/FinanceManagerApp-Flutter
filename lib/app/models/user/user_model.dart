// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final double? salary;
  @HiveField(2)
  final double? reservation;

  UserModel({
    this.name,
    this.salary,
    this.reservation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'salary': salary,
      'reservation': reservation,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      salary: map['salary'] as double,
      reservation: map['reservation'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? name,
    double? salary,
    double? reservation,
  }) {
    return UserModel(
      name: name ?? this.name,
      salary: salary ?? this.salary,
      reservation: reservation ?? this.reservation,
    );
  }
}
