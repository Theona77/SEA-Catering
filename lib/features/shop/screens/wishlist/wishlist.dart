import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/common/widgets/icon/t_circular_icon.dart';
import 'package:sea_catering/common/widgets/layouts/grid_layout.dart';
import 'package:sea_catering/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:sea_catering/data/allproduct/allproduct.dart';
import 'package:sea_catering/features/shop/controllers/wishlist.dart';
import 'package:sea_catering/features/shop/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WishlistController.instance;

    return Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const HomeScreen()),
          ),
        ],
      ),

      body: Obx(() {
        final wishlistIds = controller.wishlistIds.toList();

        if (wishlistIds.isEmpty) {
          return const Center(child: Text('Your wishlist is empty.'));
        }

        // 🧠 Ganti dengan cara ambil produk lengkap berdasarkan ID
        final products = allProducts.where((product) => wishlistIds.contains(product['id'])).toList();

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
