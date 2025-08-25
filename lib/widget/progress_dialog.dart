import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import '../utils/appcolor.dart';

class AppProgressDialog {
  late GetDialogRoute<dynamic> route;

  void show({bool barrierDismissible = false}) {
    route = GetDialogRoute(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            color: AppColors.orange,
          ),
        );
      },
      barrierDismissible: barrierDismissible,
    );
    Navigator.of(Get.context!).push(route);
  }

  void dismiss() {
    if (route.canPop) {
      Get.removeRoute(route);
      Get.back();
    }else{
      Get.back();
    }
  }
}
