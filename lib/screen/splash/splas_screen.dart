import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splas_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  height: controller.animate.value ? 120 : 80,
                  width: controller.animate.value ? 120 : 80,
                  child: Image.asset(
                    "assets/image/splash.png",
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 20),

                AnimatedOpacity(
                  duration: const Duration(seconds: 2),
                  opacity: controller.animate.value ? 1 : 0,
                  child: Text(
                    "MyShop",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                CircularProgressIndicator(
                  color: Colors.deepPurple,
                  strokeWidth: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
