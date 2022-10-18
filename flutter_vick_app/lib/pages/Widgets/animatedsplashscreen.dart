import 'package:flutter/material.dart';

import '../Navegacao/navegacao.dart';

enum PageTransitionType {
  fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotate,
  size,
  rightToLeftWithFade,
  leftToRightWithFade,
}

enum SplashTransition {
  slideTransition,
  scaleTransition,
  rotationTransition,
  sizeTransition,
  fadeTransition,
  decoratedBoxTransition
}

class AnimatedSplashScreen extends StatelessWidget {
  AnimatedSplashScreen({
    Curve curve = Curves.easeInCirc,
    int duration = 2500,
    @required dynamic splash,
    @required Widget? nextScreen,
    Color backgroundColor = Colors.white,
    Animatable? customTween,
    bool centered = true,
    SplashTransition splashTransition = SplashTransition.fadeTransition,
    PageTransitionType pageTransitionType = PageTransitionType.downToUp,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clean Code',
        home: AnimatedSplashScreen(
          splash: 'imagens/vick_logo.jpg',
          nextScreen: Navegacao(),
          splashTransition: SplashTransition.rotationTransition,
          pageTransitionType: PageTransitionType.scale,
        ));
  }
}
