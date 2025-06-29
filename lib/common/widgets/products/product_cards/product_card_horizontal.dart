import 'package:sea_catering/features/shop/controllers/wishlist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sea_catering/common/widgets/images/t_rounded_image.dart';
import 'package:sea_catering/common/widgets/texts/product_price_text.dart';
import 'package:sea_catering/common/widgets/texts/product_title_text.dart';
import 'package:sea_catering/common/widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:sea_catering/rounded_container.dart';
import 'package:sea_catering/utils/constants/colors.dart';
import 'package:sea_catering/utils/constants/sizes.dart';
import 'package:sea_catering/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../features/authentication/controllers/cart/CartController.dart';

class TProductCardHorizontal extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final String brand;
  final String price;

  const TProductCardHorizontal({
    super.key,
    required this.id,
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

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.lightContainer,
      ),
      child: Row(
        children: [
          /// Product Image Container
          TRoundedContainer(
            height: 120,
            width: 120,
            radius: TSizes.productImageRadius,
            backgroundColor: dark ? TColors.darkerBlue : TColors.light,
            child: Stack(
              fit: StackFit.expand,
              children: [
                TRoundedImage(
                  imageUrl: imageUrl,
                  applyImageRadius: true,
                  fit: BoxFit.cover,
                ),

                /// Discount label
                Positioned(
                  top: 12,
                  left: 8,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.sm,
                      vertical: TSizes.xs,
                    ),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                /// Wishlist icon
                Positioned(
                  top: 0,
                  right: 0,
                  child: Obx(() {
                    final isFavorite = controller.isInWishlist(id);
                    return IconButton(
                      icon: Icon(
                        isFavorite ? Iconsax.heart5 : Iconsax.heart,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        if (FirebaseAuth.instance.currentUser != null) {
                          controller.toggleWishlist(id);
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

          /// Product Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.sm,
                vertical: TSizes.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: title, smallSize: true),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrandTitleWithVerifiedIcon(title: brand),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: TProductPriceText(price: price)),

                      /// Global Quantity Button
                      Obx(() {
                        final quantity = cartController.cartItems[id]?.quantity ?? 0;

                        return quantity == 0
                            ? GestureDetector(
                          onTap: () {
                            cartController.addToCart(CartItem(
                              id: id,
                              title: title,
                              brand: brand,
                              image: imageUrl,
                              price: double.parse(price.replaceAll(RegExp(r'[^0-9]'), '')),
                            ));
                            Get.snackbar('Added to Cart', '$title added to your cart');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight: Radius.circular(TSizes.productImageRadius),
                              ),
                            ),
                            child: SizedBox(
                              width: TSizes.iconLg * 1.2,
                              height: TSizes.iconLg * 1.2,
                              child: const Center(
                                child: Icon(Iconsax.add, color: TColors.white),
                              ),
                            ),
                          ),
                        )
                            : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () => cartController.decreaseQuantity(id),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(4),
                                child: const Icon(Icons.remove, color: Colors.white, size: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '$quantity',
                                style: TextStyle(
                                  color: dark ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        ),

                        GestureDetector(
                              onTap: () => cartController.increaseQuantity(id),
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
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
