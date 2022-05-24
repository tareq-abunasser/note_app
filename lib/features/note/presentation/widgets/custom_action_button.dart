import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/mobile_app_pages.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 15,
      onPressed: () =>Get.toNamed(MobileRoutes.Note_Form),
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1321E0),
                  Colors.pink,
                ],
              )),
          child: const Icon(
            Icons.add,
            size: 40,
          )),
    );
  }
}
