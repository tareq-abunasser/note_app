// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:note_app/features/note/presentation/pages/note_form_page.dart';

import '../features/note/presentation/pages/home_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';

const String MOBILE_INITIAL = MobileRoutes.HOME;

final List<GetPage<Widget>> mobileRoutes = <GetPage<Widget>>[
  GetPage<SplashPage>(
    name: MobileRoutes.SPLASH,
    page: () => const SplashPage(),
    middlewares: [MyMiddleware()],
  ),
  GetPage<HomePage>(
    name: MobileRoutes.HOME,
    page: () => HomePage(),
    middlewares: [MyMiddleware()],
  ),
  GetPage<NoteFormPage>(
    name: MobileRoutes.Note_Form,
    page: () => NoteFormPage(),
    middlewares: [MyMiddleware()],
  ),
];

abstract class MobileRoutes {
  static const String SPLASH = '/mobile_splash';
  static const String HOME = '/mobile_home';
  static const String Note_Form = '/mobile_note_form';
}

class MyMiddleware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}

class GlobalMiddleware extends GetMiddleware {
  @override
  Widget onPageBuilt(Widget page) {
    print('Widget ${page.toStringShort()} will be showed');
    return page;
  }

  @override
  void onPageDispose() {
    print('PageDisposed');
  }
}
