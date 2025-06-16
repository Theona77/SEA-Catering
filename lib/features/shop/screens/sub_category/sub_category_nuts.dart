import 'package:flutter/material.dart';
import 'package:appppppp/common/widgets/appbar/appbar.dart';
import 'package:appppppp/common/widgets/images/t_rounded_image.dart';
import 'package:appppppp/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:appppppp/common/widgets/texts/section_heading.dart';
import 'package:appppppp/utils/constants/image_strings.dart';
import 'package:appppppp/utils/constants/sizes.dart';

class SubCategoriesNutsScreens extends StatelessWidget {
  const SubCategoriesNutsScreens({super.key});

  final List<Map<String, String>> topProducts = const [
    {'id': 'nuts001', 'title': 'Kacang Almond 10 g', 'brand': 'IndoFresh', 'price': 'Rp 30.000', 'image': TImages.almond},
    {'id': 'nuts002', 'title': 'Kacang Arab 10 g', 'brand': 'GreenGarden', 'price': 'Rp 45.000', 'image': TImages.arab},
    {'id': 'nuts003', 'title': 'Kacang Hijau 10 g', 'brand': 'FreshMart', 'price': 'Rp 55.000', 'image': TImages.hijau},
    {'id': 'nuts004', 'title': 'Kacang Pistaschio 10 g', 'brand': 'FreshMart', 'price': 'Rp 55.000', 'image': TImages.pistaschio},
  ];

  final List<Map<String, String>> frequentlyAdded = const [
    {'id': 'nuts005', 'title': 'Kacang Hitam 10 g', 'brand': 'FarmFresh', 'price': 'Rp 55.000', 'image': TImages.hitam},
    {'id': 'nuts006', 'title': 'Kacang Kenari 10 g', 'brand': 'CherryKing', 'price': 'Rp 40.000', 'image': TImages.kenari},
    {'id': 'nuts007', 'title': 'Kacang Macadaima 10 g', 'brand': 'TaniSubur', 'price': 'Rp 60.000', 'image': TImages.macadaima},
    {'id': 'nuts008', 'title': 'Kacang Merah 10 g', 'brand': 'LocalFarm', 'price': 'Rp 30.000', 'image': TImages.merah},
  ];

  final List<Map<String, String>> recommended = const [
    {'id': 'nuts009', 'title': 'Kacang Mete 10 g', 'brand': 'GreenLeaf', 'price': 'Rp 12.000', 'image': TImages.mete},
    {'id': 'nuts010', 'title': 'Kacang Pinus 10 g', 'brand': 'EcoFresh', 'price': 'Rp 15.000', 'image': TImages.pinus},
    {'id': 'nuts011', 'title': 'Kacang Polong 10 g', 'brand': 'AgriMarket', 'price': 'Rp 14.000', 'image': TImages.polong},
    {'id': 'nuts012', 'title': 'Kacang Tanah 10 g', 'brand': 'SayurBox', 'price': 'Rp 20.000', 'image': TImages.tanah},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Nuts'), showBackArrow: true),
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
