import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scaut/app.dart';
import 'package:scaut/common/firebase/firebase_options.dart' as scaut_prod;
import 'package:scaut/common/util/flavor.dart';

Future<void> startApp(Flavor flavor) async {
  runZonedGuarded<void>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: scaut_prod.DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAnalytics.instance.logEvent(name: 'scaut_first_open');
    runApp(const MyApp());
  }, (error, stackTrace) {});
}
