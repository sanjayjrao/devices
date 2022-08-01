// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
import 'package:devices/db/model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<UnitModel1>> unitListNotifier1 = ValueNotifier([]);

Future<void> addUnit1(UnitModel1 value) async {
  final unitDB = await Hive.openBox<UnitModel1>('unit_db');
  final _id = await unitDB.add(value);
  value.id = _id;
  await unitDB.put(value.id, value);
  unitListNotifier1.value.add(value);
  unitListNotifier1.notifyListeners();
}

Future<void> getAllUnits() async {
  final unitDB = await Hive.openBox<UnitModel1>('unit_db');
  unitListNotifier1.value.clear();
  unitListNotifier1.value.addAll(unitDB.values);
  unitListNotifier1.notifyListeners();
}

Future<void> updateUnit(int updateid, value) async {
  final unitDB = await Hive.openBox<UnitModel1>('unit_db');
  unitDB.put(updateid, value);
  // print('update $id');
  getAllUnits();
}

Future<void> updateAt() async{
  
}

UnitModel1? getitem(int getid) {
  final unitDB = Hive.box<UnitModel1>('unit_db');
  final item = unitDB.getAt(getid);
  return item;
}

Future<void> deleteUnit(int deleteid) async {
  final unitDB = await Hive.openBox<UnitModel1>('unit_db');
  unitDB.delete(deleteid);
  getAllUnits();
}
