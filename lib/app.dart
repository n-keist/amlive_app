import 'package:flutter/material.dart';
import 'package:amlive/styles/light.dart' as LightTheme;

import 'package:amlive/views/home/index.dart';

class AmliveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme.theme,
      title: 'AmLive',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => HomeViewIndex(),
      },
    );
  }
}
