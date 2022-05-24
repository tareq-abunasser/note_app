import 'package:dartz/dartz.dart';
import 'package:note_app/features/note/domain/entities/value_objects.dart';

import '../entities/note.dart';
import '../entities/note_failure.dart';

abstract class INoteRepository {
  Future<Either<NoteFailure, List<Note>>> watchAll();
  Future<Either<NoteFailure, Unit>> create(Note note);
  Future<Either<NoteFailure, Unit>> update(Note note);
  Future<Either<NoteFailure, Unit>> delete(UniqueId noteId);
}
