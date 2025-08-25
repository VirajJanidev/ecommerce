import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splas_controller.dart';

class SplasScreen extends StatelessWidget {
  const SplasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(backgroundColor: Colors.yellow);
      },
    );
  }
}
