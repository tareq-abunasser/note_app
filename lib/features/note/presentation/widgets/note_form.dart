import 'package:another_flushbar/flushbar_helper.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:note_app/features/note/presentation/cubit/note_form/note_form_cubit.dart';
import 'package:note_app/features/note/presentation/widgets/custom_text_field.dart';

import '../../../../core/size_config.dart';
import '../../../../routes/mobile_app_pages.dart';
import '../../domain/entities/note.dart';
import 'custom_modal_bottom_sheet.dart';
import 'name_field_widget.dart';
import 'saving_in_progress_overlay.dart';

class NoteFormScaffold extends StatelessWidget {
  NoteFormScaffold({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormCubit, NoteFormState>(
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: NoteFormCubit.getInstance(context)
                .state
                .note
                .color
                .getOrCrash(),
            automaticallyImplyLeading: false,
            title: BlocBuilder<NoteFormCubit, NoteFormState>(
                buildWhen: (p, c) => p.isEditing != c.isEditing,
                builder: (context, state) {
                  return CustomText(
                      text: state.isEditing ? 'Edit Note' : 'New Note');
                }),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.toNamed(MobileRoutes.HOME),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!
                        .showBottomSheet((BuildContext context) {
                      return NoteFormCubit.getInstance(context).state.isEditing
                          ? const CustomModalBottomSheetForEditing()
                          : const CustomModalBottomSheetForNewNotes();
                    });
                  },
                  icon: const Icon(Icons.more_vert_outlined)),
              IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      NoteFormCubit.getInstance(context).save();
                    }
                  },
                  icon: const Icon(Icons.check)),
            ],
          ),
          body: BlocBuilder<NoteFormCubit, NoteFormState>(
            buildWhen: (p, c) =>
                (p.showErrorMessages != c.showErrorMessages) |
                (p.isEditing != c.isEditing),
            builder: (context, state) {
              nameController.text = state.note.name.getOrCrash();
              bodyController.text = state.note.body.getOrCrash();
              return Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        inputType: TextInputType.text,
                        controller: nameController,
                        hintText:
                            NoteFormCubit.getInstance(context).state.isEditing
                                ? ''
                                : "Type Something....",
                        onChanged: (value) {
                          NoteFormCubit.getInstance(context).nameChanged(value);
                        },
                        validator: (_) {
                          NoteFormCubit.getInstance(context)
                              .state
                              .note
                              .name
                              .value
                              .fold(
                                (f) => f.maybeMap(
                                  empty: (_) => 'empty name',
                                  exceedingLength: (_) =>
                                      "you exceeding the allowed length :1000 character",
                                  orElse: () => null,
                                ),
                                (r) => null,
                              );
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      CustomTextFormField(
                        inputType: TextInputType.text,
                        controller: bodyController,
                        hintText: state.isEditing ? '' : "Type Something....",
                        onChanged: (value) {
                          NoteFormCubit.getInstance(context).bodyChanged(value);
                        },
                        validator: (_) {
                          NoteFormCubit.getInstance(context)
                              .state
                              .note
                              .body
                              .value
                              .fold(
                                (f) => f.maybeMap(
                                  empty: (_) => 'empty name',
                                  // defaultValue: (_)=> 'change default value',
                                  exceedingLength: (_) =>
                                      "you exceeding the allowed length :1000 character",
                                  orElse: () => null,
                                ),
                                (r) => null,
                              );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
