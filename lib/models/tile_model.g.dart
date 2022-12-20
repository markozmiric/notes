// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TileModelAdapter extends TypeAdapter<TileModel> {
  @override
  final int typeId = 0;

  @override
  TileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TileModel(
      title: fields[0] as String,
      shortDescription: fields[1] as String,
      description: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TileModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.shortDescription)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
