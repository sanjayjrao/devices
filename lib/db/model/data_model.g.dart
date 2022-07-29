// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnitModel1Adapter extends TypeAdapter<UnitModel1> {
  @override
  final int typeId = 1;

  @override
  UnitModel1 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnitModel1(
      name: fields[1] as dynamic,
      prereading: fields[2] as String?,
      presentreading: fields[3] as String?,
      status: fields[4] as String?,
      balanceHrs: fields[5] as String?,
      type: fields[6] as String?,
      id: fields[0] as dynamic,
      airPressure: fields[7] as String?,
      airendTemperature: fields[8] as String?,
      motorCurrent: fields[9] as String?,
      checkedBy: fields[10] as String?,
      replacementDate: fields[11] as String?,
      runningHours: fields[12] as String?,
      nextService: fields[13] as String?,
      servicedBy: fields[14] as String?,
      description: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UnitModel1 obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.prereading)
      ..writeByte(3)
      ..write(obj.presentreading)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.balanceHrs)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.airPressure)
      ..writeByte(8)
      ..write(obj.airendTemperature)
      ..writeByte(9)
      ..write(obj.motorCurrent)
      ..writeByte(10)
      ..write(obj.checkedBy)
      ..writeByte(11)
      ..write(obj.replacementDate)
      ..writeByte(12)
      ..write(obj.runningHours)
      ..writeByte(13)
      ..write(obj.nextService)
      ..writeByte(14)
      ..write(obj.servicedBy)
      ..writeByte(15)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitModel1Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
