import 'package:flutter/material.dart';
import 'package:appppppp/common/widgets/appbar/appbar.dart';
import 'package:appppppp/common/widgets/images/t_rounded_image.dart';
import 'package:appppppp/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:appppppp/common/widgets/texts/section_heading.dart';
import 'package:appppppp/utils/constants/image_strings.dart';
import 'package:appppppp/utils/constants/sizes.dart';

class SubCategoriesSeedsScreens extends StatelessWidget {
  const SubCategoriesSeedsScreens({super.key});

  final List<Map<String, String>> topProducts = const [
    {'id': 'seed001', 'title': 'Barley 10 g', 'brand': 'IndoFresh', 'price': 'Rp 30.000', 'image': TImages.barley},
    {'id': 'seed002', 'title': 'Beras 100 g', 'brand': 'GreenGarden', 'price': 'Rp 45.000', 'image': TImages.beras},
    {'id': 'seed003', 'title': 'Biji Jagung', 'brand': 'FreshMart', 'price': 'Rp 55.000', 'image': TImages.bijiJagung},
    {'id': 'seed004', 'title': 'Buck Wheat 10 g', 'brand': 'FreshMart', 'price': 'Rp 55.000', 'image': TImages.buckWheat},
  ];

  final List<Map<String, String>> frequentlyAdded = const [
    {'id': 'seed005', 'title': 'Chia Seeds 10 g', 'brand': 'FarmFresh', 'price': 'Rp 55.000', 'image': TImages.chiaSeeds},
    {'id': 'seed006', 'title': 'Flax Seeds 10 g', 'brand': 'CherryKing', 'price': 'Rp 40.000', 'image': TImages.flaxseeds},
    {'id': 'seed007', 'title': 'Millet 10 g', 'brand': 'TaniSubur', 'price': 'Rp 60.000', 'image': TImages.millet},
    {'id': 'seed008', 'title': 'Oats 10 g', 'brand': 'LocalFarm', 'price': 'Rp 30.000', 'image': TImages.oats},
  ];

  final List<Map<String, String>> recommended = const [
    {'id': 'seed009', 'title': 'Biji Pumpkin 10 g', 'brand': 'GreenLeaf', 'price': 'Rp 12.000', 'image': TImages.pumpkin},
    {'id': 'seed010', 'title': 'Quinoa 10 g', 'brand': 'EcoFresh', 'price': 'Rp 15.000', 'image': TImages.quinoa},
    {'id': 'seed011', 'title': 'Rye 10 g', 'brand': 'AgriMarket', 'price': 'Rp 14.000', 'image': TImages.rye},
    {'id': 'seed012', 'title': 'Biji Selasih 10 g', 'brand': 'SayurBox', 'price': 'Rp 20.000', 'image': TImages.selasih},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Beans'), showBackArrow: true),
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
