import 'package:flutter/material.dart';
import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/common/widgets/images/t_rounded_image.dart';
import 'package:sea_catering/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:sea_catering/common/widgets/texts/section_heading.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';
import 'package:sea_catering/utils/constants/sizes.dart';

class SubCategoriesVeggiesScreens extends StatelessWidget {
  const SubCategoriesVeggiesScreens({super.key});

  final List<Map<String, String>> topProducts = const [
    {
      'id': 'veg001',
      'title': 'Balsamic Spinach',
      'brand': 'Diet',
      'price': 'Rp 25.000',
      'image': TImages.balsamic_spinach
    },
    {
      'id': 'veg002',
      'title': 'Bokchoy Garlic',
      'brand': 'Diet',
      'price': 'Rp 25.000',
      'image': TImages.bokchoy_garlic
    },
    {
      'id': 'veg003',
      'title': 'Cabbage Salad',
      'brand': 'Diet',
      'price': 'Rp 22.000',
      'image': TImages.cabbage_salad
    },
    {
      'id': 'veg004',
      'title': 'Caprese Salad',
      'brand': 'Diet',
      'price': 'Rp 28.000',
      'image': TImages.caprese_salad
    },
  ];

  final List<Map<String, String>> frequentlyAdded = const [
    {
      'id': 'veg005',
      'title': 'Celery Salad Apple',
      'brand': 'Diet',
      'price': 'Rp 20.000',
      'image': TImages.celerysalad_apple
    },
    {
      'id': 'veg006',
      'title': 'Corn Steamed',
      'brand': 'Diet',
      'price': 'Rp 18.000',
      'image': TImages.corn_steamed
    },
    {
      'id': 'veg007',
      'title': 'Parmesan Brussel Sprout',
      'brand': 'Diet',
      'price': 'Rp 28.000',
      'image': TImages.parmesan_brussel_sprout
    },
    {
      'id': 'veg008',
      'title': 'Roasted Cauliflower',
      'brand': 'Diet',
      'price': 'Rp 25.000',
      'image': TImages.roasted_cauliflower
    },
  ];

  final List<Map<String, String>> recommended = const [
    {
      'id': 'veg009',
      'title': 'Roasted Garlic Mushroom',
      'brand': 'Diet',
      'price': 'Rp 28.000',
      'image': TImages.roasted_garlic_mushroom
    },
    {
      'id': 'veg010',
      'title': 'Roasted Greenbeans',
      'brand': 'Diet',
      'price': 'Rp 22.000',
      'image': TImages.roasted_greenbeans
    },
    {
      'id': 'veg011',
      'title': 'Sauteed Carrots',
      'brand': 'Diet',
      'price': 'Rp 20.000',
      'image': TImages.sauteed_carrots
    },
    {
      'id': 'quick010',
      'title': 'Es Dawet Sugarfree',
      'brand': 'Diet',
      'price': 'Rp 22.000',
      'image': TImages.es_dawet_sugarfree
    },
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
