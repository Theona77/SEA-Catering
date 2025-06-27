import 'package:sea_catering/data/allproduct/allproduct.dart';
import 'package:sea_catering/features/shop/screens/all_products.dart';
import 'package:sea_catering/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:sea_catering/features/shop/screens/home/widgets/home_categories.dart';
import 'package:sea_catering/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          /// Main content
          SingleChildScrollView(
            child: Column(
              children: [
                /// --- Header ---
                TPrimaryHeaderContainer(
                  child: Column(
                    children: [
                      SizedBox(height: TSizes.spaceBtwSections),
                      Text(TTexts.appName, style: Theme.of(context).textTheme.headlineLarge!.apply(color: Colors.white)),
                      Text(TTexts.homeAppBarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.white)),
                      SizedBox(height: TSizes.spaceBtwSections),
                      THomeAppBar(),
                      SizedBox(height: TSizes.spaceBtwSections),
                      TSearchContainer(text: 'Search in Store'),
                      SizedBox(height: TSizes.spaceBtwSections),

                      Padding(
                        padding: EdgeInsets.only(left: TSizes.defaultSpace),
                        child: Column(
                          children: [
                            TSectionHeading(title: 'Categories', showActionButton: false, textColor: Colors.white),
                            SizedBox(height: TSizes.spaceBtwItems),
                            THomeCategories(),
                          ],
                        ),
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),
                    ],
                  ),
                ),

                /// --- Body ---
                Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TPromoSlider(banners: [TImages.banner1, TImages.banner2, TImages.banner3, TImages.banner4, TImages.banner5]),
                      SizedBox(height: TSizes.spaceBtwSections),
                      TSectionHeading(title: 'Popular Product', onPressed: () => Get.to(() => const AllProducts())),
                      SizedBox(height: TSizes.spaceBtwItems),
                      TGridLayout(
                        itemCount: allProducts.length,
                        itemBuilder: (_, index) {
                          final product = allProducts[index];
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
              ],
            ),
          ),

          /// --- Chat Button ---
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Contact Manager'),
                    content: const Text('Manager: Brian\nPhone: 08123456789'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.chat),
            ),
          ),
        ],
      ),
    );
  }
}

