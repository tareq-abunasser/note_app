import 'package:flutter/material.dart';
import 'package:note_app/features/note/presentation/cubit/note_form/note_form_cubit.dart';
import 'package:note_app/features/note/presentation/widgets/custom_text_field.dart';

import '../../../../core/size_config.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key, required this.text, required this.icon,this.onTap})
      : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: Icon(icon),
      ),
      title: CustomText(
        text: text,
        color: Colors.grey,
        fontSize: 15,
      ),
      onTap: onTap,
    );
  }
}
