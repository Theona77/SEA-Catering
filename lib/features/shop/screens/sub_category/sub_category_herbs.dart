import 'package:flutter/material.dart';
import 'package:appppppp/common/widgets/appbar/appbar.dart';
import 'package:appppppp/common/widgets/images/t_rounded_image.dart';
import 'package:appppppp/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:appppppp/common/widgets/texts/section_heading.dart';
import 'package:appppppp/utils/constants/image_strings.dart';
import 'package:appppppp/utils/constants/sizes.dart';

class SubCategoriesHerbsScreens extends StatelessWidget {
  const SubCategoriesHerbsScreens({super.key});

  final List<Map<String, String>> topProducts = const [
    {'id': 'herb001', 'title': 'Gandaria 500 g', 'brand': 'IndoFresh', 'price': 'Rp 30.000', 'image': TImages.gandaria},
    {'id': 'herb002', 'title': 'Cengkeh 750 g', 'brand': 'GreenGarden', 'price': 'Rp 45.000', 'image': TImages.cengkeh},
    {'id': 'herb003', 'title': 'Kencur 250 g', 'brand': 'FreshMart', 'price': 'Rp 55.000', 'image': TImages.kencur},
    {'id': 'herb004', 'title': 'Lada 250 g', 'brand': 'FreshMart', 'price': 'Rp 55.000', 'image': TImages.lada},
  ];

  final List<Map<String, String>> frequentlyAdded = const [
    {'id': 'herb005', 'title': 'Bawang Merah 1 kg', 'brand': 'FarmFresh', 'price': 'Rp 55.000', 'image': TImages.bawangMerah},
    {'id': 'herb006', 'title': 'Kunyit 300 g', 'brand': 'CherryKing', 'price': 'Rp 40.000', 'image': TImages.kunyit},
    {'id': 'herb007', 'title': 'Lengkuas 25 g', 'brand': 'TaniSubur', 'price': 'Rp 60.000', 'image': TImages.lengkuas},
    {'id': 'herb008', 'title': 'Kayu Manis 10 g', 'brand': 'LocalFarm', 'price': 'Rp 30.000', 'image': TImages.kayuManis},
  ];

  final List<Map<String, String>> recommended = const [
    {'id': 'herb009', 'title': 'Bawang Putih 250 g', 'brand': 'GreenLeaf', 'price': 'Rp 12.000', 'image': TImages.bawangPutih},
    {'id': 'herb010', 'title': 'Kluwek 300 g', 'brand': 'EcoFresh', 'price': 'Rp 15.000', 'image': TImages.kluwek},
    {'id': 'herb011', 'title': 'Kapulaga 100 g', 'brand': 'AgriMarket', 'price': 'Rp 14.000', 'image': TImages.kapulaga},
    {'id': 'herb012', 'title': 'Bawang Bombai 500 g', 'brand': 'SayurBox', 'price': 'Rp 20.000', 'image': TImages.bombai},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Herbs'), showBackArrow: true),
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
