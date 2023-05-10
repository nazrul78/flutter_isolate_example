import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/splash_screen.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
