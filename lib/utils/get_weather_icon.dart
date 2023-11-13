import 'package:flutter/material.dart';

Widget getWeatherIcon(int code, double? scale) {
  double currentScale = scale ?? 1;

  switch (code) {
    case >= 200 && < 300:
      return Image.asset(
        'assets/1.png',
        scale: currentScale,
      );
    case >= 300 && < 400:
      return Image.asset(
        'assets/2.png',
        scale: currentScale,
      );
    case >= 500 && < 600:
      return Image.asset(
        'assets/3.png',
        scale: currentScale,
      );
    case >= 600 && < 700:
      return Image.asset(
        'assets/4.png',
        scale: currentScale,
      );
    case >= 700 && < 800:
      return Image.asset(
        'assets/5.png',
        scale: currentScale,
      );
    case == 800:
      return Image.asset(
        'assets/6.png',
        scale: currentScale,
      );
    case > 800 && <= 804:
      return Image.asset(
        'assets/7.png',
        scale: currentScale,
      );
    default:
      return Image.asset(
        'assets/7.png',
        scale: currentScale,
      );
  }
}
