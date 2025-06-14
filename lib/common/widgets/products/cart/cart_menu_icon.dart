import 'package:appppppp/features/shop/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/authentication/controllers/cart/CartController.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(Iconsax.shopping_cart, color: iconColor),
        ),

        /// Counter Bubble
        Positioned(
          right: 0,
          child: Obx(() {
            final totalItems = cartController.totalItems;
            if (totalItems == 0) return const SizedBox();

            return Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  '$totalItems',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: Colors.white, fontSizeFactor: 0.8),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
