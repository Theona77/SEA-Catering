import 'package:flutter/material.dart';
import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/common/widgets/layouts/grid_layout.dart';
import 'package:sea_catering/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';
import 'package:sea_catering/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> allFruitProducts = [
      {
        'title': 'Jeruk 500 g',
        'brand': 'IndoFresh',
        'price': 'Rp 30.000',
        'image': TImages.jeruk
      },
      {
        'title': 'Petai 750 g',
        'brand': 'GreenGarden',
        'price': 'Rp 45.000',
        'image': TImages.petai
      },
      {
        'title': 'Kentang 2 kg',
        'brand': 'FreshMart',
        'price': 'Rp 55.000',
        'image': TImages.potato
      },
      {
        'title': 'Strawberry 1 kg',
        'brand': 'FarmFresh',
        'price': 'Rp 55.000',
        'image': TImages.strawberry
      },
      {
        'title': 'Kencur 1 kg',
        'brand': 'TaniSubur',
        'price': 'Rp 60.000',
        'image': TImages.kencur
      },
      {
        'title': 'Semangka 1 kg',
        'brand': 'LocalFarm',
        'price': 'Rp 60.000',
        'image': TImages.semangka
      },
      {
        'title': 'Mango 250 g',
        'brand': 'GreenLeaf',
        'price': 'Rp 12.000',
        'image': TImages.mango
      },
      {
        'title': 'Bawang Merah',
        'brand': 'EcoFresh',
        'price': 'Rp 15.000',
        'image': TImages.bawangMerah
      },
      {
        'title': 'Bawang Putih',
        'brand': 'AgriMarket',
        'price': 'Rp 14.000',
        'image': TImages.bawangPutih
      },
      {
        'title': 'Chili',
        'brand': 'SayurBox',
        'price': 'Rp 20.000',
        'image': TImages.chili
      },
    ];

    return Scaffold(
      appBar: TAppBar(title: const Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Dropdown Sort
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Sort By',
                    prefixIcon: Icon(Iconsax.sort),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    // Sorting logic (optional)
                  },
                  items: const [
                    DropdownMenuItem(value: 'name', child: Text('Name')),
                    DropdownMenuItem(value: 'higher_price', child: Text('Higher Price')),
                    DropdownMenuItem(value: 'lower_price', child: Text('Lower Price')),
                    DropdownMenuItem(value: 'sale', child: Text('Sale')),
                    DropdownMenuItem(value: 'newest', child: Text('Newest')),
                    DropdownMenuItem(value: 'popularity', child: Text('Popularity')),
                  ],
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// Grid of Products
              TGridLayout(
                itemCount: allFruitProducts.length,
                itemBuilder: (_, index) {
                  final product = allFruitProducts[index];
                  return TProductCardVertical(
                    productId: product['id']!,
                    imageUrl: product['image']!,
                    title: product['title']!,
                    brand: product['brand']!,
                    price: product['price']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
