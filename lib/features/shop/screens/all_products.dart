import 'package:flutter/material.dart';
import 'package:sea_catering/common/widgets/appbar/appbar.dart';
import 'package:sea_catering/common/widgets/layouts/grid_layout.dart';
import 'package:sea_catering/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:sea_catering/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/allproduct/allproduct.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  List<Map<String, String>> filteredProducts = [];
  String? sortBy;

  @override
  void initState() {
    super.initState();
    filteredProducts = List<Map<String, String>>.from(allProducts);
  }

  void sortProducts(String? value) {
    setState(() {
      sortBy = value;
      filteredProducts = List<Map<String, String>>.from(allProducts);

      if (value == 'name') {
        filteredProducts.sort((a, b) => a['title']!.compareTo(b['title']!));
      } else if (value == 'higher_price') {
        filteredProducts.sort((b, a) => _parsePrice(a['price']!).compareTo(_parsePrice(b['price']!)));
      } else if (value == 'lower_price') {
        filteredProducts.sort((a, b) => _parsePrice(a['price']!).compareTo(_parsePrice(b['price']!)));
      } else if (value == 'protein') {
        filteredProducts = filteredProducts.where((p) => p['brand']!.toLowerCase() == 'protein').toList();
      } else if (value == 'diet') {
        filteredProducts = filteredProducts.where((p) => p['brand']!.toLowerCase() == 'diet').toList();
      } else if (value == 'royal') {
        filteredProducts = filteredProducts.where((p) => p['brand']!.toLowerCase() == 'royal').toList();
      }
    });
  }

  int _parsePrice(String price) {
    return int.parse(price.replaceAll('Rp ', '').replaceAll('.', ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: const Text('All Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Dropdown Sort
              DropdownButtonFormField<String>(
                value: sortBy,
                decoration: const InputDecoration(
                  labelText: 'Sort / Filter',
                  prefixIcon: Icon(Iconsax.sort),
                  border: OutlineInputBorder(),
                ),
                onChanged: sortProducts,
                items: const [
                  DropdownMenuItem(value: 'name', child: Text('Sort by Name')),
                  DropdownMenuItem(value: 'higher_price', child: Text('Higher Price')),
                  DropdownMenuItem(value: 'lower_price', child: Text('Lower Price')),
                  DropdownMenuItem(value: 'protein', child: Text('Brand: Protein')),
                  DropdownMenuItem(value: 'diet', child: Text('Brand: Diet')),
                  DropdownMenuItem(value: 'royal', child: Text('Brand: Royal')),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// Grid of Products
              filteredProducts.isEmpty
                  ? const Center(child: Text('No products found.'))
                  : TGridLayout(
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
