// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BarrowedDataAdapter extends TypeAdapter<BarrowedData> {
  @override
  final int typeId = 1;

  @override
  BarrowedData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BarrowedData(
      id: fields[0] as int,
      name: fields[1] as String,
      interestRate: fields[3] as double,
      amount: fields[4] as double,
      date: fields[5] as DateTime,
      interestAmount: fields[7] as double,
      totalAmount: fields[8] as double,
      amountPaidBack: fields[6] as double,
      phoneNumber: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BarrowedData obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.interestRate)
      ..writeByte(4)
      ..write(obj.amount)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.amountPaidBack)
      ..writeByte(7)
      ..write(obj.interestAmount)
      ..writeByte(8)
      ..write(obj.totalAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BarrowedDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
