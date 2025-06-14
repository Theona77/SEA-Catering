import 'package:flutter/material.dart';
import 'package:appppppp/common/widgets/appbar/appbar.dart';
import 'package:appppppp/common/widgets/images/t_rounded_image.dart';
import 'package:appppppp/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:appppppp/common/widgets/texts/section_heading.dart';
import 'package:appppppp/utils/constants/image_strings.dart';
import 'package:appppppp/utils/constants/sizes.dart';

class SubCategoriesScreens extends StatelessWidget {
  const SubCategoriesScreens({super.key});

  final List<Map<String, String>> topProducts = const [
    {'id': 'veg001', 'title': 'Bayam 300 g', 'brand': 'IndoFresh', 'price': 'Rp 30.000', 'image': TImages.spinach},
    {'id': 'veg002', 'title': 'Tomat Segar 500 g', 'brand': 'GreenGarden', 'price': 'Rp 45.000', 'image': TImages.tomato},
    {'id': 'veg003', 'title': 'Jagung 1 kg', 'brand': 'FreshMart', 'price': 'Rp 55.000', 'image': TImages.corn},
    {'id': 'veg004', 'title': 'Mentimun 1 kg', 'brand': 'FreshMart', 'price': 'Rp 55.000', 'image': TImages.cucumber},
  ];

  final List<Map<String, String>> frequentlyAdded = const [
    {'id': 'veg005', 'title': 'Jamur Enoki 100 g', 'brand': 'FarmFresh', 'price': 'Rp 55.000', 'image': TImages.enoki},
    {'id': 'veg006', 'title': 'Bayam Merah 100 g', 'brand': 'CherryKing', 'price': 'Rp 40.000', 'image': TImages.redSpinach},
    {'id': 'veg007', 'title': 'Kol 5 kg', 'brand': 'TaniSubur', 'price': 'Rp 145.000', 'image': TImages.cabbage},
    {'id': 'veg008', 'title': 'Daun Bawang 3 kg', 'brand': 'LocalFarm', 'price': 'Rp 30.000', 'image': TImages.chives},
  ];

  final List<Map<String, String>> recommended = const [
    {'id': 'veg009', 'title': 'Cabai 250 g', 'brand': 'GreenLeaf', 'price': 'Rp 12.000', 'image': TImages.chili},
    {'id': 'veg010', 'title': 'Brocoli 50 g', 'brand': 'EcoFresh', 'price': 'Rp 15.000', 'image': TImages.product1},
    {'id': 'veg011', 'title': 'Petai 300 g', 'brand': 'AgriMarket', 'price': 'Rp 14.000', 'image': TImages.beanSprouts},
    {'id': 'veg012', 'title': 'Kentang 200 g', 'brand': 'SayurBox', 'price': 'Rp 20.000', 'image': TImages.product3},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Vegetables'), showBackArrow: true),
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
