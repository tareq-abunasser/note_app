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
    /// if name has error then we will can't able to pressed in login button
    /// this happen will the user write his name
    /// onChange method , any change in textFormField will emit the state
    print("1 ${state.note}");
    emit(state.copyWith(
      note: state.note.copyWith(name: NoteName(name)),

      /// We have to reset the authFailureOrSuccessOption field whenever we emit a new state.
      /// This field holds a "response" from the previous call to login using usecase.
      /// Surely, when the name changes, it's not correct to associate the old "auth response" with the updated name.
      saveFailureOrSuccessOption: none(),
    ));
    print("2 ${state.note}");
  }

  bodyChanged(String body) {
    /// if password has error then we will can't able to pressed in sign in or register button

    /// this happen will the user write his password
    /// onChange method , any change in textFormField will emit the state

    emit(state.copyWith(
      note: state.note.copyWith(body: NoteBody(body)),
      saveFailureOrSuccessOption: none(),
    ));
    print("4 ${state.note}");
  }

  colorChanged(Color color) {
    /// if password has error then we will can't able to pressed in sign in or register button

    /// this happen will the user write his password
    /// onChange method , any change in textFormField will emit the state
    print("5 ${state.note}");

    emit(state.copyWith(
      note: state.note.copyWith(color: NoteColor(color)),
      saveFailureOrSuccessOption: none(),
    ));
    print("6 ${state.note}");
  }

  showErrorMessages() {
    print("7 ${state.note}");

    emit(state.copyWith(
      showErrorMessages: true,
      saveFailureOrSuccessOption: none(),
    ));
    print("8 ${state.note}");
  }

  save() async {
    print("9 ${state.note}}");

    Either<NoteFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(
      isSaving: true,
      saveFailureOrSuccessOption: none(),
    ));

    if (state.note.failureOption.isNone()) {
      failureOrSuccess = state.isEditing
          ? await _iNoteRepository.update(state.note)
          : await _iNoteRepository.create(state.note);
    }

    /// failureOrSuccess may be null because it's value determinate in if statement
    /// if the condition not satisfied it will not enter if statement this will make it null
    /// optionOf is equivalent to:
    /// failureOrSuccess == null ? none() : some(failureOrSuccess)
    emit(state.copyWith(
        isSaving: false,
        showErrorMessages: true,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess)));

    print("10 ${state.note}");
  }

  delete() async {
    print("11 ${state.note}}");

    Either<NoteFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(
      isSaving: true,
      saveFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _iNoteRepository.delete(state.note.id);

    /// failureOrSuccess may be null because it's value determinate in if statement
    /// if the condition not satisfied it will not enter if statement this will make it null
    /// optionOf is equivalent to:
    /// failureOrSuccess == null ? none() : some(failureOrSuccess)
    emit(state.copyWith(
        isSaving: false,
        showErrorMessages: true,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess)));

    print("12 ${state.note}");
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
