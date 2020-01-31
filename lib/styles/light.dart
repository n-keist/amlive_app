import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  primaryColor: Color(0xfff0f7f4),
  accentColor: Color(0xff70abaf),
  fontFamily: 'Montserrat',
  primarySwatch: MaterialColor(0xff32292f, {
    50: Color(0xff32292f).withOpacity(.1),
    100: Color(0xff32292f).withOpacity(.2),
    200: Color(0xff32292f).withOpacity(.3),
    300: Color(0xff32292f).withOpacity(.4),
    400: Color(0xff32292f).withOpacity(.5),
    500: Color(0xff32292f).withOpacity(.6),
    600: Color(0xff32292f).withOpacity(.7),
    700: Color(0xff32292f).withOpacity(.8),
    800: Color(0xff32292f).withOpacity(.9),
    900: Color(0xff32292f).withOpacity(1),
  }),
  backgroundColor: Color(0xfff0f7f4),
  scaffoldBackgroundColor: Color(0xfff0f7f4),
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: Color(0xff32292f),
      opacity: .9,
    ),
    brightness: Brightness.light,
    elevation: 0,
    textTheme: TextTheme(
      title: TextStyle(
        letterSpacing: 2.9,
        color: Color(0xff32292f),
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      ),
    ),
  ),
);
