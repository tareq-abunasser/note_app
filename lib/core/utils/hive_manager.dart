import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/note/data/models/note_dtos.dart';

@Singleton()
class HiveManager {
   Box<NoteDTO>? _box;

  Future<void> init() async {
    print("intiate");
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter((appDocumentDirectory.path));
    Hive.registerAdapter(NoteDTOAdapter());
    _box = await Hive.openBox<NoteDTO>('note');
    print(_box);
  }

  Box<NoteDTO>? get noteBox => _box;
}
