import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),
      body: Obx(() {
        if (controller.cart.isEmpty) {
          return const Center(child: Text("Your cart is empty"));
        }

        final cartEntries = controller.cart.entries.toList();

        return ListView.separated(
          itemCount: cartEntries.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final entry = cartEntries[index];
            final productId = entry.key;
            final qty = entry.value;

            // Find product details
            final product = controller.products.firstWhereOrNull((p) => p.id == productId);
            if (product == null) return const SizedBox();

            final itemTotal = product.price * qty;

            return ListTile(
              title: Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quantity control
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          if (qty > 1) {
                            controller.cart[productId] = qty - 1;
                          } else {
                            controller.cart.remove(productId);
                          }
                        },
                      ),
                      Text("$qty", style: const TextStyle(fontSize: 16)),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        onPressed: () {
                          controller.cart[productId] = qty + 1;
                        },
                      ),
                    ],
                  ),
                  // Item total
                  Text(
                    "Item Total: \$${itemTotal.toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => controller.cart.remove(productId),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Obx(() {
        final total = controller.cart.entries.fold<double>(
          0,
              (sum, entry) {
            final product = controller.products.firstWhereOrNull((p) => p.id == entry.key);
            return sum + ((product?.price ?? 0) * entry.value);
          },
        );

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total: \$${total.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.snackbar("Checkout", "Proceeding to checkout...");
                },
                child: const Text("Checkout"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
