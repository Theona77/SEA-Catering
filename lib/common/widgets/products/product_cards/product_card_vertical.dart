import 'package:sea_catering/common/widgets/icon/t_circular_icon.dart';
import 'package:sea_catering/common/widgets/images/t_rounded_image.dart';
import 'package:sea_catering/common/widgets/texts/product_title_text.dart';
import 'package:sea_catering/features/authentication/controllers/cart/CartController.dart';
import 'package:sea_catering/features/shop/controllers/wishlist.dart';
import 'package:sea_catering/features/shop/screens/product_details/product_detail.dart';
import 'package:sea_catering/utils/helpers/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../texts/product_price_text.dart';
import '../../../../rounded_container.dart';
import '../../texts/t_brand_title_with_verified_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../styles/shadows.dart';
import '../../../../utils/constants/sizes.dart';

class TProductCardVertical extends StatelessWidget{
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

    /// Container with side paddings, colors, edges, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : Colors.white
        ),
      
        child: Column(
          children: [
            /// --- Thumbmail, Wishlist, Discount Tag
            TRoundedContainer(
              height: 150,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor : dark ? Colors.black : Colors.white,
              child: Stack(
                children: [
                  /// --- Thumbnail Image
                  TRoundedImage(imageUrl: imageUrl, applyImageRadius: true),
      
                  /// --- Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
                    ),
                  ),
      
      
                  /// -- Favorite Icon Button
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
              )
            ),
      
            const SizedBox(height: TSizes.spaceBtwItems/2),
      
            /// --- Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: title,  textAlign: TextAlign.start),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: brand, textAlign: TextAlign.start,),

                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            /// --- Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// -- Price
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(price: price),
                ),

                /// Add to Cart Button
                GestureDetector(
                  onTap: () {
                    final cartController = Get.find<CartController>();
                    cartController.addToCart(CartItem(
                      id: productId,
                      title: title,
                      brand: brand,
                      image: imageUrl,
                      price: double.parse(price.replaceAll('', '').replaceAll('.', '')),
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
                )

              ],
            )

          ],
        ),
      ),
    );
  }
}

