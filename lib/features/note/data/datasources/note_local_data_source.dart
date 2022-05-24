import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:note_app/features/note/data/models/note_dtos.dart';

import '../../../../core/entities/exceptions.dart';
import '../../../../core/utils/hive_manager.dart';

abstract class NoteLocalDataSource {
  Future<List<NoteDTO>> watchAll();

  Future<void> create(NoteDTO note);

  Future<void> update(NoteDTO note);

  Future<void> delete(String noteId);
}

@LazySingleton(as: NoteLocalDataSource)
class NoteLocalDataSourceImpl extends NoteLocalDataSource {
  final HiveManager _hiveManager;

  NoteLocalDataSourceImpl(this._hiveManager);

  @override
  Future<void> create(NoteDTO note) async {
    try {
      _hiveManager.noteBox!.put(note.id, note);
    } catch (e) {
      print(e);
      throw CacheException();
    }
  }

  @override
  Future<void> delete(String noteId) async {
    try {
      _hiveManager.noteBox!.delete(noteId);
    } catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<void> update(NoteDTO note) async {
    try {
      _hiveManager.noteBox!.put(note.id, note);
    } catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<List<NoteDTO>> watchAll() async {
    try {
      return await _hiveManager.noteBox!.values.toList();
    } catch (_) {
      throw CacheException();
    }
  }
}
