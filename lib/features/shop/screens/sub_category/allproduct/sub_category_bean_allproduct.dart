import 'package:sea_catering/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/common/widgets/layouts/grid_layout.dart';
import 'package:sea_catering/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:sea_catering/utils/constants/sizes.dart';

class AllFruitProductsScreen extends StatelessWidget {
  const AllFruitProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> allFruitProducts = [
      {
        'id': 'drink001',
        'title': 'Mixed Berry Smoothie',
        'brand': 'Protein',
        'price': 'Rp 30.000',
        'image': TImages.mixedberry_smoothie
      },
      {
        'id': 'prod002',
        'title': 'Anggur 750 g',
        'brand': 'Royal',
        'price': 'Rp 45.000',
        'image': TImages.grapeFruit
      },
      {
        'id': 'prod003',
        'title': 'Lime 250 g',
        'brand': 'Diet',
        'price': 'Rp 55.000',
        'image': TImages.lime
      },
      {
        'id': 'prod004',
        'title': 'Strawberry 1 kg',
        'brand': 'Royal',
        'price': 'Rp 55.000',
        'image': TImages.strawberry
      },
      {
        'id': 'prod005',
        'title': 'Buah Naga 1 kg',
        'brand': 'Diet',
        'price': 'Rp 60.000',
        'image': TImages.buahNaga
      },
      {
        'id': 'prod006',
        'title': 'Semangka 1 kg',
        'brand': 'Diet',
        'price': 'Rp 60.000',
        'image': TImages.semangka
      },
      {
        'id': 'prod007',
        'title': 'Mango 250 g',
        'brand': 'Royal',
        'price': 'Rp 12.000',
        'image': TImages.mango
      },
      {
        'id': 'prod008',
        'title': 'Papaya',
        'brand': 'Royal',
        'price': 'Rp 15.000',
        'image': TImages.papaya
      },
      {
        'id': 'prod009',
        'title': 'Pineapple',
        'brand': 'Royal',
        'price': 'Rp 14.000',
        'image': TImages.pineapple
      },
      {
        'id': 'prod010',
        'title': 'Banana',
        'brand': 'Royal',
        'price': 'Rp 20.000',
        'image': TImages.banana
      },
    ];

    return Scaffold(
      appBar: TAppBar(
        title: const Text('Top Product'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TGridLayout(
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
      ),
    );
  }
}
