// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:hive/hive.dart';
part 'data_model.g.dart';

// class UnitModel {
//   final String name;
//   final String type;

//   UnitModel({required this.name, required this.type});
// }

@HiveType(typeId: 0)
class UnitModel1 {
  @HiveField(0)
  var id;

  @HiveField(1)
  var name;

  @HiveField(2)
  final String? prereading;

  @HiveField(3)
  final String? presentreading;

  @HiveField(4)
  final String? status;

  @HiveField(5)
  final String? balanceHrs;

  @HiveField(6)
  final String? type;

  @HiveField(7)
  final String? airPressure;

  @HiveField(8)
  final String? airendTemperature;

  @HiveField(9)
  final String? motorCurrent;

  @HiveField(10)
  final String? checkedBy;

  @HiveField(11)
  final String? replacementDate;

  @HiveField(12)
  final String? runningHours;

  @HiveField(13)
  final String? nextService;

  @HiveField(14)
  final String? servicedBy;

  @HiveField(15)
  final String? description;

  @override
  String toString() {
    return '$name';
  }

  UnitModel1({
    required this.name,
    this.prereading,
    this.presentreading,
    this.status,
    this.balanceHrs,
    this.type,
    this.id,
    this.airPressure = '',
    this.airendTemperature = '',
    this.motorCurrent = '',
    this.checkedBy = '',
    this.replacementDate,
    this.runningHours,
    this.nextService,
    this.servicedBy,
    this.description,
  });
}
