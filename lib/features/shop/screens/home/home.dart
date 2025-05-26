import 'package:appppppp/common/widgets/appbar/appbar.dart';
import 'package:appppppp/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:appppppp/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:appppppp/features/authentication/screens/onboarding.dart';
import 'package:appppppp/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:appppppp/features/shop/screens/home/widgets/home_categories.dart';
import 'package:appppppp/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:appppppp/utils/device/device_utility.dart';
import 'package:appppppp/utils/helpers/helper_functions.dart';
import 'package:appppppp/utils/theme/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
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
                    )
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
                  TSectionHeading(title: 'Popular Product', onPressed: (){},),
                  SizedBox(height: TSizes.spaceBtwItems),

                  /// -- Popular Products --
                  TGridLayout(itemCount: 6, itemBuilder: (_, index) => const TProductCardVertical(),),
                ],
              )
            ),

          ],
        ),
      )
    );
  }
}

