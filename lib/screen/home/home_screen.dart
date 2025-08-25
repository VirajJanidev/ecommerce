 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_utility.dart';
import '../cart/cart_screen.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('E-Commerce Product'),
            actions: [
              Obx(() {
                final itemsCount = c.cart.values.fold<int>(0, (a, b) => a + b);
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                   //     Get.to(() => const CartPage());

                      },
                      icon: const Icon(Icons.shopping_cart_outlined),
                    ),
                    if (itemsCount > 0)
                      Positioned(
                        right: 8,
                        top: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '$itemsCount',
                            style: const TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                  ],
                );
              }),
            ],
          ),
          body: Obx(() {
            if (c.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (c.error.value != null) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(c.error.value!, style: const TextStyle(color: Colors.red)),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: c.fetchProducts,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            if (c.products.isEmpty) {
              return const Center(child: Text('No products found'));
            }

            // Exactly 2 columns as requested; tweak spacing/responsiveness as needed.
            return Obx(
() =>                Padding(
                padding: const EdgeInsets.all(12),
                child: GridView.builder(
                  itemCount: c.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // <-- 2-column grid
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.66, // tune for card proportions
                  ),
                  itemBuilder: (context, index) {
                    final p = c.products[index];
                    return AppUtility.buildProductCard(
                      product: p,
                      isFavorite: c.favorites.contains(p.id),
                      onToggleFavorite: () => c.toggleFavorite(p.id),
                      onAddToCart: () => c.addToCart(p.id),
                      context: context,
                    );
                  },
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
