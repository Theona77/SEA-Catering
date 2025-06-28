import 'package:flutter/material.dart';
import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/common/widgets/images/t_rounded_image.dart';
import 'package:sea_catering/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:sea_catering/common/widgets/texts/section_heading.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';
import 'package:sea_catering/utils/constants/sizes.dart';

class SubCategoriesMeatScreens extends StatelessWidget {
  const SubCategoriesMeatScreens({super.key});

  final List<Map<String, String>> topProducts = const [
    {'id': 'meat001', 'title': 'Air Friedchicken Salad', 'brand': 'protein', 'price': 'Rp 31.000', 'image': TImages.air_friedchicken_salad},
    {'id': 'meat002', 'title': 'Beef Broccoli Carrot', 'brand': 'royal', 'price': 'Rp 32.000', 'image': TImages.beef_broccoli_carrot},
    {'id': 'meat003', 'title': 'Chicken Curry', 'brand': 'royal', 'price': 'Rp 35.000', 'image': TImages.chicken_curry},
    {'id': 'meat005', 'title': 'Groundmeat Mashed Potato', 'brand': 'diet', 'price': 'Rp 43.000', 'image': TImages.groundmeat_mashed_potato},
  ];

  final List<Map<String, String>> frequentlyAdded = const [
    {'id': 'meat006', 'title': 'Homemade Chicken Nugget', 'brand': 'protein', 'price': 'Rp 50.000', 'image': TImages.homemade_chicken_nugget},
    {'id': 'meat007', 'title': 'Italian Meatballs', 'brand': 'royal', 'price': 'Rp 51.000', 'image': TImages.italian_meatballs},
    {'id': 'meat008', 'title': 'Japanese Katsu', 'brand': 'diet', 'price': 'Rp 54.000', 'image': TImages.japanese_katsu},
    {'id': 'meat009', 'title': 'Mushroom Chicken', 'brand': 'protein', 'price': 'Rp 54.000', 'image': TImages.mushroom_chicken},
  ];

  final List<Map<String, String>> recommended = const [
    {'id': 'meat010', 'title': 'Orange Chicken', 'brand': 'royal', 'price': 'Rp 50.000', 'image': TImages.orange_chicken},
    {'id': 'meat011', 'title': 'Satay Paprika', 'brand': 'diet', 'price': 'Rp 50.000', 'image': TImages.satay_paprika},
    {'id': 'meat012', 'title': 'Steak Blackpepper', 'brand': 'protein', 'price': 'Rp 54.000', 'image': TImages.steak_blackpepper},
    {'id': 'meat013', 'title': 'Sweetsour Fish', 'brand': 'royal', 'price': 'Rp 54.000', 'image': TImages.sweetsour_fish},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Meats'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.banner3,
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
