import 'package:get/get.dart';

import '../../route/approute.dart';

class SplashController extends GetxController {

  var animate = false.obs;


  @override
  void onInit() {
    super.onInit();
    checkScreen();
  }

  Future<void> checkScreen() async {
    Future.delayed(const Duration(milliseconds: 500), () {
      animate.value = true; // start logo/text animation
    });

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed('/home'); // Navigate to home screen
    });
  }
}
