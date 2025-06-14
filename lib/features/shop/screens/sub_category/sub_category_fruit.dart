import 'package:appppppp/features/shop/screens/sub_category/allproduct/sub_category_bean_allproduct.dart';
import 'package:flutter/material.dart';
import 'package:appppppp/common/widgets/appbar/appbar.dart';
import 'package:appppppp/common/widgets/images/t_rounded_image.dart';
import 'package:appppppp/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:appppppp/common/widgets/texts/section_heading.dart';
import 'package:appppppp/utils/constants/image_strings.dart';
import 'package:appppppp/utils/constants/sizes.dart';

class SubCategoriesFruitScreens extends StatelessWidget {
  const SubCategoriesFruitScreens({super.key});

  final List<Map<String, String>> topProducts = const [
    {'id': 'fruit001', 'title': 'Jeruk 500 g', 'brand': 'IndoFresh', 'price': 'Rp 30.000', 'image': TImages.jeruk},
    {'id': 'fruit002', 'title': 'Anggur 750 g', 'brand': 'GreenGarden', 'price': 'Rp 45.000', 'image': TImages.grapeFruit},
    {'id': 'fruit003', 'title': 'Lime 250 g', 'brand': 'FreshMart', 'price': 'Rp 55.000', 'image': TImages.lime},
    {'id': 'fruit004', 'title': 'Lemon 250 g', 'brand': 'FreshFarm', 'price': 'Rp 55.000', 'image': TImages.lemon},
  ];

  final List<Map<String, String>> frequentlyAdded = const [
    {'id': 'fruit005', 'title': 'Strawberry 1 kg', 'brand': 'FarmFresh', 'price': 'Rp 55.000', 'image': TImages.strawberry},
    {'id': 'fruit006', 'title': 'Cherry 2 kg', 'brand': 'CherryKing', 'price': 'Rp 40.000', 'image': TImages.cherry},
    {'id': 'fruit007', 'title': 'Buah Naga 1 kg', 'brand': 'TaniSubur', 'price': 'Rp 60.000', 'image': TImages.buahNaga},
    {'id': 'fruit008', 'title': 'Semangka 1 kg', 'brand': 'LocalFarm', 'price': 'Rp 60.000', 'image': TImages.semangka},
  ];

  final List<Map<String, String>> recommended = const [
    {'id': 'fruit009', 'title': 'Mango 250 g', 'brand': 'GreenLeaf', 'price': 'Rp 12.000', 'image': TImages.mango},
    {'id': 'fruit010', 'title': 'Papaya', 'brand': 'EcoFresh', 'price': 'Rp 15.000', 'image': TImages.papaya},
    {'id': 'fruit011', 'title': 'Pineapple', 'brand': 'AgriMarket', 'price': 'Rp 14.000', 'image': TImages.pineapple},
    {'id': 'fruit012', 'title': 'Banana', 'brand': 'SayurBox', 'price': 'Rp 20.000', 'image': TImages.banana},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Fruits'), showBackArrow: true),
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
              TSectionHeading(title: 'Top Product', onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AllFruitProductsScreen()),
                );
              }),
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
              TSectionHeading(title: 'Frequently Added', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AllFruitProductsScreen()),
                );
              }),
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
              TSectionHeading(title: 'Recommended', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AllFruitProductsScreen()),
                );
              }),
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
