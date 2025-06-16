import 'package:appppppp/data/allproduct/allproduct.dart';
import 'package:appppppp/features/shop/screens/all_products.dart';
import 'package:appppppp/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:appppppp/features/shop/screens/home/widgets/home_categories.dart';
import 'package:appppppp/features/shop/screens/home/widgets/promo_slider.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --- Header --- For Name and Cart
            TPrimaryHeaderContainer(
                child: Column(
                  children: [

                    /// --- Appbar ---
                    THomeAppBar(),
                    SizedBox(height: TSizes.spaceBtwSections),

                    /// Search Bar
                    TSearchContainer(text: 'Search in Store',),
                    SizedBox(height: TSizes.spaceBtwSections),

                    /// Categories
                    Padding(
                      padding: EdgeInsets.only(left: TSizes.defaultSpace),
                      child: Column(
                        children: [

                          /// -- Heading
                          TSectionHeading(title: 'Categories', showActionButton: false, textColor: Colors.white,),
                          SizedBox(height: TSizes.spaceBtwItems),

                          // -- Categories
                          THomeCategories(),
                        ],
                      ),
                    ),
                    SizedBox(height: TSizes.spaceBtwSections),
                  ],
                )
            ),

            /// Body --
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider --
                  TPromoSlider(banners: [TImages.banner1, TImages.banner2, TImages.banner3, TImages.banner4, TImages.banner5],),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Heading ---
                  TSectionHeading(title: 'Popular Product', onPressed: ()=> Get.to(() => const AllProducts())),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// -- Popular Products --
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
              )
            ),
          ],
        ),
      )
    );
  }
}

