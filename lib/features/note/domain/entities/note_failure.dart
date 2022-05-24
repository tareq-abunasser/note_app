import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_failure.freezed.dart';

@freezed
abstract class NoteFailure with _$NoteFailure {
  const factory NoteFailure.unexpected() = _Unexpected;
  const factory NoteFailure.unableToUpdate() = _UnableToUpdate;
  const factory NoteFailure.unableToCreate() = _UnableToCreate;
  const factory NoteFailure.unableToDelete() = _UnableToDelete;
  const factory NoteFailure.unableToWatchAll() = _UnableToWatchAll;

}
