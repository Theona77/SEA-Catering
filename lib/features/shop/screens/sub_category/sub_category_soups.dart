import 'package:flutter/material.dart';
import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/common/widgets/images/t_rounded_image.dart';
import 'package:sea_catering/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:sea_catering/common/widgets/texts/section_heading.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';
import 'package:sea_catering/utils/constants/sizes.dart';

class SubCategoriesSoupsScreens extends StatelessWidget {
  const SubCategoriesSoupsScreens({super.key});

  final List<Map<String, String>> topProducts = const [
    {'id': 'soup001', 'title': 'Lentil Soup', 'brand': 'Royal', 'price': 'Rp 30.000', 'image': TImages.lentil_soup},
    {'id': 'soup002', 'title': 'Wonton Soup', 'brand': 'Royal', 'price': 'Rp 45.000', 'image': TImages.wonton_soup},
    {'id': 'soup003', 'title': 'Sweet Potato Soup', 'brand': 'Diet', 'price': 'Rp 55.000', 'image': TImages.sweet_potato_soup},
    {'id': 'soup004', 'title': 'Potato Leak Soup', 'brand': 'Diet', 'price': 'Rp 55.000', 'image': TImages.potato_leak_soup},
  ];

  final List<Map<String, String>> frequentlyAdded = const [
    {'id': 'soup005', 'title': 'Pho', 'brand': 'Royal', 'price': 'Rp 52.000', 'image': TImages.pho},
    {'id': 'soup006', 'title': 'Japanese Miso Soup', 'brand': 'Royal', 'price': 'Rp 40.000', 'image': TImages.japanese_miso_soup},
    {'id': 'soup007', 'title': 'Egg Drop Soup', 'brand': 'Protein', 'price': 'Rp 62.000', 'image': TImages.egg_drop_soup},
    {'id': 'soup008', 'title': 'Creamy Cauliflower Soup', 'brand': 'Diet', 'price': 'Rp 30.000', 'image': TImages.creamy_cauliflower_soup},
  ];

  final List<Map<String, String>> recommended = const [
    {'id': 'soup009', 'title': 'Creamy Mushroom Soup', 'brand': 'Diet', 'price': 'Rp 21.000', 'image': TImages.creamy_mushroom_soup},
    {'id': 'soup010', 'title': 'Chicken Soup', 'brand': 'Protein', 'price': 'Rp 33.000', 'image': TImages.chicken_soup},
    {'id': 'soup011', 'title': 'Tomato Basil Soup', 'brand': 'Diet', 'price': 'Rp 28.000', 'image': TImages.tomato_basil_soup},
    {'id': 'soup012', 'title': 'Thai Coconut Soup', 'brand': 'Royal', 'price': 'Rp 35.000', 'image': TImages.thai_coconut_soup},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Soups'), showBackArrow: true),
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
