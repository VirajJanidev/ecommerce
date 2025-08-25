import 'package:get/get.dart';

import '../../route/approute.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkScreen();
  }

  Future<void> checkScreen() async {
    Future.delayed(Duration(seconds: 3), () {
      Get.offAllNamed(AppRoute.bottomNavScreen);
    });
  }
}
