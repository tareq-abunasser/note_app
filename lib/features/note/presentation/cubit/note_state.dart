part of 'note_cubit.dart';

@freezed
class NoteState with _$NoteState {
  const factory NoteState.initial() = _Initial;
  const factory NoteState.loadInProgress() = _LoadInProgress;
  const factory NoteState.loadSuccess(List<Note> notes) = _LoadSuccess;
  const factory NoteState.loadFailure(NoteFailure noteFailure) =
  _LoadFailure;
}

