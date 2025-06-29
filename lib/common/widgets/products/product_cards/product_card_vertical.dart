import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/authentication/controllers/cart/CartController.dart';
import '../../../../features/shop/controllers/wishlist.dart';
import '../../../../features/shop/screens/product_details/product_detail.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_price_text.dart';
import '../../../../rounded_container.dart';
import '../../texts/product_title_text.dart';
import '../../texts/t_brand_title_with_verified_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../styles/shadows.dart';
import '../../../../utils/constants/sizes.dart';

class TProductCardVertical extends StatelessWidget {
  final String productId;
  final String imageUrl;
  final String title;
  final String brand;
  final String price;

  const TProductCardVertical({
    super.key,
    required this.productId,
    required this.imageUrl,
    required this.title,
    required this.brand,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final controller = WishlistController.instance;
    final cartController = CartController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- Image, Wishlist, Discount Tag ---
            TRoundedContainer(
              height: 150,
              radius: TSizes.productImageRadius,
              backgroundColor: dark ? Colors.black : Colors.white,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  TRoundedImage(
                    imageUrl: imageUrl,
                    applyImageRadius: true,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 12,
                    left: 8,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Obx(() {
                      final isFavorite = controller.isInWishlist(productId);
                      return IconButton(
                        icon: Icon(
                          isFavorite ? Iconsax.heart5 : Iconsax.heart,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          if (FirebaseAuth.instance.currentUser != null) {
                            controller.toggleWishlist(productId);
                          } else {
                            Get.snackbar('Login Required', 'Please login to use wishlist feature.');
                          }
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// --- Title & Brand ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: title, textAlign: TextAlign.start),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: brand, textAlign: TextAlign.start),
                ],
              ),
            ),

            const Spacer(),

            /// --- Price & Quantity Button ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TProductPriceText(price: price),

                  Obx(() {
                    final quantity = cartController.cartItems[productId]?.quantity ?? 0;

                    if (quantity == 0) {
                      return GestureDetector(
                        onTap: () {
                          cartController.addToCart(CartItem(
                            id: productId,
                            title: title,
                            brand: brand,
                            image: imageUrl,
                            price: double.parse(price.replaceAll('Rp ', '').replaceAll('.', '')),
                          ));
                          Get.snackbar('Added to Cart', '$title added to your cart');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Iconsax.add, color: Colors.white),
                        ),
                      );
                    } else {
                      return Row(
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
                          Text(
                            '$quantity',
                            style: TextStyle(
                              color: dark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
