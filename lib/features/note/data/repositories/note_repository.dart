import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:note_app/core/entities/exceptions.dart';
import 'package:note_app/features/note/data/datasources/note_local_data_source.dart';
import 'package:note_app/features/note/data/models/note_dtos.dart';
import 'package:note_app/features/note/domain/entities/note.dart';
import 'package:note_app/features/note/domain/entities/note_failure.dart';
import 'package:note_app/features/note/domain/repositories/i_note_repository.dart';

import '../../domain/entities/value_objects.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final NoteLocalDataSource _noteLocalDataSourceImpl;

  NoteRepository(
    this._noteLocalDataSourceImpl,
  );

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) async{
    try {
       await _noteLocalDataSourceImpl.create(NoteDTO.fromDomain(note));
      return right(unit);
    } on CacheException {
      return left(const NoteFailure.unableToCreate());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(UniqueId noteId) async{
    try {
      await _noteLocalDataSourceImpl.delete(noteId.getOrCrash());
      return right(unit);
    } on CacheException {
      return left(const NoteFailure.unableToDelete());
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async{
    try {
      await _noteLocalDataSourceImpl.update(NoteDTO.fromDomain(note));
      return right(unit);
    } on CacheException {
      return left(const NoteFailure.unableToDelete());
    }
  }

  @override
  Future<Either<NoteFailure, List<Note>>> watchAll() async{
    try {
     List<NoteDTO> notesDTO = await _noteLocalDataSourceImpl.watchAll();
     List<Note> notes =notesDTO.map((e) => e.toDomain()).toList();
      return right(notes);
    } on CacheException {
      return left(const NoteFailure.unableToWatchAll());
    }
  }
}
