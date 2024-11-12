import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:scaut/app.dart';
import 'package:scaut/util/flavor.dart';

Future<void> startDevApp(Flavor flavor) async {
  runZonedGuarded<void>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, (error, stackTrace) {});
}
