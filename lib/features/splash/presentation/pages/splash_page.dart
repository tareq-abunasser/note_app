import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../widgets/splash_body.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: kMainColor,
       body: SplashBody(),
    );
  }
}
