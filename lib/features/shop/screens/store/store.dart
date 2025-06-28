import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_catering/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:sea_catering/common/widgets/layouts/grid_layout.dart';
import 'package:sea_catering/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:sea_catering/common/widgets/texts/section_heading.dart';
import 'package:sea_catering/features/shop/screens/all_products.dart';
import 'package:sea_catering/features/shop/screens/home/widgets/home_categories.dart';
import 'package:sea_catering/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:sea_catering/utils/constants/colors.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';
import 'package:sea_catering/utils/constants/sizes.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../data/allproduct/allproduct.dart';
import '../../../../common/widgets/appbar/appbar.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List<Map<String, String>> filteredProducts = allProducts;

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
              TSearchContainer(
                onSearchChanged: (searchText) {
                  setState(() {
                    filteredProducts = allProducts
                        .where((product) => product['title']!
                        .toLowerCase()
                        .contains(searchText.toLowerCase()))
                        .toList();
                  });
                },
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              /// --- Categories ---
              TSectionHeading(title: 'Categories', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),
              THomeCategories(),
              SizedBox(height: TSizes.spaceBtwSections),

              /// --- Promo Slider ---
              TPromoSlider(banners: [
                TImages.banner2,
                TImages.banner3,
                TImages.banner4,
                TImages.banner5
              ]),
              SizedBox(height: TSizes.spaceBtwSections),

              /// --- Popular Products ---
              TSectionHeading(
                  title: 'Popular Product',
                  onPressed: () => Get.to(() => const AllProducts())),
              SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(
                itemCount: filteredProducts.length,
                itemBuilder: (_, index) {
                  final product = filteredProducts[index];
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
