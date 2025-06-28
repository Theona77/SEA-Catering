import 'package:flutter/material.dart';
import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/common/widgets/images/t_rounded_image.dart';
import 'package:sea_catering/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:sea_catering/common/widgets/texts/section_heading.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';
import 'package:sea_catering/utils/constants/sizes.dart';

class SubCategoriesSnacksScreens extends StatelessWidget {
  const SubCategoriesSnacksScreens({super.key});

  final List<Map<String, String>> topProducts = const [
    {'id': 'snacks001', 'title': 'Greek Yoghurt Banana', 'brand': 'Protein', 'price': 'Rp 30.000', 'image': TImages.greek_yoghurt_banana},
    {'id': 'snacks002', 'title': 'Mango Coconut Chia Seed Pudding', 'brand': 'Royal', 'price': 'Rp 45.000', 'image': TImages.mango_coconut_chiaseed_pudding},
    {'id': 'snacks003', 'title': 'Waffle Skewers', 'brand': 'Diet', 'price': 'Rp 40.000', 'image': TImages.waffle_skewers},
    {'id': 'snacks004', 'title': 'Rainbow Fruit Skewers', 'brand': 'Protein', 'price': 'Rp 35.000', 'image': TImages.rainbow_fruit_skewers},
  ];

  final List<Map<String, String>> frequentlyAdded = const [
    {'id': 'snacks005', 'title': 'Pancake Strawberry Blueberry', 'brand': 'Royal', 'price': 'Rp 51.000', 'image': TImages.pancake_strawberry_blueberry},
    {'id': 'snacks006', 'title': 'Oatmeal Cookie', 'brand': 'Royal', 'price': 'Rp 44.000', 'image': TImages.oatmeal_cookie},
    {'id': 'snacks007', 'title': 'Fruit Salad', 'brand': 'Protein', 'price': 'Rp 32.000', 'image': TImages.fruit_salad},
    {'id': 'snacks008', 'title': 'Egg Roll', 'brand': 'Diet', 'price': 'Rp 35.000', 'image': TImages.egg_roll},
  ];

  final List<Map<String, String>> recommended = const [
    {'id': 'snacks009', 'title': 'Dimsum Siomay', 'brand': 'Diet', 'price': 'Rp 25.000', 'image': TImages.dimsum_siumai},
    {'id': 'snacks010', 'title': 'Crispy Garlic French Fries', 'brand': 'Royal', 'price': 'Rp 29.000', 'image': TImages.crispy_garlic_frenchfries},
    {'id': 'snacks011', 'title': 'Chocolate Chia Pudding', 'brand': 'Royal', 'price': 'Rp 24.000', 'image': TImages.chocolate_chia_pudding},
    {'id': 'snacks012', 'title': 'Blueberry Yoghurt Toast', 'brand': 'Royal', 'price': 'Rp 28.000', 'image': TImages.blueberry_yoghurt_toast},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Snacks Low Sugar'), showBackArrow: true),
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
