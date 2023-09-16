import 'package:canteen/src/config/constants/constants.dart';
import 'package:canteen/src/locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

Future main() async {
  await ConfigApp.initializeApp();
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
    enabled: Constants.turnOnDevicePreview && !kReleaseMode,
  ));
}
