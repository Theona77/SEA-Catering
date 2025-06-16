import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../features/authentication/controllers/cart/CartController.dart';
import 'cart_item_tile.dart'; // pastikan file ini berisi TCartItemTile yang reactive
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  final bool showAddRemoveButtons;

  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(() {
      final cartItems = cartController.cartItems.values.toList();

      if (cartItems.isEmpty) {
        return const Center(child: Text("Your cart is empty."));
      }

      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cartItems.length,
        separatorBuilder: (_, __) =>
        const SizedBox(height: TSizes.spaceBtwSections),
        itemBuilder: (_, index) {
          final item = cartItems[index];
          return TCartItemTile(
            id: item.id,
            image: item.image,
            brand: item.brand,
            title: item.title,
            price: item.price,
            quantity: item.quantity,
            showAddRemoveButtons: showAddRemoveButtons, // ← penting!
          );
        },
      );
    });
  }
}
