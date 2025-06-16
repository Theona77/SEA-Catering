import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../features/authentication/controllers/cart/CartController.dart';
import '../../../../../utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    const double shippingFee = 8000;
    const double taxFee = 2000;

    return Obx(() {
      final subtotal = cartController.totalPrice;
      final total = subtotal + shippingFee + taxFee;

      return Column(
        children: [
          /// Subtotal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
              Text('Rp ${subtotal.toStringAsFixed(0)}', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),

          /// Shipping Fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
              Text('Rp ${shippingFee.toStringAsFixed(0)}', style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),

          /// Tax Fee
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
              Text('Rp ${taxFee.toStringAsFixed(0)}', style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),

          /// Order Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Total', style: Theme.of(context).textTheme.titleMedium),
              Text('Rp ${total.toStringAsFixed(0)}', style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
        ],
      );
    });
  }
}
