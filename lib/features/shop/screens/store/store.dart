import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sea_catering/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:sea_catering/common/widgets/layouts/grid_layout.dart';
import 'package:sea_catering/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:sea_catering/common/widgets/texts/section_heading.dart';
import 'package:sea_catering/features/shop/screens/store/widgets/category_tab.dart';
import 'package:sea_catering/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../data/allproduct/allproduct.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../all_products.dart';
import '../home/widgets/home_categories.dart';
import '../home/widgets/promo_slider.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Menu", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCartCounterIcon(onPressed: () {}, iconColor: Colors.white),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --- Search Bar ---
              SizedBox(height: TSizes.spaceBtwItems),
              TSearchContainer(text: 'Search In Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
              SizedBox(height: TSizes.spaceBtwSections),

              /// --- Categories ---
              TSectionHeading(title: 'Categories', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),
              THomeCategories(),
              SizedBox(height: TSizes.spaceBtwSections),

              /// --- Promo Slider ---
              TPromoSlider(banners: [TImages.banner1, TImages.banner2, TImages.banner3, TImages.banner4, TImages.banner5]),
              SizedBox(height: TSizes.spaceBtwSections),

              /// --- Popular Products ---
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
      ),
    );
  }
}
