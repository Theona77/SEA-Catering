import 'package:sea_catering/features/shop/screens/sub_category/sub_category_meat.dart';
import 'package:sea_catering/features/shop/screens/sub_category/sub_category_soups.dart';
import 'package:sea_catering/features/shop/screens/sub_category/sub_category_healthy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_catering/features/shop/screens/sub_category/sub_category_veggies.dart';
import 'package:sea_catering/features/shop/screens/sub_category/sub_category_drink.dart';
import 'package:sea_catering/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:sea_catering/utils/constants/image_strings.dart';

import '../../sub_category/sub_category_quick.dart';
import '../../sub_category/sub_category_snacks.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'image': TImages.veggie_logo,
        'title': 'Veggie',
        'screen': () => const SubCategoriesVeggiesScreens(),
      },
      {
        'image': TImages.drink_logo,
        'title': 'Drinks',
        'screen': () => const SubCategoriesDrinkScreens(),
      },
      {
        'image': TImages.meat_logo,
        'title': 'Meats',
        'screen': () => const SubCategoriesMeatScreens(),
      },
      {
        'image': TImages.soup_logo,
        'title': 'Soups',
        'screen': () => const SubCategoriesSoupsScreens(),
      },
      {
        'image': TImages.quick_logo,
        'title': 'Quick',
        'screen': () => const SubCategoriesQuickScreens(),
      },
      {
        'image': TImages.snack_logo,
        'title': 'Snacks',
        'screen': () => const SubCategoriesSnacksScreens(),
      },
      {
        'image': TImages.fam_logo,
        'title': 'Healthy',
        'screen': () => const SubCategoriesHealthyScreens(),
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
