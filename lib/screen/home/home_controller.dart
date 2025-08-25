
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product.dart';

class HomeController extends GetxController {
  final Dio _dio = Dio();
  final products = <Products>[].obs;
  final isLoading = false.obs;
  final error = RxnString();

  final favorites = <int>{}.obs;
  final cart = <int, int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    error.value = null;
    try {
      final res = await _dio.get('https://fakestoreapi.com/products');
      final data = (res.data as List<dynamic>)
          .map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList();
      products.assignAll(data);
    } catch (e) {
      error.value = 'Failed to load products';
      products.assignAll([
        Products(
          id: 1,
          title: 'Mock Shirt',
          price: 20.0,
          description: 'Offline Shirt',
          image: '',
          category: 'clothes',
          rating: Rating(rate: 4.8, count: 50),
        ),
        Products(
          id: 2,
          title: 'Mock Laptop',
          price: 999.0,
          description: 'Offline Laptop',
          image: '',
          category: 'electronics',
          rating: Rating(rate: 4.8, count: 50),
        ),
      ]);
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite(int productId) {
    if (favorites.contains(productId)) {
      favorites.remove(productId);
      update();
    } else {
      favorites.add(productId);
      update();
    }
  }

  void addToCart(int productId) {
    cart.update(productId, (q) => q + 1, ifAbsent: () => 1);
    Get.snackbar(
      'Added to cart',
      'Product #$productId added',
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(12),
      duration: const Duration(seconds: 2),
    );
  }
}
