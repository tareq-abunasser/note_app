import 'dart:math';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:note_app/features/note/domain/repositories/i_note_repository.dart';
import 'package:note_app/routes/mobile_app_pages.dart';

import '../../../../core/size_config.dart';
import '../../../../injection.dart';
import '../../domain/entities/note.dart';
import '../cubit/note_form/note_form_cubit.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/note_form.dart';
import '../widgets/saving_in_progress_overlay.dart';

class NoteFormPage extends StatelessWidget {
  NoteFormPage({Key? key}) : super(key: key);
  Note? note;

  @override
  Widget build(BuildContext context) {
    dynamic argumentData = Get.arguments;
    if (argumentData != null) {
      note = argumentData[0];
    }

    return BlocProvider(
      lazy: false,
      create: (context) => NoteFormCubit(
        getIt<INoteRepository>(),
      )..initialized(initialNote: note),
      child: BlocConsumer<NoteFormCubit, NoteFormState>(
        listenWhen: (p, c) =>
            p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(
            () {},
            (either) {
              either.fold(
                (failure) {
                  FlushbarHelper.createError(
                    message: failure.maybeMap(
                      unableToCreate: (_) => "Couldn't create new note",
                      unableToUpdate: (_) =>
                          "Couldn't update the note. Was it deleted from another device?",
                      unexpected: (_) =>
                          'Unexpected error occurred, please contact support.',
                      orElse: () => 'Unknown error',
                    ),
                  ).show(context);
                },
                (_) => Get.offAndToNamed(MobileRoutes.HOME),
              );
            },
          );
        },
        buildWhen: (p, c) => p.isSaving != c.isSaving,
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              NoteFormScaffold(),
              SavingInProgressOverlay(isSaving: state.isSaving)
            ],
          );
        },
      ),
    );
  }
}
