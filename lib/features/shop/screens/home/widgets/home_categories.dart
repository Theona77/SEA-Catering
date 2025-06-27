import 'package:sea_catering/features/shop/screens/sub_category/sub_category_beans.dart';
import 'package:sea_catering/features/shop/screens/sub_category/sub_category_herbs.dart';
import 'package:sea_catering/features/shop/screens/sub_category/sub_category_nuts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_catering/features/shop/screens/sub_category/sub_category.dart';
import 'package:sea_catering/features/shop/screens/sub_category/sub_category_fruit.dart';
import 'package:sea_catering/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'image': TImages.veggies,
        'title': 'Vegetables',
        'screen': () => const SubCategoriesScreens(),
      },
      {
        'image': TImages.fruits,
        'title': 'Fruits',
        'screen': () => const SubCategoriesFruitScreens(),
      },
      {
        'image': TImages.beans,
        'title': 'Nuts',
        'screen': () => const SubCategoriesNutsScreens(),
      },
      {
        'image': TImages.herbs,
        'title': 'Herbs',
        'screen': () => const SubCategoriesHerbsScreens(),
      },
      {
        'image': TImages.beans,
        'title': 'Seeds',
        'screen': () => const SubCategoriesSeedsScreens(),
      },
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, index) {
          final category = categories[index];
          return TVerticalImageText(
            image: category['image'],
            title: category['title'],
            onTap: () => Get.to(category['screen']()),
          );
        },
      ),
    );
  }
}
