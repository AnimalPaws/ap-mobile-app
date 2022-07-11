import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'chech_auth_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SplashScreenView(
      navigateRoute: const CheckAuthScreen(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/logo2.png",
      text: "AnimalPaws",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 40.0,
      ),
      colors: const [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Theme.of(context).bottomAppBarColor,
    ));
  }
}
