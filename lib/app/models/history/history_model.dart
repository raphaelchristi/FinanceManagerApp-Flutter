// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'history_model.g.dart';

///per month
@HiveType(typeId: 2)
class HistoryModel {
  @HiveField(0)
  final List<double> spentPerDay;
  @HiveField(1)
  final double objective;
  @HiveField(2)
  final double injury;

  HistoryModel({
    required this.spentPerDay,
    required this.objective,
    required this.injury,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'spentPerDay': spentPerDay,
      'objective': objective,
      'injury': injury,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      spentPerDay: List<double>.from(map['spentPerDay'] as List<double>),
      objective: map['objective'] as double,
      injury: map['injury'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) =>
      HistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
