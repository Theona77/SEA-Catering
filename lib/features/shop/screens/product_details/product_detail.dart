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
                  const SizedBox(height: TSizes.spaceBtwSections/3),


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
                    'Our Mixed Berry Smoothie is a refreshing, nutrient-packed drink made with a blend of blueberries, strawberries, and raspberries. Perfect for a quick breakfast or post-workout recovery, it delivers a naturally sweet, fruity flavor. Rich in antioxidants, this smoothie helps support your immune system and skin health.\n\n'
                    '\u2022 Calories: 180 kcal\n'
                        '\u2022 Protein: 8g\n'
                        '\u2022 Carbohydrates: 22g (Natural fruit sugars)\n'
                        '\u2022 Fiber: 4g\n'
                        '\u2022 Fat: 5g (From Greek yoghurt and chia seeds)\n'
                        '\u2022 Rich in Vitamin C, Antioxidants, and Potassium',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
