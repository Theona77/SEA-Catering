import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
import '../../../../utils/constants/image_strings.dart';
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
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        height: 300, // Give it fixed height to enforce layout structure
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- Image & Wishlist & Discount Tag
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
                    fit: BoxFit.cover, // This makes the image fill the entire container
                  ),

                  /// Discount Tag
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

                  /// Wishlist Icon
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

            /// --- Title & Brand
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

            const Spacer(), // Push Price Row to bottom

            /// --- Price + Add Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TProductPriceText(price: price),
                  GestureDetector(
                    onTap: () {
                      final cartController = Get.find<CartController>();
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
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(TSizes.cardRadiusMd),
                          bottomRight: Radius.circular(TSizes.productImageRadius),
                        ),
                      ),
                      child: const SizedBox(
                        width: TSizes.iconLg * 1.2,
                        height: TSizes.iconLg * 1.2,
                        child: Center(child: Icon(Iconsax.add, color: TColors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
          ],
        ),
      ),
    );
  }
}
