import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/note.dart';
import '../../domain/entities/note_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/repositories/i_note_repository.dart';

part 'note_state.dart';

part 'note_cubit.freezed.dart';

// @injectable
class NoteCubit extends Cubit<NoteState> {
  final INoteRepository _iNoteRepository;

  NoteCubit(this._iNoteRepository) : super(const NoteState.initial());

  static NoteCubit getInstance(context) {
    return BlocProvider.of(context);
  }

  watchAllNotes() async {
    emit(const NoteState.loadInProgress());
    _iNoteRepository.watchAll().then((failureOrNotes) {
      failureOrNotes.fold((failure) {
        emit(NoteState.loadFailure(failure));
      }, (notes) {
        emit(NoteState.loadSuccess(notes));
      });
    });
  }
}
