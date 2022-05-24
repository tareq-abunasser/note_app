import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/entities/failures.dart';
import 'value_objects.dart';

part 'note.freezed.dart';

@freezed
abstract class Note implements _$Note {
  const Note._();

  const factory Note({
    required UniqueId id,
    required NoteName name,
    required NoteBody body,
    required NoteColor color,
  }) = _Note;

  factory Note.empty() => Note(
        id: UniqueId(),
        name: NoteName(""),
        body: NoteBody(""),
        color: NoteColor(NoteColor.predefinedColors[0]),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit
        .andThen(body.failureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
