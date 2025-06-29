import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sea_catering/utils/constants/colors.dart';
import 'package:sea_catering/utils/constants/sizes.dart';

import 'features/authentication/controllers/cart/CartController.dart';

class TAddToCartButton extends StatelessWidget {
  final String productId;
  final String title;
  final String brand;
  final String image;
  final double price;

  const TAddToCartButton({
    super.key,
    required this.productId,
    required this.title,
    required this.brand,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(() {
      final quantity = cartController.cartItems[productId]?.quantity ?? 0;

      return Column(
        children: [
          GestureDetector(
            onTap: () {
              cartController.addToCart(CartItem(
                id: productId,
                title: title,
                brand: brand,
                image: image,
                price: price,
              ));
              Get.snackbar('Added to Cart', '$title added to your cart');
            },
            child: Container(
              decoration: BoxDecoration(
                color: quantity > 0 ? Colors.green : Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(TSizes.cardRadiusMd),
                  bottomRight: Radius.circular(TSizes.productImageRadius),
                ),
              ),
              child: SizedBox(
                width: TSizes.iconLg * 1.2,
                height: TSizes.iconLg * 1.2,
                child: Center(
                  child: quantity == 0
                      ? const Icon(Iconsax.add, color: TColors.white)
                      : Text(
                    '$quantity',
                    style: const TextStyle(
                      color: TColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (quantity > 0) ...[
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => cartController.decreaseQuantity(productId),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(Icons.remove, color: Colors.white, size: 16),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => cartController.increaseQuantity(productId),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(Icons.add, color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
          ],
        ],
      );
    });
  }
}
