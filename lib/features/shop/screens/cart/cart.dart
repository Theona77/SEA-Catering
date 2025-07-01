import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_catering/features/shop/screens/cart/widgets/cart_item_tile.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

import '../../../authentication/controllers/cart/CartController.dart';
import '../checkout/widgets/checkout.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),

      body: Obx(() {
        final cartItems = cartController.cartItems.values.toList();

        if (cartItems.isEmpty) {
          return const Center(child: Text("Your cart is empty."));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // penting
                itemCount: cartItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
                itemBuilder: (_, index) {
                  final item = cartItems[index];
                  return TCartItemTile(
                    id: item.id,
                    image: item.image,
                    brand: item.brand,
                    title: item.title,
                    price: item.price,
                    quantity: item.quantity,
                    showAddRemoveButtons: true,
                  );
                },
              ),
            ],
          ),
        );
      }),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Obx(() {
          final total = cartController.totalPrice;
          return ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: Text('Checkout Rp ${total.toStringAsFixed(0)}'),
          );
        }),
      ),
    );
  }
}

