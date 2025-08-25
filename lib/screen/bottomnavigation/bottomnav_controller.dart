import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart/cart_screen.dart';
import '../home/home_screen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
  final List<Widget> pages = [
    const HomeScreen(),
    const CartPage(),
  ];
}