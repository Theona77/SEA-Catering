import 'package:appppppp/common/widgets/icon/t_circular_icon.dart';
import 'package:appppppp/common/widgets/images/t_rounded_image.dart';
import 'package:appppppp/common/widgets/texts/product_title_text.dart';
import 'package:appppppp/features/shop/screens/product_details/product_detail.dart';
import 'package:appppppp/utils/helpers/helper_functions.dart';
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
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
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
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor : dark ? Colors.black : Colors.white,
              child: Stack(
                children: [
                  /// --- Thumbnail Image
                  const TRoundedImage(imageUrl: TImages.product1, applyImageRadius: true),
      
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
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
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
                  const TProductTitleText(title: 'Fresh Pakcoy',  textAlign: TextAlign.start),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  const TBrandTitleWithVerifiedIcon(title: 'Vegetable', textAlign: TextAlign.start,),

                ],
              ),
            ),

            const Spacer(),

            /// --- Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// -- Price
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: const TProductPriceText(price: '35.0'),
                ),

                /// Add to Cart Button
                Container(
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
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}

