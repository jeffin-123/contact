// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveContactAdapter extends TypeAdapter<HiveContact> {
  @override
  final int typeId = 0;

  @override
  HiveContact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveContact(
      givenName: fields[0] as String,
      familyName: fields[1] as String,
      company: fields[2] as String,
      phones: fields[3] as String,
      emails: fields[4] as String,
      isFavorite: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HiveContact obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.givenName)
      ..writeByte(1)
      ..write(obj.familyName)
      ..writeByte(2)
      ..write(obj.company)
      ..writeByte(3)
      ..write(obj.phones)
      ..writeByte(4)
      ..write(obj.emails)
      ..writeByte(5)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
