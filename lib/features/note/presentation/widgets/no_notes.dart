import 'package:flutter/material.dart';
import '../../../../core/size_config.dart';
import 'custom_text_field.dart';

class NoNotes extends StatelessWidget {
  const NoNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/notepad.png",
            width: SizeConfig.defaultSize! * 15,
            height: SizeConfig.defaultSize! * 15,
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 4,
          ),
          CustomTextWithGoogleStyle(
            text: "No Notes :(",
            color: Theme.of(context).primaryColor,
            fontSize: 25,
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 2,
          ),
          const CustomTextWithGoogleStyle(
            text: "You Have no tasks to do",
            color: Colors.grey,
            fontSize: 15,
          ),
        ],
      ),
    );
  }
}
