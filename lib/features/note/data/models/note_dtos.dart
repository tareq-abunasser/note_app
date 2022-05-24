import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/entities/note.dart';
import '../../domain/entities/value_objects.dart';

part 'note_dtos.freezed.dart';

part 'note_dtos.g.dart';

@freezed
abstract class NoteDTO  extends HiveObject implements  _$NoteDTO {

  @HiveType(typeId: 1, adapterName: 'NoteDTOAdapter')
  factory NoteDTO({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String body,
    @HiveField(3) required int colorIndex,
  }) = _NoteDTO;

  // @HiveType(typeId: 1, adapterName: 'NoteDTOAdapter')
  //  factory NoteDTO({
  //   @JsonKey(ignore: true) String? id,
  //   @HiveField(0) required String name,
  //   @HiveField(1) required String body,
  //   @HiveField(2) required Color color,
  // }) = _NoteDTO;

  factory NoteDTO.fromDomain(Note note) {
    return NoteDTO(
        id: note.id.getOrCrash(),
        name: note.name.getOrCrash(),
        body: note.body.getOrCrash(),
        colorIndex: NoteColor.predefinedColors.indexOf(note.color.getOrCrash()));
  }

  factory NoteDTO.empty() {
    return NoteDTO(
      id: "",
      name: "",
      body: "",
      colorIndex: 0,
    );
  }

  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id),
      name: NoteName(name),
      body: NoteBody(body),
      color: NoteColor(NoteColor.predefinedColors[colorIndex]),
    );
  }
   NoteDTO._();

}
