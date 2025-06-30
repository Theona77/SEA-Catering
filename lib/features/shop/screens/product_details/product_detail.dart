import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import '../../../../../features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import '../../../../../features/shop/screens/product_details/widgets/product_meta_data.dart';
import '../../../../../features/shop/screens/product_details/widgets/rating_share_widget.dart';
import '../../../../../features/shop/screens/product_reviews/widgets/product_reviews.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../product_attributes.dart';
import '../testimony/testimonial_screen.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  Stream<QuerySnapshot> getTestimonials(String productId) {
    return FirebaseFirestore.instance
        .collection('testimonials')
        .where('productId', isEqualTo: productId)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TProductImageSlider(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating and Share Button with StreamBuilder
                  StreamBuilder<QuerySnapshot>(
                    stream: getTestimonials('drink001'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      final reviews = snapshot.data?.docs ?? [];
                      double totalRating = 0;
                      for (var doc in reviews) {
                        totalRating += (doc['rating'] ?? 0).toDouble();
                      }
                      double averageRating = reviews.isEmpty ? 0 : totalRating / reviews.length;

                      return TRatingAndShare(
                        averageRating: averageRating,
                        totalReviews: reviews.length,
                      );
                    },
                  ),

                  const TProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwSections / 3),

                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  const TSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
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

                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: 'Share your Experience', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: const Icon(Iconsax.star, color: TColors.primary),
                        onPressed: () {
                          Get.to(() => const TestimonialFormScreen(productId: 'drink001'));
                        },
                      );
                    }),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Reviews', showActionButton: false),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () => Get.to(() => const ProductReviewScreen(productId: 'drink001')),
                      ),
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
