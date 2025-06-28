import 'package:flutter/material.dart';
import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/common/widgets/images/t_rounded_image.dart';
import 'package:sea_catering/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:sea_catering/common/widgets/texts/section_heading.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';
import 'package:sea_catering/utils/constants/sizes.dart';

class SubCategoriesQuickScreens extends StatelessWidget {
  const SubCategoriesQuickScreens({super.key});

  final List<Map<String, String>> topProducts = const [
    {'id': 'Quick001', 'title': 'Turkey Avocado Wrap', 'brand': 'Protein', 'price': 'Rp 30.000', 'image': TImages.air_friedchicken_salad},
    {'id': 'Quick002', 'title': 'Beef Broccoli with Carrot', 'brand': 'Royal', 'price': 'Rp 45.000', 'image': TImages.beef_broccoli_carrot},
    {'id': 'Quick003', 'title': 'Capcay Seafood', 'brand': 'Diet', 'price': 'Rp 40.000', 'image': TImages.capcay_seafood},
    {'id': 'Quick004', 'title': 'Chicken Curry Rice', 'brand': 'Protein', 'price': 'Rp 35.000', 'image': TImages.chicken_curry},
  ];

  final List<Map<String, String>> frequentlyAdded = const [
    {'id': 'Quick005', 'title': 'Tuna Salad Wrap', 'brand': 'Royal', 'price': 'Rp 51.000', 'image': TImages.tuna_salad_wrap},
    {'id': 'Quick006', 'title': 'Zucchini Noodles with Pesto', 'brand': 'Royal', 'price': 'Rp 44.000', 'image': TImages.zucchini_noodles_with_pesto},
    {'id': 'Quick007', 'title': 'Grilled Chicken Salad', 'brand': 'Protein', 'price': 'Rp 32.000', 'image': TImages.grilled_chicken_salad},
    {'id': 'Quick008', 'title': 'Buddha Bowl', 'brand': 'Diet', 'price': 'Rp 35.000', 'image': TImages.buddha_bowl},
  ];

  final List<Map<String, String>> recommended = const [
    {'id': 'Quick009', 'title': 'Quinoa Stir Fry', 'brand': 'Diet', 'price': 'Rp 25.000', 'image': TImages.quinoa_stirfry_veggoes},
    {'id': 'Quick010', 'title': 'Vegan Pesto', 'brand': 'Royal', 'price': 'Rp 29.000', 'image': TImages.vegan_pesto},
    {'id': 'Quick011', 'title': 'Shrimp Cauliflower Rice', 'brand': 'Royal', 'price': 'Rp 24.000', 'image': TImages.shrimp_cauliflower_rice},
    {'id': 'Quick012', 'title': 'Mushroom Chicken', 'brand': 'Royal', 'price': 'Rp 28.000', 'image': TImages.mushroom_chicken},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Quick and Easy'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.banner12,
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Top Product
              TSectionHeading(title: 'Top Product', onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwSections / 2),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: topProducts.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (context, index) {
                    final product = topProducts[index];
                    return TProductCardHorizontal(
                      id: product['id']!,
                      imageUrl: product['image']!,
                      title: product['title']!,
                      brand: product['brand']!,
                      price: product['price']!,
                    );
                  },
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// Frequently Added
              TSectionHeading(title: 'Frequently Added', onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwSections / 2),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: frequentlyAdded.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (context, index) {
                    final product = frequentlyAdded[index];
                    return TProductCardHorizontal(
                      id: product['id']!,
                      imageUrl: product['image']!,
                      title: product['title']!,
                      brand: product['brand']!,
                      price: product['price']!,
                    );
                  },
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// recommended
              TSectionHeading(title: 'Recommended', onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwSections / 2),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommended.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (context, index) {
                    final product = recommended[index];
                    return TProductCardHorizontal(
                      id: product['id']!,
                      imageUrl: product['image']!,
                      title: product['title']!,
                      brand: product['brand']!,
                      price: product['price']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
