import 'package:sea_catering/common/widgets/layouts/grid_layout.dart';
import 'package:sea_catering/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:sea_catering/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'id': 'prod01',
        'image': TImages.jeruk,
        'title': 'Jeruk 500 g',
        'brand': 'Diet',
        'price': 'Rp 30.000',
      },
      {
        'id': 'prod02',
        'image': TImages.grapeFruit,
        'title': 'Anggur 750 g',
        'brand': 'Royal',
        'price': 'Rp 45.000',
      },
      {
        'id': 'prod03',
        'image': TImages.strawberry,
        'title': 'Strawberry 1 kg',
        'brand': 'Royal',
        'price': 'Rp 55.000',
      },
      {
        'id': 'prod04',
        'image': TImages.kencur,
        'title': 'Kencur 250 g',
        'brand': 'Diet',
        'price': 'Rp 55.000',
      },
    ];

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --- Brands Showcase
              const TBrandShowcase(images: [TImages.product2, TImages.product3, TImages.product4]),
              const TBrandShowcase(images: [TImages.product2, TImages.product3, TImages.product4]),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// --- Product Section
              TSectionHeading(title: 'You might like', onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(
                itemCount: products.length,
                itemBuilder: (_, index) {
                  final product = products[index];
                  return TProductCardVertical(
                    productId: product['id']!,
                    imageUrl: product['image']!,
                    title: product['title']!,
                    brand: product['brand']!,
                    price: product['price']!,
                  );
                },
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
