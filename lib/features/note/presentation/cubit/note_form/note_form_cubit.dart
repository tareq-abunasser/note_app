import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:note_app/features/note/domain/repositories/i_note_repository.dart';

import '../../../domain/entities/note.dart';
import '../../../domain/entities/note_failure.dart';
import '../../../domain/entities/value_objects.dart';

part 'note_form_state.dart';

part 'note_form_cubit.freezed.dart';

// @injectable
class NoteFormCubit extends Cubit<NoteFormState> {
  final INoteRepository _iNoteRepository;

  NoteFormCubit(this._iNoteRepository) : super(NoteFormState.initial());

  static NoteFormCubit getInstance(context) {
    return BlocProvider.of(context);
  }

  initialized({Note? initialNote}) {
    if (initialNote != null) {
      emit(state.copyWith(
        note: initialNote,
        isEditing: true,
      ));
    }
  }

  nameChanged(String name) {
    emit(state.copyWith(
      note: state.note.copyWith(name: NoteName(name)),
      saveFailureOrSuccessOption: none(),
    ));
  }

  bodyChanged(String body) {
    emit(state.copyWith(
      note: state.note.copyWith(body: NoteBody(body)),
      saveFailureOrSuccessOption: none(),
    ));
  }

  colorChanged(Color color) {
    emit(state.copyWith(
      note: state.note.copyWith(color: NoteColor(color)),
      saveFailureOrSuccessOption: none(),
    ));
  }

  showErrorMessages() {
    emit(state.copyWith(
      showErrorMessages: true,
      saveFailureOrSuccessOption: none(),
    ));
  }

  save() async {
    Either<NoteFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(
      isSaving: true,
      saveFailureOrSuccessOption: none(),
    ));
    // await Future.delayed(Duration(seconds: 5));
    if (state.note.failureOption.isNone()) {
      failureOrSuccess = state.isEditing
          ? await _iNoteRepository.update(state.note)
          : await _iNoteRepository.create(state.note);
    }
    emit(state.copyWith(
        isSaving: false,
        showErrorMessages: true,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess)));
  }

  delete() async {
    Either<NoteFailure, Unit>? failureOrSuccess;
    emit(state.copyWith(
      isSaving: true,
      saveFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _iNoteRepository.delete(state.note.id);
    emit(state.copyWith(
        isSaving: false,
        showErrorMessages: true,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess)));
  }

  duplicate() async {
    Either<NoteFailure, Unit>? failureOrSuccess;
    emit(state.copyWith(
      isSaving: true,
      saveFailureOrSuccessOption: none(),
    ));

    if (state.note.failureOption.isNone()) {
      failureOrSuccess =
          await _iNoteRepository.create(state.note.copyWith(id: UniqueId()));
    }

    emit(state.copyWith(
        isSaving: false,
        showErrorMessages: true,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess)));
  }
}
