// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/utils/hive_manager.dart' as _i3;
import 'features/note/data/datasources/note_local_data_source.dart' as _i4;
import 'features/note/data/repositories/note_repository.dart' as _i6;
import 'features/note/domain/repositories/i_note_repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.HiveManager>(_i3.HiveManager());
  gh.lazySingleton<_i4.NoteLocalDataSource>(
      () => _i4.NoteLocalDataSourceImpl(get<_i3.HiveManager>()));
  gh.lazySingleton<_i5.INoteRepository>(
      () => _i6.NoteRepository(get<_i4.NoteLocalDataSource>()));
  return get;
}
