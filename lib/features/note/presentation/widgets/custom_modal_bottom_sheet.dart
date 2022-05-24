import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:note_app/features/note/presentation/cubit/note_form/note_form_cubit.dart';
import 'package:note_app/features/note/presentation/widgets/custom_list_tile.dart';

import '../../../../core/size_config.dart';
import 'color_filed.dart';

class CustomModalBottomSheetForNewNotes extends StatelessWidget {
  const CustomModalBottomSheetForNewNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormCubit, NoteFormState>(
      buildWhen: (p, c) => p.note.color != c.note.color,
      builder: (context, state) {
        return Container(
          height: SizeConfig.defaultSize! * 13,
          color: state.note.color.getOrCrash(),
          child: Container(
            margin: EdgeInsets.all(
              SizeConfig.defaultSize! * 2,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[ColorField()],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomModalBottomSheetForEditing extends StatelessWidget {
  const CustomModalBottomSheetForEditing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormCubit, NoteFormState>(
      buildWhen: (p, c) => p.note.color != c.note.color,
      builder: (context, state) {
        return Container(
          height: SizeConfig.defaultSize! * 35,
          color: state.note.color.getOrCrash(),
          child: Container(
            margin: EdgeInsets.all(
              SizeConfig.defaultSize! * 2,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const CustomListTile(
                    text: "Share with your friends",
                    icon: Icons.share,
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize!,
                  ),
                  CustomListTile(
                    text: "Delete",
                    icon: Icons.delete,
                    onTap: () => NoteFormCubit.getInstance(context).delete(),
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize!,
                  ),
                  CustomListTile(
                    text: "Duplicate",
                    icon: Icons.copy,
                    onTap: () {
                      print("pressed");
                      NoteFormCubit.getInstance(context).duplicate();
                    },
                  ),
                  const ColorField()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
