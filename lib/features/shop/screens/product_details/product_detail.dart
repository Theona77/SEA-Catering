import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:sea_catering/common/widgets/icon/t_circular_icon.dart';
import 'package:sea_catering/common/widgets/images/t_rounded_image.dart';
import 'package:sea_catering/common/widgets/texts/section_heading.dart';
import 'package:sea_catering/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:sea_catering/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:sea_catering/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:sea_catering/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:sea_catering/features/shop/screens/product_reviews/widgets/product_reviews.dart';
import 'package:sea_catering/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../product_attributes.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ---  1. Product Image Slider
            TProductImageSlider(),

            /// ---  2. Product Details
            Padding(
              padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating and Share Button
                  TRatingAndShare(),

                  /// Price, Title, Stack dan Brand
                  TProductMetaData(),

                  /// Attributes
                  TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// Description
                  const TSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    'Fresh Pakcoy, also known as bok choy, is a crisp and tender leafy green vegetable that’s perfect for a variety of dishes—from stir-fries and soups to salads and steamed sides. Grown with care and harvested at peak freshness, our pakcoy offers a mild, slightly sweet flavor and a satisfying crunch in every bite. Packed with essential vitamins like A, C, and K, as well as antioxidants and fiber, it’s a nutritious choice for health-conscious meals. Whether youre cooking at home or adding freshness to your market lineup, this premium-quality pakcoy is a must-have staple in any kitchen.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),

                  ),


                  /// Review
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(title: 'Reviews(199)', showActionButton: false),
                      IconButton(icon: const Icon(Iconsax.arrow_right_3, size: 18), onPressed: () => Get.to(() => const ProductReviewScreen())),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
