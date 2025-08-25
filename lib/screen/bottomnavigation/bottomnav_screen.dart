import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottomnav_controller.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());



    return Obx(
          () => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.selectedIndex.value == 0 ? "Products" : "Cart",
          ),
        ),
        body: controller.pages[controller.selectedIndex.value],
            bottomNavigationBar: Obx(
                  () => BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onTap: controller.changeTab,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                elevation: 10,
                selectedItemColor: Colors.deepPurple,
                unselectedItemColor: Colors.grey,
                selectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 12,
                ),
                showUnselectedLabels: true,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined),
                    activeIcon: Icon(Icons.shopping_bag),
                    label: 'Products',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined),
                    activeIcon: Icon(Icons.shopping_cart),
                    label: 'Cart',
                  ),
                ],
              ),
            ),

          ),
    );
  }
}