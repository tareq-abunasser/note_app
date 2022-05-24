// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dtos.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteDTOAdapter extends TypeAdapter<_$_NoteDTO> {
  @override
  final int typeId = 1;

  @override
  _$_NoteDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_NoteDTO(
      id: fields[0] as String,
      name: fields[1] as String,
      body: fields[2] as String,
      colorIndex: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_NoteDTO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(3)
      ..write(obj.colorIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
