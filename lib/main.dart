import 'package:flutter/material.dart';
import 'package:flutter_isolate_example/src/controllers/config_controller.dart';
import 'package:get/get.dart';

import 'src/app.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
Get.put(ConfigController());
  runApp( App());
}
