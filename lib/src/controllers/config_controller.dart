import 'package:get/get.dart';

import '../pages/home_page.dart';

class ConfigController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    // TODO: implement onReady
    await 1.delay();
    Get.offAll(() => HomePage());
    super.onReady();
  }
}