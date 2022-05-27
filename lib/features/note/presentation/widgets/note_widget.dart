import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/core/size_config.dart';
import 'package:note_app/features/note/presentation/widgets/custom_text_field.dart';
import 'package:note_app/routes/mobile_app_pages.dart';

import '../../domain/entities/note.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({Key? key, required this.note}) : super(key: key);
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Card(

      margin: const EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
          Get.toNamed(MobileRoutes.Note_Form, arguments: [
            note,
          ]);
        },
        child: (Container(
          clipBehavior: Clip.hardEdge,
          width: double.infinity,
          height: SizeConfig.defaultSize! *12,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: note.color.getOrCrash(), width: 7,),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWithGoogleStyle(
                text: note.name.getOrCrash(),
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 2,
              ),
              CustomTextWithGoogleStyle(
                text: note.body.getOrCrash(),
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
