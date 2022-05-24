import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


const String WEB_INITIAL = WebRoutes.HOME;

final List<GetPage<Widget>> webRoutes = <GetPage<Widget>>[
  // GetPage<SplashView>(
  //   name: WebRoutes.LOGIN,
  //   page: () => SplashView(),
  // ),
];

abstract class WebRoutes {
  static const String SPLASH = '/';
  static const String HOME = '/home';
  static const String New_NOTE = '/new_note';
  static const String EDIT_NOTE = '/edit_note';
}
