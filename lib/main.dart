import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:amlive/app.dart';

void main() {
  (() async {
    await Hive.initFlutter();
    await Hive.openBox('app');
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  })();
  runApp(AmliveApp());
}
