import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/note_form/note_form_cubit.dart';
import 'custom_text_field.dart';

class NameFieldWidget extends StatelessWidget {
  NameFieldWidget({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormCubit, NoteFormState>(
      listenWhen: (p, c)=> p.isEditing != c.isEditing,
      listener: (context, state) {
        nameController.text = state.note.name.getOrCrash();
        print("7575${nameController.text}");
      },
      child: CustomTextFormField(
        inputType: TextInputType.text,
        controller: nameController,
        // labelText: state.note.name.getOrCrash(),
        hintText: NoteFormCubit.getInstance(context).state.isEditing
            ? ''
            : "Type Something....",
        onChanged: (value) {
          NoteFormCubit.getInstance(context).nameChanged(value);
        },
        validator: (_) {
          NoteFormCubit.getInstance(context).state.note.name.value.fold(
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
    );
  }
}
