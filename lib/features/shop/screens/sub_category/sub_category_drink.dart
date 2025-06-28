import 'package:flutter/material.dart';
import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/common/widgets/images/t_rounded_image.dart';
import 'package:sea_catering/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:sea_catering/common/widgets/texts/section_heading.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';
import 'package:sea_catering/utils/constants/sizes.dart';

class SubCategoriesDrinkScreens extends StatelessWidget {
  const SubCategoriesDrinkScreens({super.key});

  final List<Map<String, String>> topProducts = const [
    {'id': 'drink001', 'title': 'Mixed Berry Smoothie', 'brand': 'Protein', 'price': 'Rp 30.000', 'image': TImages.mixedberry_smoothie},
    {'id': 'drink002', 'title': 'Apple Juice', 'brand': 'Protein', 'price': 'Rp 45.000', 'image': TImages.apple_juice},
    {'id': 'drink003', 'title': 'Avocado Juice', 'brand': 'Diet', 'price': 'Rp 40.000', 'image': TImages.avocado_juice},
    {'id': 'drink004', 'title': 'Cucumber Mint Smoothie', 'brand': 'Royal', 'price': 'Rp 35.000', 'image': TImages.cucumber_mint_smoothie},
  ];

  final List<Map<String, String>> frequentlyAdded = const [
    {'id': 'drink005', 'title': 'Cucumber Watermelon', 'brand': 'Royal', 'price': 'Rp 51.000', 'image': TImages.cucumber_watermelon},
    {'id': 'drink006', 'title': 'Detox', 'brand': 'Royal', 'price': 'Rp 44.000', 'image': TImages.detox},
    {'id': 'drink007', 'title': 'Dragon Fruit Smoothie', 'brand': 'Protein', 'price': 'Rp 32.000', 'image': TImages.dragonfruit_smoothie},
    {'id': 'drink008', 'title': 'Lemonade', 'brand': 'Royal', 'price': 'Rp 35.000', 'image': TImages.lemonnade},
  ];

  final List<Map<String, String>> recommended = const [
    {'id': 'drink009', 'title': 'Orange Juice', 'brand': 'Royal', 'price': 'Rp 25.000', 'image': TImages.orange_juice},
    {'id': 'drink010', 'title': 'Peanut Banana Smoothie', 'brand': 'Royal', 'price': 'Rp 29.000', 'image': TImages.peanut_banana_smoothie},
    {'id': 'drink011', 'title': 'Soy Milk', 'brand': 'Diet', 'price': 'Rp 24.000', 'image': TImages.soymilk},
    {'id': 'drink012', 'title': 'Summer Mango Smoothie', 'brand': 'Protein', 'price': 'Rp 28.000', 'image': TImages.summer_mango_smoothie},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Drinks'), showBackArrow: true),
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
