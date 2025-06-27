import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sea_catering/common/widgets/layouts/grid_layout.dart';
import 'package:sea_catering/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:sea_catering/data/allproduct/allproduct.dart';
import 'package:sea_catering/features/shop/controllers/wishlist.dart';
import 'package:sea_catering/features/shop/screens/store/store.dart';
import 'package:sea_catering/utils/constants/sizes.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WishlistController.instance;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: iconColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
            icon: Icon(Iconsax.add, color: iconColor),
            onPressed: () => Get.to(() => const StoreScreen(), preventDuplicates: false),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      body: Obx(() {
        final wishlistIds = controller.wishlistIds.toList();

        if (wishlistIds.isEmpty) {
          return const Center(child: Text('Your wishlist is empty.'));
        }

        final products = allProducts
            .where((product) => wishlistIds.contains(product['id']))
            .toList();

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TGridLayout(
              itemCount: products.length,
              itemBuilder: (_, index) {
                final item = products[index];
                return TProductCardVertical(
                  productId: item['id'] ?? '',
                  imageUrl: item['image'] ?? '',
                  title: item['title'] ?? '',
                  brand: item['brand'] ?? '',
                  price: item['price'] ?? '',
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
