import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/size_config.dart';
import 'package:note_app/routes/mobile_app_pages.dart';

import '../../../note/presentation/pages/home_page.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EasySplashScreen(
          logo: Image.asset("assets/images/notepad.png"),
          showLoader: false,
          loaderColor: Theme.of(context).primaryColor,
          logoSize: SizeConfig.defaultSize! * 10,
        ),
        Container(
            width: double.infinity,
            alignment: const Alignment(0.0, .70),
            child: SizedBox(
              width: SizeConfig.defaultSize! * 20,
              child: ElevatedButton(
                onPressed: () => Get.toNamed(MobileRoutes.HOME),
                style:
                ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                child:  Text(
                  "Get Started",
                  style: GoogleFonts.openSans(fontSize: 15),
                ),
              ),
            )),
      ],
    );
  }
}
