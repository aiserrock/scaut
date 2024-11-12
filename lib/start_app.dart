import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scaut/app.dart';
import 'package:scaut/util/flavor.dart';

Future<void> startApp(Flavor flavor) async {
  runZonedGuarded<void>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, (error, stackTrace) {});
}
